package model;

public class Experience extends Candidate {
private double expInYear;
private String proSkill;
private Certificate certificate;


public Experience(String candidateId, String fullName, String dayOfBirth, String phone, String email, int candidateType,
		int candidateCount, double expInYear, String proSkill, Certificate certificate) {
	super(candidateId, fullName, dayOfBirth, phone, email, candidateType, candidateCount);
	this.expInYear = expInYear;
	this.proSkill = proSkill;
	this.certificate = certificate;
}


public Experience() {
	
}

public double getExpInYear() {
	return expInYear;
}


public void setExpInYear(double expInYear) {
	this.expInYear = expInYear;
}


public String getProSkill() {
	return proSkill;
}


public void setProSkill(String proSkill) {
	this.proSkill = proSkill;
}


public Certificate getCertificate() {
	return certificate;
}


public void setCertificate(Certificate certificate) {
	this.certificate = certificate;
}






@Override
public String toString() {
	return "Experience [expInYear=" + expInYear + ", proSkill=" + proSkill + ", certificate=" + certificate
			+ ", candidateId=" + candidateId + ", fullName=" + fullName + ", dayOfBirth=" + dayOfBirth + ", phone="
			+ phone + ", email=" + email + ", candidateType=" + candidateType + ", candidateCount=" + candidateCount
			+ "]";
}


@Override
public void showInfo() {
	
}

}
