package cn.osworks.aos.web.asset;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.BufferedImageOp;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cn.osworks.aos.core.captcha.background.BackgroundFactory;
import cn.osworks.aos.core.captcha.color.ColorFactory;
import cn.osworks.aos.core.captcha.filter.ConfigurableFilterFactory;
import cn.osworks.aos.core.captcha.filter.library.AbstractImageOp;
import cn.osworks.aos.core.captcha.filter.library.WobbleImageOp;
import cn.osworks.aos.core.captcha.font.RandomFontFactory;
import cn.osworks.aos.core.captcha.service.Captcha;
import cn.osworks.aos.core.captcha.service.ConfigurableCaptchaService;
import cn.osworks.aos.core.captcha.text.renderer.BestFitTextRenderer;
import cn.osworks.aos.core.captcha.text.renderer.TextRenderer;
import cn.osworks.aos.core.captcha.word.RandomWordFactory;

import cn.osworks.aos.core.asset.AOSCons;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.WebCxt;
import cn.osworks.aos.core.typewrap.Dto;


/**
 * <b>生成验证码</b>
 * 
 * @author OSWorks-XC
 */
public class VerCodeServlet extends HttpServlet {

	private static final long serialVersionUID = 5126616339795936447L;

	private ConfigurableCaptchaService configurableCaptchaService = null;
	private RandomFontFactory fontFactory = null;
	private RandomWordFactory wordFactory = null;
	private TextRenderer textRenderer = null;

	public VerCodeServlet() {
		super();
	}

	/**
	 * doGet
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * doPost 输出图片流
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dto inDto = WebCxt.getParamAsDto(request);
		doConfig(inDto); //需要动态配置的参数
		
		response.setContentType("image/png");
		response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate"); // HTTP
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0

		HttpSession session = request.getSession(true);
		OutputStream outputStream = response.getOutputStream();

		// 得到验证码对象,有验证码图片和验证码字符串
		Captcha captcha = configurableCaptchaService.getCaptcha();
		// 取得验证码字符串放入Session
		String verificationCode = captcha.getChallenge();
		session.setAttribute(AOSCons.VERCODE, verificationCode);
		// 取得验证码图片并输出
		BufferedImage bufferedImage = captcha.getImage();
		ImageIO.write(bufferedImage, "png", outputStream);

		outputStream.flush();
		outputStream.close();
	}
	
	/**
	 * 需要动态配置的参数
	 */
	private void doConfig(Dto inDto){
		// 随机字体生成器
		fontFactory = new RandomFontFactory();
		int fontSize = 25;
		if (AOSUtils.isNotEmpty(inDto.getString("fontSize"))) {
			fontSize = new Integer(inDto.getString("fontSize")).intValue();
		}
		fontFactory.setMaxSize(fontSize);
		fontFactory.setMinSize(fontSize);
		configurableCaptchaService.setFontFactory(fontFactory);
		
		// 随机字符生成器,去除掉容易混淆的字母和数字,如o和0等
		wordFactory = new RandomWordFactory();
		String characters = "abcdefhkty2345678";
		if (AOSUtils.isNotEmpty(inDto.getString("characters"))) {
			characters = inDto.getString("characters");
		}
		wordFactory.setCharacters(characters);
		Integer length = Integer.valueOf(4);
		if (AOSUtils.isNotEmpty(inDto.getString("length"))) {
			length = Integer.valueOf((inDto.getString("length")));
		}
		wordFactory.setMaxLength(length);
		wordFactory.setMinLength(length);
		configurableCaptchaService.setWordFactory(wordFactory);

		// 验证码图片的大小
		Integer width = Integer.valueOf(100);
		if (AOSUtils.isNotEmpty(inDto.getString("width"))) {
			width = Integer.valueOf((inDto.getString("width")));
		}
		Integer height = Integer.valueOf(30);
		if (AOSUtils.isNotEmpty(inDto.getString("height"))) {
			height = Integer.valueOf((inDto.getString("height")));
		}
		configurableCaptchaService.setWidth(width);
		configurableCaptchaService.setHeight(height);
	}

	/**
	 * Servlet初始化方法：只会初始化一次。如果要做相关动态处理，请将代码移到doPost。
	 */
	public void init() throws ServletException {
		configurableCaptchaService = new ConfigurableCaptchaService();
		
		// 颜色创建工厂
		// 单色的
		// configurableCaptchaService.setColorFactory(new
		// SingleColorFactory(newColor(25, 60, 170)));
		// 彩色的
		configurableCaptchaService.setColorFactory(new ColorFactory() {
			private Random random = new Random();
			@Override
			public Color getColor(int x) {
				int[] c = new int[3];
				int i = random.nextInt(c.length);
				for (int fi = 0; fi < c.length; fi++) {
					if (fi == i) {
						c[fi] = random.nextInt(71);
					} else {
						c[fi] = random.nextInt(256);
					}
				}
				return new Color(c[0], c[1], c[2]);
			}
		});

		// 自定义验证码图片背景
		MyCustomBackgroundFactory backgroundFactory = new MyCustomBackgroundFactory();
		configurableCaptchaService.setBackgroundFactory(backgroundFactory);

		// 图片滤镜设置
		ConfigurableFilterFactory filterFactory = new ConfigurableFilterFactory();
		List<BufferedImageOp> filters = new ArrayList<BufferedImageOp>();
		WobbleImageOp wobbleImageOp = new WobbleImageOp();
		wobbleImageOp.setEdgeMode(AbstractImageOp.EDGE_CLAMP);
		wobbleImageOp.setxAmplitude(1.0);
		wobbleImageOp.setyAmplitude(2.0);
		filters.add(wobbleImageOp);
		filterFactory.setFilters(filters);
		configurableCaptchaService.setFilterFactory(filterFactory);
		
		// 文字渲染器设置
		textRenderer = new BestFitTextRenderer();
		textRenderer.setBottomMargin(1);
		textRenderer.setTopMargin(1);
		configurableCaptchaService.setTextRenderer(textRenderer);
	}

	/**
	 * Servlet销毁方法,负责销毁所使用资源.
	 */
	public void destroy() {
		wordFactory = null;
		fontFactory = null;
		textRenderer = null;
		configurableCaptchaService = null;
		super.destroy();
	}

	/**
	 * 内部类 自定义验证码图片背景,主要画一些噪点和干扰线
	 */
	private class MyCustomBackgroundFactory implements BackgroundFactory {
		private Random random = new Random();

		public void fillBackground(BufferedImage image) {
			Graphics graphics = image.getGraphics();

			// 验证码图片的宽高
			int imgWidth = image.getWidth();
			int imgHeight = image.getHeight();

			// 填充为白色背景
			graphics.setColor(Color.white);
			graphics.fillRect(0, 0, imgWidth, imgHeight);

			// 画100个噪点(颜色及位置随机)
			for (int i = 0; i < 25; i++) {
				// 随机颜色
				int rInt = random.nextInt(255);
				int gInt = random.nextInt(255);
				int bInt = random.nextInt(255);

				graphics.setColor(new Color(rInt, gInt, bInt));

				// 随机位置
				int xInt = random.nextInt(imgWidth - 3);
				int yInt = random.nextInt(imgHeight - 2);

				// 随机旋转角度
				int sAngleInt = random.nextInt(360);
				int eAngleInt = random.nextInt(360);

				// 随机大小
				int wInt = random.nextInt(6);
				int hInt = random.nextInt(6);

				graphics.fillArc(xInt, yInt, wInt, hInt, sAngleInt, eAngleInt);

				// 画干扰线
				if (i % 5 == 0) {
					int xInt2 = random.nextInt(imgWidth);
					int yInt2 = random.nextInt(imgHeight);
					graphics.drawLine(xInt, yInt, xInt2, yInt2);
				}
			}
		}
	}
}