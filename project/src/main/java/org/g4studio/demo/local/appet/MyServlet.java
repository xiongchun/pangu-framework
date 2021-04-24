package org.g4studio.demo.local.appet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String userName = req.getParameter("username");
		System.out.println("username->" + userName);
		res.setContentType("text/html; charset=GBK");
		res.setHeader("Cache-Control", "no-cache");
		PrintWriter writer = res.getWriter();
		writer.write("username->" + userName);
		writer.flush();
		writer.close();
	}
}
