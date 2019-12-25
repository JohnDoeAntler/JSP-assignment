package ict.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * StudentEnrichment
 */
public class StudentEnrichment implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String studentId;

	private String enrichmentId;

	private Timestamp createdAt;

	private Timestamp updatedAt;

	public StudentEnrichment(
		String id,
		String studentId,
		String enrichmentId,
		Timestamp createdAt,
		Timestamp updatedAt
	) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.enrichmentId = enrichmentId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public StudentEnrichment() {
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

	public String getEnrichmentId() {
		return this.enrichmentId;
	}

	public void setEnrichmentId(String enrichmentId) {
		this.enrichmentId = enrichmentId;
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