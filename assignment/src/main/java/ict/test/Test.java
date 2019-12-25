package ict.test;

import ict.db.TeacherDb;
import ict.db.UserDb;

/**
 * Test
 */
public class Test {

	public static void main(String[] args) {
		UserDb db = new TeacherDb("jdbc:mysql://localhost:3306/assignment", "admin", "admin");

		System.out.println(db.authenticate("admin", "admin"));
	}

}