package ict.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

import ict.bean.Programme;

/**
 * ProgrammeDb
 */
public class ProgrammeDb extends Db {

	public ProgrammeDb(String url, String username, String password) {
		super(url, username, password);
	}

	public ArrayList<Programme> get() {
		ArrayList<Programme> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM programme;")) {
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new Programme(
								result.getString("id"),
								result.getString("shortname"),
								result.getString("fullname"),
								result.getString("summary"),
								result.getBoolean("hidden"),
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

	public Programme get(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM programme WHERE id=?;")) {
				preparedStatement.setString(1, id);
				try (ResultSet result = preparedStatement.executeQuery()) {
					if (result.next()) {
						return new Programme(
							result.getString("id"),
							result.getString("shortname"),
							result.getString("fullname"),
							result.getString("summary"),
							result.getBoolean("hidden"),
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

	public ArrayList<Programme> get(String field, Object value) {
		ArrayList<Programme> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement(String.format("SELECT * FROM programme WHERE %s=?;", field))) {
				preparedStatement.setObject(1, value);
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new Programme(
								result.getString("id"),
								result.getString("shortname"),
								result.getString("fullname"),
								result.getString("summary"),
								result.getBoolean("hidden"),
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

	public Programme create (
		String shortname,
		String fullname,
		String summary,
		boolean hidden
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO programme (`id`, `shortname`, `fullname`, `summary`, `hidden`) VALUES (?, ?, ?, ?, ?);")) {
				String id = UUID.randomUUID().toString();
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, shortname);
				preparedStatement.setString(3, fullname);
				preparedStatement.setString(4, summary);
				preparedStatement.setBoolean(5, hidden);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	public Programme update (
		String id,
		String shortname,
		String fullname,
		String summary,
		boolean hidden
	) {
		return null;
	}

	public boolean remove(String id) {
		return false;
	}
}