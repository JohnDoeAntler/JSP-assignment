package ict.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.UUID;

import ict.bean.Attendance;

/**
 * AttendanceDb
 */
public class AttendanceDb extends Db {

	public AttendanceDb(String url, String username, String password) {
		super(url, username, password);
	}

	public ArrayList<Attendance> get() {
		ArrayList<Attendance> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM attendance;")) {
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new Attendance(
								result.getString("id"),
								result.getString("student_id"),
								result.getString("schedule_id"),
								result.getTime("time")
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

	public Attendance get(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM attendance WHERE id=?;")) {
				preparedStatement.setString(1, id);
				try (ResultSet result = preparedStatement.executeQuery()) {
					if (result.next()) {
						return new Attendance(
							result.getString("id"),
							result.getString("student_id"),
							result.getString("schedule_id"),
							result.getTime("time")
						);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public ArrayList<Attendance> get(String field, Object value) {
		ArrayList<Attendance> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement(String.format("SELECT * FROM attendance WHERE %s=?;", field))) {
				preparedStatement.setObject(1, value);
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new Attendance(
								result.getString("id"),
								result.getString("student_id"),
								result.getString("schedule_id"),
								result.getTime("time")
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

	public Attendance create(
		String studentId,
		String scheduleId,
		Time time
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO attendance (`id`, `student_id`, `schedule_id`, `time`) VALUES (?, ?, ?, ?);")) {
				String id = UUID.randomUUID().toString();
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, studentId);
				preparedStatement.setString(3, scheduleId);
				preparedStatement.setTime(4, time);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	public Attendance update(
		String id,
		Time time
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("UPDATE attendance SET time=? WHERE id=?;")) {
				preparedStatement.setTime(1, time);
				preparedStatement.setString(2, id);
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
			try (PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM attendance WHERE id=?;")) {
				preparedStatement.setString(1, id);
				return preparedStatement.executeUpdate() != 0;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

}