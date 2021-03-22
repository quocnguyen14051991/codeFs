package rowmaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.Certificate;
import model.Experience;



public class ExpRowImpl implements RowMaperG<Experience> {

	@Override
	public Experience mapRow(ResultSet resultSet) throws SQLException {
		Experience experience = new Experience();
		Certificate certificate = new Certificate();
		certificate.setCertificatedID(resultSet.getString("certificated_id"));
		certificate.setCertificateName(resultSet.getString("certificate_name"));
		certificate.setCertificateRank(resultSet.getString("certificate_rank"));
		certificate.setCertificatedDate(resultSet.getString("certificated_date"));
		
		experience.setCandidateId(resultSet.getString("candidate_id"));
		experience.setFullName(resultSet.getString("full_name"));
		experience.setDayOfBirth(resultSet.getString("day_of_birth"));
		experience.setPhone(resultSet.getString("phone"));
		experience.setEmail(resultSet.getString("email"));
		experience.setCandidateType(resultSet.getInt("candidateType"));
		experience.setExpInYear(resultSet.getInt("exp_in_year"));
		experience.setProSkill(resultSet.getString("pro_skill"));
		experience.setCertificate(certificate);
		
		return experience;
		
	}

}
