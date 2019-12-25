package ict.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

import ict.bean.Course;

/**
 * CourseDb
 */
public class CourseDb extends Db {

	public CourseDb(String url, String username, String password) {
		super(url, username, password);
	}

	public ArrayList<Course> get() {
		ArrayList<Course> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM course;")) {
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new Course(
								result.getString("id"),
								result.getString("shortname"),
								result.getString("fullname"),
								result.getString("summary"),
								result.getBoolean("hidden"),
								result.getString("teacher_id"),
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

	public Course get(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM course WHERE id=?;")) {
				preparedStatement.setString(1, id);
				try (ResultSet result = preparedStatement.executeQuery()) {
					if (result.next()) {
						return new Course(
							result.getString("id"),
							result.getString("shortname"),
							result.getString("fullname"),
							result.getString("summary"),
							result.getBoolean("hidden"),
							result.getString("teacher_id"),
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

	public ArrayList<Course> get(String field, Object value) {
		ArrayList<Course> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement(String.format("SELECT * FROM course WHERE %s=?;", field))) {
				preparedStatement.setObject(1, value);
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new Course(
								result.getString("id"),
								result.getString("shortname"),
								result.getString("fullname"),
								result.getString("summary"),
								result.getBoolean("hidden"),
								result.getString("teacher_id"),
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

	public Course create(
		String shortname,
		String fullname,
		String summary,
		boolean hidden,
		String teacherId
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO course (`id`, `shortname`, `fullname`, `summary`, `hidden`, `teacher_id`) VALUES (?, ?, ?, ?, ?, ?);")) {
				String id = UUID.randomUUID().toString();
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, shortname);
				preparedStatement.setString(3, fullname);
				preparedStatement.setString(4, summary);
				preparedStatement.setBoolean(5, hidden);
				preparedStatement.setString(6, teacherId);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	public Course update(
		String id,
		String shortname,
		String fullname,
		String summary,
		boolean hidden,
		String teacherId
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("UPDATE course SET shortname=?, fullname=?, summary=?, hidden=?, teacher_id=? WHERE id=?;")) {
				preparedStatement.setString(1, shortname);
				preparedStatement.setString(2, fullname);
				preparedStatement.setString(3, summary);
				preparedStatement.setBoolean(4, hidden);
				preparedStatement.setString(5, teacherId);
				preparedStatement.setString(6, id);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	public boolean remove(String id) {
		return false;
	}
}