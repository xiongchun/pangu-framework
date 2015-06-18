package org.g4studio.core.orm.xibatis.common.io;

import java.io.*;

/**
 * An InputStream backed by a Reader
 */
public class ReaderInputStream extends InputStream {
	protected Reader reader;
	protected ByteArrayOutputStream byteArrayOut;
	protected Writer writer;
	protected char[] chars;
	protected byte[] buffer;
	protected int index, length;

	/**
	 * Constructor to supply a Reader
	 * 
	 * @param reader
	 *            - the Reader used by the InputStream
	 */
	public ReaderInputStream(Reader reader) {
		this.reader = reader;
		byteArrayOut = new ByteArrayOutputStream();
		writer = new OutputStreamWriter(byteArrayOut);
		chars = new char[1024];
	}

	/**
	 * Constructor to supply a Reader and an encoding
	 * 
	 * @param reader
	 *            - the Reader used by the InputStream
	 * @param encoding
	 *            - the encoding to use for the InputStream
	 * @throws UnsupportedEncodingException
	 *             if the encoding is not supported
	 */
	public ReaderInputStream(Reader reader, String encoding) throws UnsupportedEncodingException {
		this.reader = reader;
		byteArrayOut = new ByteArrayOutputStream();
		writer = new OutputStreamWriter(byteArrayOut, encoding);
		chars = new char[1024];
	}

	/**
	 * @see java.io.InputStream#read()
	 */
	public int read() throws IOException {
		if (index >= length)
			fillBuffer();
		if (index >= length)
			return -1;
		return 0xff & buffer[index++];
	}

	protected void fillBuffer() throws IOException {
		if (length < 0)
			return;
		int numChars = reader.read(chars);
		if (numChars < 0) {
			length = -1;
		} else {
			byteArrayOut.reset();
			writer.write(chars, 0, numChars);
			writer.flush();
			buffer = byteArrayOut.toByteArray();
			length = buffer.length;
			index = 0;
		}
	}

	/**
	 * @see java.io.InputStream#read(byte[], int, int)
	 */
	public int read(byte[] data, int off, int len) throws IOException {
		if (index >= length)
			fillBuffer();
		if (index >= length)
			return -1;
		int amount = Math.min(len, length - index);
		System.arraycopy(buffer, index, data, off, amount);
		index += amount;
		return amount;
	}

	/**
	 * @see java.io.InputStream#available()
	 */
	public int available() throws IOException {
		return (index < length) ? length - index : ((length >= 0) && reader.ready()) ? 1 : 0;
	}

	/**
	 * @see java.io.InputStream#close()
	 */
	public void close() throws IOException {
		reader.close();
	}
}
