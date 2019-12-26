package ict.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

import ict.bean.StudentCourse;

/**
 * StudentCourseDb
 */
public class StudentCourseDb extends Db {

	public StudentCourseDb(String url, String username, String password) {
		super(url, username, password);
	}

	public ArrayList<StudentCourse> get() {
		ArrayList<StudentCourse> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM studentcourse;")) {
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new StudentCourse(
								result.getString("id"),
								result.getString("student_id"),
								result.getString("course_id"),
								result.getTimestamp("created_at"),
								result.getTimestamp("updated_at")
							)
						);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return arr;
	}

	public StudentCourse get(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM studentcourse WHERE id=?;")) {
				preparedStatement.setString(1, id);
				try (ResultSet result = preparedStatement.executeQuery()) {
					if (result.next()) {
						return new StudentCourse(
							result.getString("id"),
							result.getString("student_id"),
							result.getString("course_id"),
							result.getTimestamp("created_at"),
							result.getTimestamp("updated_at")
						);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public ArrayList<StudentCourse> get(String field, Object value) {
		ArrayList<StudentCourse> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement(String.format("SELECT * FROM studentcourse WHERE %s=?;", field))) {
				preparedStatement.setObject(1, value);
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new StudentCourse(
								result.getString("id"),
								result.getString("student_id"),
								result.getString("course_id"),
								result.getTimestamp("created_at"),
								result.getTimestamp("updated_at")
							)
						);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return arr;
	}

	public StudentCourse create (
		String studentId,
		String courseId
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO studentcourse (`id`, `student_id`, `course_id`) VALUES (?, ?, ?);")) {
				String id = UUID.randomUUID().toString();
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, studentId);
				preparedStatement.setString(3, courseId);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public boolean remove(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM studentcourse WHERE id=?;")) {
				preparedStatement.setString(1, id);
				return preparedStatement.executeUpdate() != 0;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
}