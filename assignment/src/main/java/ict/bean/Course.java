package ict.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Course
 */
public class Course implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String shortname;

	private String fullname;

	private String summary;

	private boolean hidden;

	private String teacherId;

	private Timestamp createdAt;

	private Timestamp updatedAt;

	public Course(
		String id,
		String shortname,
		String fullname,
		String summary,
		boolean hidden,
		String teacherId,
		Timestamp createdAt,
		Timestamp updatedAt
	) {
		super();
		this.id = id;
		this.shortname = shortname;
		this.fullname = fullname;
		this.summary = summary;
		this.hidden = hidden;
		this.teacherId = teacherId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public Course() {
		super();
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getShortname() {
		return this.shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getSummary() {
		return this.summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public boolean getHidden() {
		return this.hidden;
	}

	public void setHidden(boolean hidden) {
		this.hidden = hidden;
	}

	public String getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
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