package ict.bean;

import java.io.Serializable;
import java.sql.Time;

/**
 * Attendance
 */
public class Attendance implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String studentId;

	private String scheduleId;

	private Time time;

	public Attendance() {
		super();
	}

	public Attendance(
		String id,
		String studentId,
		String scheduleId,
		Time time
	) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.scheduleId = scheduleId;
		this.time = time;
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

	public String getScheduleId() {
		return this.scheduleId;
	}

	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Time getTime() {
		return this.time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

}