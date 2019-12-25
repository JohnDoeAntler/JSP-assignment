package ict.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

/**
 * Schedule
 */
public class Schedule implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String courseId;

	private Date date;

	private Time from;

	private Time to;

	private String roomId;

	private Timestamp createdAt;

	private Timestamp updatedAt;

	public Schedule(
		String id,
		String courseId,
		Date date,
		Time from,
		Time to,
		String roomId,
		Timestamp createdAt,
		Timestamp updatedAt
	) {
		super();
		this.id = id;
		this.courseId = courseId;
		this.date = date;
		this.from = from;
		this.to = to;
		this.roomId = roomId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public Schedule() {
		super();
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCourseId() {
		return this.courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getFrom() {
		return this.from;
	}

	public void setFrom(Time from) {
		this.from = from;
	}

	public Time getTo() {
		return this.to;
	}

	public void setTo(Time to) {
		this.to = to;
	}

	public String getRoomId() {
		return this.roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
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