package com.klevjers.kakeserver.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class KakeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		resp.sendError(
				req.getProtocol().endsWith("1.1") ? HttpServletResponse.SC_METHOD_NOT_ALLOWED
						: HttpServletResponse.SC_BAD_REQUEST,
				"Unsupported operation");
	}

}
