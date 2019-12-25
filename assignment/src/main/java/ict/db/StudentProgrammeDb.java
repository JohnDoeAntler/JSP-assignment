package ict.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

import ict.bean.StudentProgramme;

/**
 * StudentProgrammeDb
 */
public class StudentProgrammeDb extends Db {

	public StudentProgrammeDb(String url, String username, String password) {
		super(url, username, password);
	}

	public ArrayList<StudentProgramme> get() {
		ArrayList<StudentProgramme> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM studentprogramme;")) {
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new StudentProgramme(
								result.getString("id"),
								result.getString("student_id"),
								result.getString("programme_id"),
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

	public StudentProgramme get(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM studentprogramme WHERE id=?;")) {
				preparedStatement.setString(1, id);
				try (ResultSet result = preparedStatement.executeQuery()) {
					if (result.next()) {
						return new StudentProgramme(
							result.getString("id"),
							result.getString("student_id"),
							result.getString("programme_id"),
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

	public ArrayList<StudentProgramme> get(String field, Object value) {
		ArrayList<StudentProgramme> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement(String.format("SELECT * FROM studentprogramme WHERE %s=?;", field))) {
				preparedStatement.setObject(1, value);
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new StudentProgramme(
								result.getString("id"),
								result.getString("student_id"),
								result.getString("programme_id"),
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

	public StudentProgramme create (
		String studentId,
		String programmeId
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO studentprogramme (`id`, `student_id`, `programme_id`) VALUES (?, ?, ?);")) {
				String id = UUID.randomUUID().toString();
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, studentId);
				preparedStatement.setString(3, programmeId);
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