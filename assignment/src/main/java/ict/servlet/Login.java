package ict.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ict.bean.User;
import ict.db.AdministratorDb;
import ict.db.StudentDb;
import ict.db.TeacherDb;
import ict.util.DatabaseConfig;

/**
 * Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public StudentDb studentDb;
	
	public TeacherDb teacherDb;

	public AdministratorDb administratorDb;

	@Override
	public void init() throws ServletException {
		super.init();

		this.studentDb = new StudentDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
		this.teacherDb = new TeacherDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
		this.administratorDb = new AdministratorDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.sendRedirect(req.getContextPath() + "/index.jsp");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String role = req.getParameter("role");
		//
		// ─── JAVA BEAN ───────────────────────────────────────────────────
		//
		User user = null;

		if ("student".equalsIgnoreCase(role)) {
			if (studentDb.authenticate(username, password)) {
				user = studentDb.get("username", username).get(0);
			}
		} else if ("teacher".equalsIgnoreCase(role)) {
			if (teacherDb.authenticate(username, password)) {
				user = teacherDb.get("username", username).get(0);
			}
		} else if ("admin".equalsIgnoreCase(role)) {
			if (administratorDb.authenticate(username, password)) {
				user = administratorDb.get("username", username).get(0);
			}
		}

		if (user != null) {
			req.getSession().setAttribute("role", role);
			req.getSession().setAttribute("user", user);
		}

		res.sendRedirect(req.getContextPath() + "/index.jsp");
	}
}