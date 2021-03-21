package model;

public abstract class Candidate {
	protected String candidateId;
	protected String fullName;
	protected String dayOfBirth;
	protected String phone;
	protected String email;
	protected int candidateType;
	protected int candidateCount;

	public Candidate(String candidateId, String fullName, String dayOfBirth, String phone, String email,
			int candidateType, int candidateCount) {
		this.candidateId = candidateId;
		this.fullName = fullName;
		this.dayOfBirth = dayOfBirth;
		this.phone = phone;
		this.email = email;
		this.candidateType = candidateType;
		this.candidateCount = candidateCount;
	}

	public String getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(String candidateId) {
		this.candidateId = candidateId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getDayOfBirth() {
		return dayOfBirth;
	}

	public void setDayOfBirth(String dayOfBirth) {
		this.dayOfBirth = dayOfBirth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCandidateType() {
		return candidateType;
	}

	public void setCandidateType(int candidateType) {
		this.candidateType = candidateType;
	}

	public int getCandidateCount() {
		return candidateCount;
	}

	public void setCandidateCount(int candidateCount) {
		this.candidateCount = candidateCount;
	}

	public abstract void showInfo();

	@Override
	public String toString() {
		return "Candidate [candidateId=" + candidateId + ", fullName=" + fullName + ", dayOfBirth=" + dayOfBirth
				+ ", phone=" + phone + ", email=" + email + ", candidateType=" + candidateType + ", candidateCount="
				+ candidateCount + "]";
	}

}
