package ict.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.UUID;

import ict.bean.Schedule;

/**
 * ScheduleDb
 */
public class ScheduleDb extends Db {

	public ScheduleDb(String url, String username, String password) {
		super(url, username, password);
	}

	public ArrayList<Schedule> get() {
		ArrayList<Schedule> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM schedule;")) {
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new Schedule(
								result.getString("id"),
								result.getString("course_id"),
								result.getDate("date"),
								result.getTime("from"),
								result.getTime("to"),
								result.getString("room_id"),
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

	public Schedule get(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM schedule WHERE id=?;")) {
				preparedStatement.setString(1, id);
				try (ResultSet result = preparedStatement.executeQuery()) {
					if (result.next()) {
						return new Schedule(
							result.getString("id"),
							result.getString("course_id"),
							result.getDate("date"),
							result.getTime("from"),
							result.getTime("to"),
							result.getString("room_id"),
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

	public ArrayList<Schedule> get(String field , String value) {
		ArrayList<Schedule> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement(String.format("SELECT * FROM schedule WHERE %s=?;", field))) {
				preparedStatement.setObject(1, value);
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new Schedule(
								result.getString("id"),
								result.getString("course_id"),
								result.getDate("date"),
								result.getTime("from"),
								result.getTime("to"),
								result.getString("room_id"),
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

	public Schedule create (
		String courseId,
		Date date,
		Time from,
		Time to,
		String roomId
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO schedule (`id`, `course_id`, `date`, `from`, `to`, `room_id`) VALUES (?, ?, ?, ?, ?, ?);")) {
				String id = UUID.randomUUID().toString();
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, courseId);
				preparedStatement.setDate(3, date);
				preparedStatement.setTime(4, from);
				preparedStatement.setTime(5, to);
				preparedStatement.setString(6, roomId);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	public Schedule update (
		String id,
		String courseId,
		Date date,
		Time from,
		Time to,
		String roomId
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("UPDATE schedule SET course_id=?, date=?, from=?, to=?, room_id=? WHERE id=?;")) {
				preparedStatement.setString(1, courseId);
				preparedStatement.setDate(2, date);
				preparedStatement.setTime(3, from);
				preparedStatement.setTime(4, to);
				preparedStatement.setString(5, roomId);
				preparedStatement.setString(6, id);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	public boolean remove (String id) {
		return false;
	}
	
}