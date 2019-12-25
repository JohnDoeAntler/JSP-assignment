package ict.db;

/**
 * StudentDb
 */
public class StudentDb extends UserDb {

	public StudentDb(
		String url,
		String username,
		String password
	) {
		super(url, username, password, "student");
	}

}