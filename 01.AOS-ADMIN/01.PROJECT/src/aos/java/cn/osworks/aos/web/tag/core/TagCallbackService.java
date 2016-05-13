package cn.osworks.aos.web.tag.core;

import org.springframework.stereotype.Service;

/**
 * 标签模版VM文件回调服务
 *
 * <p/>
 * 提供标签模版VM文件回调。
 * 标签VM回调方法：
 * Java:tagDto.put("tagCallbackService", AOSCxt.getBean("tagCallbackService"));
 * VM:return '$tagCallbackService.test("a1")';
 *
 * @author OSWorks-XC
 * @date 2014-02-06
 */
@Service
public class TagCallbackService {

    /**
     * 转换数据字典表
     *
     * @return
     */
    public String test(String field) {
        System.out.println(field);
        return field;
    }
}
