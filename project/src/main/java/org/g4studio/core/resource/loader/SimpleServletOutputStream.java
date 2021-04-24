package org.g4studio.core.resource.loader;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;

/**
 * SimpleServletOutputStream
 * 
 * @author HuangYunHui|XiongChun
 * @since 2009-08-5
 */
public class SimpleServletOutputStream extends ServletOutputStream {

	ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

	public SimpleServletOutputStream() {
	}

	/**
	 * Get the contents of the outputStream.
	 * 
	 * @return contents of the outputStream
	 */
	public String toString() {
		return this.outputStream.toString();
	}

	public byte[] getDatas() {
		return outputStream.toByteArray();
	}

	/**
	 * Reset the wrapped ByteArrayOutputStream.
	 */
	public void reset() {
		outputStream.reset();
	}

	public void write(byte[] b, int off, int len) throws IOException {
		outputStream.write(b, off, len);
	}

	public void write(byte[] b) throws IOException {
		outputStream.write(b);
	}

	public void write(int b) throws IOException {
		outputStream.write(b);

	}
}