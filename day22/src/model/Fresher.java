package model;

public class Fresher extends Candidate {
	private String graduationDate;
	private String graduationRank;
	private String education;
	private Certificate certificate;
	public Fresher(String candidateId, String fullName, String dayOfBirth, String phone, String email,
			int candidateType, int candidateCount, String graduationDate, String graduationRank, String education,
			Certificate certificate) {
		super(candidateId, fullName, dayOfBirth, phone, email, candidateType, candidateCount);
		this.graduationDate = graduationDate;
		this.graduationRank = graduationRank;
		this.education = education;
		this.certificate = certificate;
	}
	
	
	public String getGraduationDate() {
		return graduationDate;
	}


	public void setGraduationDate(String graduationDate) {
		this.graduationDate = graduationDate;
	}


	public String getGraduationRank() {
		return graduationRank;
	}


	public void setGraduationRank(String graduationRank) {
		this.graduationRank = graduationRank;
	}


	public String getEducation() {
		return education;
	}


	public void setEducation(String education) {
		this.education = education;
	}


	public Certificate getCertificate() {
		return certificate;
	}


	public void setCertificate(Certificate certificate) {
		this.certificate = certificate;
	}


	@Override
	public void showInfo() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public String toString() {
		return "Fresher [graduationDate=" + graduationDate + ", graduationRank=" + graduationRank + ", education="
				+ education + ", certificate=" + certificate + ", candidateId=" + candidateId + ", fullName=" + fullName
				+ ", dayOfBirth=" + dayOfBirth + ", phone=" + phone + ", email=" + email + ", candidateType="
				+ candidateType + ", candidateCount=" + candidateCount + "]";
	}
	
	

}
