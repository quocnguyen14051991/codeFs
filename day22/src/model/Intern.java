package model;

public class Intern extends Candidate {
	private String majors;
	private String semester;
	private String universityName;
	private Certificate certificate;



	public Intern(String candidateId, String fullName, String dayOfBirth, String phone, String email, int candidateType,
			int candidateCount, String majors, String semester, String universityName, Certificate certificate) {
		super(candidateId, fullName, dayOfBirth, phone, email, candidateType, candidateCount);
		this.majors = majors;
		this.semester = semester;
		this.universityName = universityName;
		this.certificate = certificate;
	}

	public String getMajors() {
		return majors;
	}

	public void setMajors(String majors) {
		this.majors = majors;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getUniversityName() {
		return universityName;
	}

	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}

	public Certificate getCertificate() {
		return certificate;
	}

	public void setCertificate(Certificate certificate) {
		this.certificate = certificate;
	}
	

	@Override
	public String toString() {
		return "Intern [majors=" + majors + ", semester=" + semester + ", universityName=" + universityName
				+ ", certificate=" + certificate + ", candidateId=" + candidateId + ", fullName=" + fullName
				+ ", dayOfBirth=" + dayOfBirth + ", phone=" + phone + ", email=" + email + ", candidateType="
				+ candidateType + ", candidateCount=" + candidateCount + "]";
	}

	@Override
	public void showInfo() {
		// TODO Auto-generated method stub
		
	}

}
