package org.g4studio.core.mvc.xstruts.mock;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.Locale;

/**
 * <p>
 * Mock <strong>HttpServletResponse</strong> object for low-level unit tests of
 * Struts controller components. Coarser grained tests should be implemented in
 * terms of the Cactus framework, instead of the mock object classes.
 * </p>
 * 
 * <p>
 * <strong>WARNING</strong> - Only the minimal set of methods needed to create
 * unit tests is provided, plus additional methods to configure this object as
 * necessary. Methods for unsupported operations will throw
 * <code>UnsupportedOperationException</code>.
 * </p>
 * 
 * <p>
 * <strong>WARNING</strong> - Because unit tests operate in a single threaded
 * environment, no synchronization is performed.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class MockHttpServletResponse implements HttpServletResponse {
	// ----------------------------------------------------- Instance Variables
	// --------------------------------------------------------- Public Methods
	// -------------------------------------------- HttpServletResponse Methods
	public void addCookie(Cookie cookie) {
		throw new UnsupportedOperationException();
	}

	public void addDateHeader(String name, long value) {
		throw new UnsupportedOperationException();
	}

	public void addHeader(String name, String value) {
		throw new UnsupportedOperationException();
	}

	public void addIntHeader(String name, int value) {
		throw new UnsupportedOperationException();
	}

	public boolean containsHeader(String name) {
		throw new UnsupportedOperationException();
	}

	public String encodeRedirectUrl(String url) {
		return (encodeRedirectURL(url));
	}

	public String encodeRedirectURL(String url) {
		return (url);
	}

	public String encodeUrl(String url) {
		return (encodeURL(url));
	}

	public String encodeURL(String url) {
		return (url);
	}

	public void sendError(int status) {
		throw new UnsupportedOperationException();
	}

	public void sendError(int status, String message) {
		throw new UnsupportedOperationException();
	}

	public void sendRedirect(String location) {
		throw new UnsupportedOperationException();
	}

	public void setDateHeader(String name, long value) {
		throw new UnsupportedOperationException();
	}

	public void setHeader(String name, String value) {
		throw new UnsupportedOperationException();
	}

	public void setIntHeader(String name, int value) {
		throw new UnsupportedOperationException();
	}

	public void setStatus(int status) {
		throw new UnsupportedOperationException();
	}

	public void setStatus(int status, String message) {
		throw new UnsupportedOperationException();
	}

	// ------------------------------------------------ ServletResponse Methods
	public void flushBuffer() {
		throw new UnsupportedOperationException();
	}

	public int getBufferSize() {
		throw new UnsupportedOperationException();
	}

	public String getCharacterEncoding() {
		throw new UnsupportedOperationException();
	}

	public Locale getLocale() {
		throw new UnsupportedOperationException();
	}

	public ServletOutputStream getOutputStream() throws IOException {
		throw new UnsupportedOperationException();
	}

	public PrintWriter getWriter() throws IOException {
		throw new UnsupportedOperationException();
	}

	public boolean isCommitted() {
		throw new UnsupportedOperationException();
	}

	public void reset() {
		throw new UnsupportedOperationException();
	}

	public void resetBuffer() {
		throw new UnsupportedOperationException();
	}

	public void setBufferSize(int size) {
		throw new UnsupportedOperationException();
	}

	public void setContentLength(int length) {
		throw new UnsupportedOperationException();
	}

	public void setContentType(String type) {
		throw new UnsupportedOperationException();
	}

	public void setLocale(Locale locale) {
		throw new UnsupportedOperationException();
	}

	public String getContentType() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setCharacterEncoding(String arg0) {
		// TODO Auto-generated method stub

	}
}
