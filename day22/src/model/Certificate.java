package model;

public class Certificate {
	private String certificatedID;
	private String certificateName;
	private String certificateRank;
	private String certificatedDate;
	
	public Certificate(String certificatedID, String certificateName, 
			String certificateRank, String certificatedDate) {
		certificatedID = certificatedID;
		certificateName = certificateName;
		certificateRank = certificateRank;
		certificatedDate = certificatedDate;
	}
	
	public Certificate() {
		
	}

	public String getCertificatedID() {
		return certificatedID;
	}


	public void setCertificatedID(String certificatedID) {
		certificatedID = certificatedID;
	}


	public String getCertificateName() {
		return certificateName;
	}


	public void setCertificateName(String certificateName) {
		certificateName = certificateName;
	}


	public String getCertificateRank() {
		return certificateRank;
	}


	public void setCertificateRank(String certificateRank) {
		certificateRank = certificateRank;
	}


	public String getCertificatedDate() {
		return certificatedDate;
	}


	public void setCertificatedDate(String certificatedDate) {
		certificatedDate = certificatedDate;
	}

	@Override
	public String toString() {
		return "Certificate [CertificatedID=" + certificatedID + ", CertificateName=" + certificateName
				+ ", CertificateRank=" + certificateRank + ", CertificatedDate=" + certificatedDate + "]";
	}




}
