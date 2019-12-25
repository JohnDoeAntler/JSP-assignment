package ict.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * StudentProgramme
 */
public class StudentProgramme implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String studentId;

	private String programmeId;

	private Timestamp createdAt;

	private Timestamp updatedAt;

	public StudentProgramme(
		String id,
		String studentId,
		String programmeId,
		Timestamp createdAt,
		Timestamp updatedAt
	) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.programmeId = programmeId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public StudentProgramme() {
		super();
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getProgrammeId() {
		return this.programmeId;
	}

	public void setProgrammeId(String programmeId) {
		this.programmeId = programmeId;
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