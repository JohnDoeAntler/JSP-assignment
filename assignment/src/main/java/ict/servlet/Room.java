package ict.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ict.db.RoomDb;
import ict.util.DatabaseConfig;

/**
 * Room
 */
@WebServlet("/room")
public class Room extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private RoomDb db;

	@Override
	public void init() throws ServletException {
		super.init();
		this.db = new RoomDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		db.create(req.getParameter("name"));

		res.sendRedirect(req.getContextPath() + "/index.jsp");
	}
}