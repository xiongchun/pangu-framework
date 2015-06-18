package org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.sql;

import org.g4studio.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMapping;

public class SqlText implements SqlChild {

	private String text;
	private boolean isWhiteSpace;
	private boolean postParseRequired;

	private ParameterMapping[] parameterMappings;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text.replace('\r', ' ').replace('\n', ' ').replace('\t', ' ');
		this.isWhiteSpace = text.trim().length() == 0;
	}

	public boolean isWhiteSpace() {
		return isWhiteSpace;
	}

	public ParameterMapping[] getParameterMappings() {
		return parameterMappings;
	}

	public void setParameterMappings(ParameterMapping[] parameterMappings) {
		this.parameterMappings = parameterMappings;
	}

	public boolean isPostParseRequired() {
		return postParseRequired;
	}

	public void setPostParseRequired(boolean postParseRequired) {
		this.postParseRequired = postParseRequired;
	}

}
