package ict.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * StudentCourse
 */
public class StudentCourse implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String studentId;

	private String courseId;

	private Timestamp createdAt;

	private Timestamp updatedAt;

	public StudentCourse() {
		super();
	}

	public StudentCourse(
		String id,
		String studentId,
		String courseId,
		Timestamp createdAt,
		Timestamp updatedAt
	) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.courseId = courseId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
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