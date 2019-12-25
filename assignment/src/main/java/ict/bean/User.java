package ict.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * User
 */
public class User implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String username;

	private String passwordDigest;

	private boolean suspended;

	private Timestamp createdAt;

	private Timestamp updatedAt;

	public User() {
		super();
	}

	public User(
		String id,
		String username,
		String passwordDigest,
		boolean suspended,
		Timestamp createdAt,
		Timestamp updatedAt
	) {
		super();
		this.id = id;
		this.username = username;
		this.passwordDigest = passwordDigest;
		this.suspended = suspended;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswordDigest() {
		return this.passwordDigest;
	}

	public void setPasswordDigest(String passwordDigest) {
		this.passwordDigest = passwordDigest;
	}

	public boolean getSuspended() {
		return this.suspended;
	}

	public void setSuspended(boolean suspended) {
		this.suspended = suspended;
	}

	public Timestamp getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
}