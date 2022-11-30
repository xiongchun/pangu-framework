package com.pulanit.pangu.admin.web.config;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.TimeInterval;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.system.SystemUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.gitee.pulanos.pangu.framework.common.Constants;
import com.gitee.pulanos.pangu.framework.common.exception.BizException;
import com.google.common.collect.Maps;
import com.pulanit.pangu.admin.common.AppContext;
import com.pulanit.pangu.admin.common.domain.UserInfo;
import com.pulanit.pangu.admin.system.api.param.LogIn;
import com.pulanit.pangu.admin.web.log.LogQueue;
import com.pulanit.pangu.admin.web.util.CommonUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Map;

/**
 * 日志切面
 */
@Slf4j
@Component
@Aspect
public class ControllerLogAspect {

    @NacosValue(value = "${spring.application.name}")
    private String appName;
    @NacosValue(value = "${app.log.queue.producer.excludes.method-start-with:}", autoRefreshed = true)
    private String[] excludes;

    @NacosValue(value = "${app.log.queue.producer.disabled:false}", autoRefreshed = true)
    private Boolean disabled;

    private static final int LOG_STR_HALF_LENGTH = 100;
    private static final String MSG_SUCCESS = "SUCCESS";


    @Pointcut("execution(* *..controller..*.*(..))")
    public void pointcut() {

    }

    private static final LocalVariableTableParameterNameDiscoverer parameterNameDiscoverer = new LocalVariableTableParameterNameDiscoverer();

    //@Around("pointcut()")
    public Object doAroundMethod(ProceedingJoinPoint point) {
        LogIn logIn = new LogIn();
        UserInfo userInfo = AppContext.getUserInfo();
        if (userInfo != null){
            logIn.setCreatedBy(userInfo.getId()).setCreatedByName(userInfo.getName());
        }
        MethodSignature methodSignature = (MethodSignature)point.getSignature();
        Class beanType = methodSignature.getDeclaringType();
        Method method = methodSignature.getMethod();
        String path = StrUtil.format("{}#{}", beanType.getSimpleName(), method.getName());
        logIn.setPath(path);
        String[] paramNames = parameterNameDiscoverer.getParameterNames(method);
        Map<String, Object> inputMap = Maps.newLinkedHashMap();
        Object[] args = point.getArgs();
        if (ArrayUtil.isNotEmpty(paramNames)){
            for (int i = 0; i < paramNames.length; i++){
                inputMap.put(paramNames[i], ArrayUtil.get(args, i));
            }
        }
        logIn.setInput(CommonUtils.lessStr(JSON.toJSONString(inputMap), LOG_STR_HALF_LENGTH));
        log.info("开始执行 {}, 入参信息 {}", logIn.getPath(), logIn.getInput());
        TimeInterval timer = DateUtil.timer();
        Object obj = null;
        try {
            obj = point.proceed();
            logIn.setSuccess(true).setOutput(CommonUtils.lessStr(JSON.toJSONString(obj), LOG_STR_HALF_LENGTH));
        } catch (Throwable e) {
            logIn.setSuccess(false).setOutput(StrUtil.subWithLength(e.getMessage(), 0, LOG_STR_HALF_LENGTH * 2));
            if (e instanceof BizException){
                throw (BizException)e;
            }else if(e instanceof IllegalArgumentException){
                throw new BizException(Constants.Code.ILLEGAL_ARGUMENT, e.getMessage());
            }else {
                throw new RuntimeException(e);
            }
        }finally {
            logIn.setTimeElapsed(new Long(timer.intervalMs()).intValue());
            log.info("结束执行 {}, [成功: {}] [耗时：{} 毫秒], 出参信息 {} ", logIn.getPath(),logIn.getSuccess(), logIn.getTimeElapsed(),  logIn.getOutput());
            if (!disabled){
                this.saveLogWithAsync(logIn, method.getName());
            }
        }
        return obj;
    }

    private void saveLogWithAsync(LogIn logIn, String methodName){
        try {
            for (String exclude : excludes){
                if (StrUtil.startWith(methodName, exclude, true)){
                    return;
                }
            }
            logIn.setTag(SystemUtil.getHostInfo().getAddress());
            logIn.setAppName(appName).setGmtExecuted(DateUtil.date());
            boolean added = LogQueue.getLogQueue().produce(logIn);
            if (!added){
                log.error("日志队列已满（{}），跳过日志对象持久化：{}", LogQueue.getLogQueue().size(), JSON.toJSONString(logIn));
            }
        } catch (Exception e) {
            log.error("异步持久化日志出错");
        }
    }

}
