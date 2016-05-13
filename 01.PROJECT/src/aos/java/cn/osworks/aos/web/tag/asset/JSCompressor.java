package cn.osworks.aos.web.tag.asset;

/**
 * <b>JavaScript预处理</b> 
 * 
 * 提供标签库中JS的运行时压缩处理
 * 
 * @author OSWorks-XC
 * @since 6.0
 * @date 2014-03-06
 */
public class JSCompressor {

	private static final char LINE_FEED = '\n';
	private static final char CARRIAGE_RETURN = '\r';
	private static final char SPACE = ' ';
	private static final char TAB = '\t';

	/**
	 * Compresses a String containing JavaScript by removing comments and
	 * whitespace.
	 * 
	 * @param script
	 *            the String to compress
	 * @return a compressed version
	 */
	public static String compress(String script) {
		//预处理：强制去除顽固换行
		//script = script.replaceAll("\r\n", "");
		JSCompressor jsc = new JSCompressor(script);
		String outString = jsc.outputBuffer.toString();
		return outString;
	}

	private String script;

	private StringBuffer outputBuffer;

	private int pos;

	private char ch;

	private char lastAppend;

	private boolean endReached;

	private boolean contentAppendedAfterLastIdentifier = true;

	private JSCompressor(String script) {
		this.script = script;
		outputBuffer = new StringBuffer(script.length());
		nextChar();

		while (!endReached) {
			if (Character.isJavaIdentifierStart(ch)) {
				renderIdentifier();
			} else if (ch == ' ') {
				skipWhiteSpace();
			} else if (isWhitespace()) {
				// Compress whitespace
				skipWhiteSpace();
			} else if ((ch == '"') || (ch == '\'')) {
				// Handle strings
				renderString();
			} else if (ch == '/') {
				// Handle comments
				nextChar();
				if (ch == '/') {
					nextChar();
					skipLineComment();
				} else if (ch == '*') {
					nextChar();
					skipBlockComment();
				} else {
					append('/');
				}
			} else {
				append(ch);
				nextChar();
			}
		}
	}

	private void append(char ch) {
		lastAppend = ch;
		outputBuffer.append(ch);
		contentAppendedAfterLastIdentifier = true;
	}

	private boolean isWhitespace() {
		return ch == CARRIAGE_RETURN || ch == SPACE || ch == TAB || ch == LINE_FEED;
	}

	private void nextChar() {
		if (!endReached) {
			if (pos < script.length()) {
				ch = script.charAt(pos++);
			} else {
				endReached = true;
				ch = 0;
			}
		}
	}

	private void renderIdentifier() {
		if (!contentAppendedAfterLastIdentifier)
			append(SPACE);
		append(ch);
		nextChar();
		while (Character.isJavaIdentifierPart(ch)) {
			append(ch);
			nextChar();
		}
		contentAppendedAfterLastIdentifier = false;
	}

	private void renderString() {
		char startCh = ch; // Save quote char
		append(ch);
		nextChar();
		while (true) {
			if ((ch == LINE_FEED) || (ch == CARRIAGE_RETURN) || (endReached)) {
				// JavaScript error: string not terminated
				return;
			} else {
				if (ch == '\\') {
					append(ch);
					nextChar();
					if ((ch == LINE_FEED) || (ch == CARRIAGE_RETURN) || (endReached)) {
						// JavaScript error: string not terminated
						return;
					}
					append(ch);
					nextChar();
				} else {
					append(ch);
					if (ch == startCh) {
						nextChar();
						return;
					}
					nextChar();
				}
			}
		}
	}

	private void skipLineComment() {
		while ((ch != CARRIAGE_RETURN) && (ch != LINE_FEED)) {
			if (endReached) {
				return;
			}
			nextChar();
		}
	}

	private void skipBlockComment() {
		while (true) {
			if (endReached) {
				return;
			}
			if (ch == '*') {
				nextChar();
				if (ch == '/') {
					nextChar();
					return;
				}
			} else
				nextChar();
		}
	}

	private void renderNewLine() {
		if (lastAppend != '\n' && lastAppend != '\r') {
			append('\n');
		}
	}

	private void skipWhiteSpace() {
		if (ch == LINE_FEED || ch == CARRIAGE_RETURN) {
			renderNewLine();
		} else {
			append(ch);
		}
		nextChar();
		while (ch == LINE_FEED || ch == CARRIAGE_RETURN || ch == SPACE || ch == TAB) {
			if (ch == LINE_FEED || ch == CARRIAGE_RETURN) {
				renderNewLine();
			}
			nextChar();
		}
	}
}
