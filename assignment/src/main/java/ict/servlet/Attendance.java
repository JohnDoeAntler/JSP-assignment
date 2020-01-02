package ict.servlet;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ict.db.AttendanceDb;
import ict.util.DatabaseConfig;

/**
 * Attendance
 */
@WebServlet("/attendance")
public class Attendance extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private AttendanceDb db;

	@Override
	public void init() throws ServletException {
		super.init();

		this.db = new AttendanceDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("create")) {
			String scheduleId = req.getParameter("schedule_id");
			String studentId = req.getParameter("student_id");

			db.create(studentId, scheduleId, new Time(Calendar.getInstance().getTime().getTime()));

			res.sendRedirect(req.getContextPath() + "/schedule?action=view&id=" + scheduleId);
		} else if (action.equalsIgnoreCase("edit")) {
			ict.bean.Attendance attendance = db.get(req.getParameter("id"));
			String time = req.getParameter("time");

			try {
				db.update(attendance.getId(), new Time(new SimpleDateFormat("HH:mm").parse(time).getTime()));
				res.sendRedirect(req.getContextPath() + "/schedule?action=view&id=" + attendance.getScheduleId());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}
}