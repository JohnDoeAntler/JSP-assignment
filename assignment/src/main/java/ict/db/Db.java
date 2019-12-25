package ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Db
 */
public class Db {

	private String url;

	private String username;

	private String password;

	public Db(String url, String username, String password) {
		super();
		this.url = url;
		this.username = username;
		this.password = password;
	}

	protected Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, username, password);
	}

}