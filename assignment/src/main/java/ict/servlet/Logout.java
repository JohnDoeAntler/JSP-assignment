package ict.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ict.bean.User;

/**
 * Logout
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doLogout(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doLogout(req, res);
	}

	private void doLogout(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();

		if (((User) session.getAttribute("user")).getUsername() != null && session.getAttribute("role") != null) {
			session.removeAttribute("user");
			session.removeAttribute("role");
		}

		res.sendRedirect(req.getContextPath() + "/index.jsp");
	}
}