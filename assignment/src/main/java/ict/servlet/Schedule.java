package ict.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ict.db.ScheduleDb;
import ict.util.DatabaseConfig;

/**
 * Schedule
 */
@WebServlet("/schedule")
public class Schedule extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private ScheduleDb db;

	@Override
	public void init() throws ServletException {
		super.init();
		this.db = new ScheduleDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("view".equalsIgnoreCase(action)) {
			req.setAttribute("schedule", db.get(req.getParameter("id")));
			RequestDispatcher dispatcher = req.getRequestDispatcher("/schedule.jsp");
			dispatcher.forward(req, res);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("create")) {
			String courseId = req.getParameter("course_id");
			String date = req.getParameter("date");
			String from = req.getParameter("from");
			String to = req.getParameter("to");
			String roomId = req.getParameter("room_id");

			try {
				ict.bean.Schedule s = db.create(
					courseId,
					new Date(new SimpleDateFormat("MM/dd/yyyy").parse(date).getTime()),
					new Time(new SimpleDateFormat("HH:mm").parse(from).getTime()),
					new Time(new SimpleDateFormat("HH:mm").parse(to).getTime()),
					roomId
				);

				res.sendRedirect(req.getContextPath() + "/schedule?action=view&id=" + s.getId());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("edit_schedule")) {

			String id = req.getParameter("id");
			String courseId = req.getParameter("course_id");
			String date = req.getParameter("date");
			String from = req.getParameter("from");
			String to = req.getParameter("to");
			String roomId = req.getParameter("room_id");

			try {
				db.update(
					id,
					courseId,
					new Date(new SimpleDateFormat("MM/dd/yyyy").parse(date).getTime()),
					new Time(new SimpleDateFormat("HH:mm").parse(from).getTime()),
					new Time(new SimpleDateFormat("HH:mm").parse(to).getTime()),
					roomId
				);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			res.sendRedirect(req.getContextPath() + "/schedule?action=view&id=" + id);
		} else if (action.equalsIgnoreCase("remove_schedule")) {

			ict.bean.Schedule s = db.get(req.getParameter("id"));
			db.remove(s.getId());
			res.sendRedirect(req.getContextPath() + "/course?action=view&id=" + s.getCourseId());
		}
	}
}