package ict.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ict.db.StudentCourseDb;
import ict.util.DatabaseConfig;

/**
 * StudentCourse
 */
@WebServlet("/studentcourse")
public class StudentCourse extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private StudentCourseDb db;

	@Override
	public void init() throws ServletException {
		super.init();
		
		this.db = new StudentCourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("remove")) {
			ict.bean.StudentCourse sc = db.get(req.getParameter("id"));
			db.remove(sc.getId());
			res.sendRedirect(req.getContextPath() + "/edit_studentcourse.jsp?id=" + sc.getStudentId());
		} 
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if (action.equals("create")) {
			db.create(req.getParameter("student_id"), req.getParameter("course_id"));
			res.sendRedirect(req.getContextPath() + "/edit_studentcourse.jsp?id=" + req.getParameter("student_id"));
		}
	}
}