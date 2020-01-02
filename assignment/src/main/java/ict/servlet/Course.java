package ict.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ict.db.CourseDb;
import ict.bean.User;
import ict.util.DatabaseConfig;

/**
 * ViewCourse
 */
@WebServlet("/course")
public class Course extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private CourseDb db;

	@Override
	public void init() throws ServletException {
		super.init();
		db = new CourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("view".equalsIgnoreCase(action)) {
			req.setAttribute("course", db.get(req.getParameter("id")));
			RequestDispatcher dispatcher = req.getRequestDispatcher("/course.jsp");
			dispatcher.forward(req, res);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("create")) {
			String shortname = req.getParameter("shortname");
			String fullname = req.getParameter("fullname");
			String summary = req.getParameter("summary");
			boolean hidden = req.getParameter("hidden") != null;
			String teahcer_id = req.getParameter("teacher_id");

			db.create(shortname, fullname, summary, hidden, teahcer_id);

			res.sendRedirect(req.getContextPath() + "/index.jsp");
		} else if (action.equalsIgnoreCase("edit_course")) {
			String id = req.getParameter("id");
			String shortname = req.getParameter("shortname");
			String fullname = req.getParameter("fullname");
			String summary = req.getParameter("summary");
			boolean hidden = req.getParameter("hidden") != null;
			String teacherId = req.getParameter("teacher_id");

			db.update(id, shortname, fullname, summary, hidden, teacherId);

			res.sendRedirect(req.getContextPath() + "/course?action=view&id=" + id);
		}
	}
}