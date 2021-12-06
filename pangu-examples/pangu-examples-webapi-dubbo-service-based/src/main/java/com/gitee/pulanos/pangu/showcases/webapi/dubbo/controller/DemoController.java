package com.gitee.pulanos.pangu.showcases.webapi.controller;

import com.gitee.pulanos.pangu.framework.common.Constants;
import com.gitee.pulanos.pangu.framework.common.model.Result;
import com.gitee.pulanos.pangu.framework.common.utils.BeanValidator;
import com.gitee.pulanos.pangu.showcases.webapi.param.CaseIn;
import com.gitee.pulanos.pangu.showcases.webapi.param.CaseOut;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 演示WebAPI Controller
 *
 * @author xiongchun
 */
@Slf4j
@RestController
@RequestMapping("pangu/showcases")
public class DemoController {

    /**
     * 基础 快速成功
     *
     * @return
     */
    @GetMapping("/case1")
    public Result<String> case1() {
        return Result.success("OK");
    }

    /**
     * 传参和快速失败
     *
     * @param id
     * @return
     */
    @RequestMapping("/case2")
    public Result<Long> case2(@RequestParam Long id) {
        log.debug("入参ID:{}", id);
        return Result.fail(Constants.Code.FAIL_CALL_LIMITED, "接口限流（调用次数或调用频率超限)");
    }

    /**
     * 传参和快速失败
     *
     * @param id
     * @return
     */
    @RequestMapping("/case3")
    public Result<Long> case3(@RequestParam Long id) {
        log.debug("入参ID:{}", id);
        return Result.fail(Constants.Code.FAIL_CALL_LIMITED, "接口限流（调用次数或调用频率超限)");
    }

    /**
     * case4
     *
     * @param caseIn
     * @return
     */
    @PostMapping("/case4")
    public Result<CaseOut> case4(@RequestBody CaseIn caseIn) {
        log.debug("CaseIn:{}", caseIn);
        //未做异常拦截器的处理，异常返回的是springMVC框架的数据格式
        BeanValidator.validate(caseIn);
        CaseOut caseOut = new CaseOut();
        caseOut.setId(1L).setName("xiongchun").setAge(18);
        return Result.success(caseOut);
    }

}
