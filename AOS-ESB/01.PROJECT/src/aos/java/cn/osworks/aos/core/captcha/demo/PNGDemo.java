package cn.osworks.aos.core.captcha.demo;

import java.awt.Color;
import java.io.FileOutputStream;

import cn.osworks.aos.core.captcha.color.SingleColorFactory;
import cn.osworks.aos.core.captcha.filter.predefined.CurvesRippleFilterFactory;
import cn.osworks.aos.core.captcha.filter.predefined.DiffuseRippleFilterFactory;
import cn.osworks.aos.core.captcha.filter.predefined.DoubleRippleFilterFactory;
import cn.osworks.aos.core.captcha.filter.predefined.MarbleRippleFilterFactory;
import cn.osworks.aos.core.captcha.filter.predefined.WobbleRippleFilterFactory;
import cn.osworks.aos.core.captcha.service.ConfigurableCaptchaService;
import cn.osworks.aos.core.captcha.utils.encoder.EncoderHelper;

public class PNGDemo {

	public static void main(String[] args) throws Exception {
		for (int counter = 0; counter < 5; counter++) {
			ConfigurableCaptchaService cs = new ConfigurableCaptchaService();
			cs.setColorFactory(new SingleColorFactory(new Color(25, 60, 170)));
			switch (counter % 5) {
			case 0:
				cs.setFilterFactory(new CurvesRippleFilterFactory(cs.getColorFactory()));
				break;
			case 1:
				cs.setFilterFactory(new MarbleRippleFilterFactory());
				break;
			case 2:
				cs.setFilterFactory(new DoubleRippleFilterFactory());
				break;
			case 3:
				cs.setFilterFactory(new WobbleRippleFilterFactory());
				break;
			case 4:
				cs.setFilterFactory(new DiffuseRippleFilterFactory());
				break;
			}
			FileOutputStream fos = new FileOutputStream("patcha_demo" + counter + ".png");
			EncoderHelper.getChallangeAndWriteImage(cs, "png", fos);
			fos.close();
		}
	}
}
