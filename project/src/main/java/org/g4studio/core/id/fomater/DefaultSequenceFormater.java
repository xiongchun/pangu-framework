package org.g4studio.core.id.fomater;

import java.text.DecimalFormat;

import org.g4studio.core.id.FormatSequenceExcepiton;
import org.g4studio.core.id.SequenceFormater;

/**
 * DefaultSequenceFormater
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see SequenceFormater
 */
public class DefaultSequenceFormater implements SequenceFormater {

	private String pattern;

	public String format(long pSequence) throws FormatSequenceExcepiton {
		DecimalFormat df = new DecimalFormat(pattern);
		return df.format(pSequence);
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

}
