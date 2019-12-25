package ict.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ProgrammeCourse
 */
public class ProgrammeCourse implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String programmeId;

	private String courseId;

	private Timestamp createdAt;

	private Timestamp updatedAt;

	public ProgrammeCourse(
		String id,
		String programmeId,
		String courseId,
		Timestamp createdAt,
		Timestamp updatedAt
	) {
		super();
		this.id = id;
		this.programmeId = programmeId;
		this.courseId = courseId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public ProgrammeCourse() {
		super();
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProgrammeId() {
		return this.programmeId;
	}

	public void setProgrammeId(String programmeId) {
		this.programmeId = programmeId;
	}

	public String getCourseId() {
		return this.courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
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