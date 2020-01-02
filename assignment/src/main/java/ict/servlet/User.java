package ict.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ict.db.AdministratorDb;
import ict.db.StudentDb;
import ict.db.TeacherDb;
import ict.util.DatabaseConfig;

/**
 * User
 */
@WebServlet("/user")
public class User extends HttpServlet {

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

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");


		if (action.equalsIgnoreCase("create")) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String role = req.getParameter("role");

			if (role.equalsIgnoreCase("student")) {
				studentDb.create(username, password, false);
			} else if (role.equalsIgnoreCase("teacher")) {
				teacherDb.create(username, password, false);
			} else if (role.equalsIgnoreCase("admin")) {
				administratorDb.create(username, password, false);
			}

			res.sendRedirect(req.getContextPath() + "/view_users.jsp");
		} else if (action.equalsIgnoreCase("update_password")) {
			String op = req.getParameter("old");
			String np = req.getParameter("new");
			ict.bean.User user = (ict.bean.User) req.getSession().getAttribute("user");
			String username = user.getUsername();
			String role = (String) req.getSession().getAttribute("role");
			
			switch (role){
				case "student": 
					if (studentDb.authenticate(username, op)) {
						studentDb.updatePassword(user.getId(), np);
					}
					break;
				case "teacher":
					if (teacherDb.authenticate(username, op)) {
						teacherDb.updatePassword(user.getId(), np);
					}
					break;
				case "admin":
					if (administratorDb.authenticate(username, op)) {
						administratorDb.updatePassword(user.getId(), np);
					}
					break;
			}

			res.sendRedirect(req.getContextPath() + "/index.jsp");
		} else if (action.equalsIgnoreCase("edit_role")) {
			String id = req.getParameter("id");
			String from = req.getParameter("role");
			String to = req.getParameter("submit");

			from = from.equals("admin") ? "administrator" : from;
			to = to.equals("admin") ? "administrator" : to;

			studentDb.changeRole(id, from, to);
			res.sendRedirect(req.getContextPath() + "/view_users.jsp");
		}
	}
}