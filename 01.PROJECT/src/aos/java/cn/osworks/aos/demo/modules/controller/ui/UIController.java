package cn.osworks.aos.demo.modules.controller.ui;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 标签库未分类UI组件演示控制器
 * 
 * @author OSWorks-XC
 */
@Controller
@RequestMapping(value = "demo/ui")
public class UIController {

	/**
	 * 按钮页面初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "initButton")
	public String initButton() {
		return "demo/ui/button.jsp";
	}

}
