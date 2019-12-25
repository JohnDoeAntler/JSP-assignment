package ict.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;

import org.jasypt.util.password.StrongPasswordEncryptor;

import ict.bean.User;

/**
 * AccountDb
 */
public class UserDb extends Db { 

	private String table;

	//
	// ─── PACKAGE-SCOPED CONSTRUCTOR ─────────────────────────────────────────────────
	//
	UserDb(
		String url,
		String username,
		String password,
		String table
	) {
		super(url, username, password);
		// this.table = ;
		this.table = table;
	}

	//
	// ─── ENCRYPT ────────────────────────────────────────────────────────────────────
	//

	private String encrypt(String password) {
		return new StrongPasswordEncryptor().encryptPassword(password);
	}

	//
	// ─── SELECT ALL ─────────────────────────────────────────────────────────────────
	//
	public ArrayList<User> get() {
		ArrayList<User> arr = new ArrayList<>();

		try (Connection connection = getConnection()){
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM " + this.table + ";")){
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new User(
								result.getString("id"),
								result.getString("username"),
								result.getString("password_digest"),
								result.getBoolean("suspended"),
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

	//
	// ─── SELECT BY ID ───────────────────────────────────────────────────────────────
	//
	public User get(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM " + this.table + " WHERE id=?;")) {
				preparedStatement.setString(1, id);
				try (ResultSet result = preparedStatement.executeQuery()) {
					if (result.next()) {
						return new User(
							result.getString("id"),
							result.getString("username"),
							result.getString("password_digest"),
							result.getBoolean("suspended"),
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

	//
	// ─── SELECt BY FIELD ────────────────────────────────────────────────────────────
	//
	public ArrayList<User> get(String field, Object value) {
		ArrayList<User> arr = new ArrayList<>();

		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement(String.format("SELECT * FROM " + this.table + " WHERE %s=?;", field))) {
				preparedStatement.setObject(1, value);
				try (ResultSet result = preparedStatement.executeQuery()) {
					while (result.next()) {
						arr.add(
							new User(
								result.getString("id"),
								result.getString("username"),
								result.getString("password_digest"),
								result.getBoolean("suspended"),
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

	//
	// ─── CREATE ─────────────────────────────────────────────────────────────────────
	//
	public User create(
		String username,
		String password,
		boolean suspended
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO " + this.table + " (`id`, `username`, `password_digest`, `suspended`) VALUES (?, ?, ?, ?);")) {
				String id = UUID.randomUUID().toString();
				preparedStatement.setString(1, id);
				preparedStatement.setString(2, username);
				preparedStatement.setString(3, encrypt(password));
				preparedStatement.setBoolean(4, suspended);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	//
	// ─── UPDATE ─────────────────────────────────────────────────────────────────────
	//
	public User update(
		String id,
		String username,
		String password,
		boolean suspended
	) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("UPDATE " + this.table + " SET username=?, password_digest=?, suspended=? WHERE id=?;")) {
				preparedStatement.setString(1, username);
				preparedStatement.setString(2, encrypt(password));
				preparedStatement.setBoolean(3, suspended);
				preparedStatement.setString(4, id);
				preparedStatement.executeUpdate();
				return this.get(id);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//
	// ─── DELETE ─────────────────────────────────────────────────────────────────────
	//
	public boolean remove(String id) {
		try (Connection connection = getConnection()) {
			try (PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM " + this.table + " WHERE id=?;")) {
				preparedStatement.setString(1, id);
				return preparedStatement.executeUpdate() != 0;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	//
	// ─── AUTHENTICATE ───────────────────────────────────────────────────────────────
	//
	public boolean authenticate(String username, String password) {
		try {
			return new StrongPasswordEncryptor().checkPassword(password, this.get("username", username).get(0).getPasswordDigest());
		} catch (Exception e) {
			return false;
		}
	}

}