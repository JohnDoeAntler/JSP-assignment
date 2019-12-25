package ict.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

import ict.bean.StudentEnrichment;

/**
 * StudentEnrichmentDb
 */
public class StudentEnrichmentDb extends Db {

	public StudentEnrichmentDb(String url, String username, String password) {
		super(url, username, password);
	}

	public ArrayList<StudentEnrichment> get() {
		ArrayList<StudentEnrichment> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM studentenrichment;")) {
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new StudentEnrichment(
								result.getString("id"),
								result.getString("student_id"),
								result.getString("enrichment_id"),
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

	public StudentEnrichment get(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM studentenrichment WHERE id=?;")) {
				preparedStatement.setString(1, id);
				try (ResultSet result = preparedStatement.executeQuery()) {
					if (result.next()) {
						return new StudentEnrichment(
							result.getString("id"),
							result.getString("student_id"),
							result.getString("enrichment_id"),
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

	public ArrayList<StudentEnrichment> get(String field, Object value) {
		ArrayList<StudentEnrichment> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement(String.format("SELECT * FROM studentenrichment WHERE %s=?;", field))) {
				preparedStatement.setObject(1, value);
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new StudentEnrichment(
								result.getString("id"),
								result.getString("student_id"),
								result.getString("enrichment_id"),
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

	public StudentEnrichment create (
		String studentId,
		String enrichmentId
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO studentenrichment (`id`, `student_id`, `enrichment_id`) VALUES (?, ?, ?);")) {
				String id = UUID.randomUUID().toString();
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, studentId);
				preparedStatement.setString(3, enrichmentId);
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