package ict.db;

/**
 * TeacherDb
 */
public class TeacherDb extends UserDb {

	public TeacherDb(
		String url,
		String username,
		String password
	) {
		super(url, username, password, "teacher");
	}
	
}