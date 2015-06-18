package org.g4studio.core.id.sequence;


/**
 * TimeRollingSequenceGenerator
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see AbstractRollingSequenceGenerator
 */
public class TimeRollingSequenceGenerator extends
		AbstractRollingSequenceGenerator {

	private String time = null;
	private final String pattern;

	private TimeRollingSequenceGenerator(String pPattern) {
		this.pattern = pPattern;
		java.util.Date now = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(pattern);
		time = sdf.format(now);
	}

	/**
	 * 日循环
	 * 
	 * @return
	 */
	public static TimeRollingSequenceGenerator getDayRollingSequenceGenerator() {
		TimeRollingSequenceGenerator result = new TimeRollingSequenceGenerator(
				"dd");
		return result;
	}

	/**
	 * 月循环
	 * 
	 * @return
	 */
	public static TimeRollingSequenceGenerator getMonthRollingSequenceGenerator() {
		TimeRollingSequenceGenerator result = new TimeRollingSequenceGenerator(
				"MM");
		return result;
	}

	/**
	 * 年循环
	 * 
	 * @return
	 */
	public static TimeRollingSequenceGenerator getYearRollingSequenceGenerator() {
		TimeRollingSequenceGenerator result = new TimeRollingSequenceGenerator(
				"yyyy");
		return result;
	}

	/**
	 * 时循环
	 * 
	 * @return
	 */
	public static TimeRollingSequenceGenerator getHourRollingSequenceGenerator() {
		TimeRollingSequenceGenerator result = new TimeRollingSequenceGenerator(
				"HH");
		return result;
	}

	protected boolean isResetCount() {
		java.util.Date currDate = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(pattern);
		String nowTime = sdf.format(currDate);
		if (time.equals(nowTime) == false) {
			time = nowTime;
			return true;
		} else {
			return false;
		}
	}

	public String getPattern() {
		return pattern;
	}

}
