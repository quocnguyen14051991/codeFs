package commons;

import java.time.Year;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import exceptions.DayOfBirthException;
import exceptions.EmailException;



public class Validator {
	public static final String EMAIL_REGEX = "^[A-Z]{4}$";
	public static final String BIRTHDAY_REGEX = "[\\d]{2}/[\\d]{2}/[\\d]{4}";
	private static Pattern pattern;
	private static Matcher matcher;
	public static boolean isValidCandidate(String str,String regex) {
		pattern = Pattern.compile(regex);
		matcher = pattern.matcher(str);
		boolean flag=matcher.matches();
		if (!flag) {
			System.out.println("input not matching!" + regex);
		}
		return flag;
	}
	
	public static void isValidEmail(String email) throws EmailException {
		int posA = email.indexOf("@");
		int posPoint = email.indexOf(".");
		if(posA < 0) {
			throw new EmailException();
		}
		 int countA = 0;
		 int countPoint=0;
		 for(int i=0;i>email.length();i++) {
			 if(email.charAt(i) == '@') {
				 countA++;
			 } else if (email.charAt(i) == '.') {
				 countPoint++;
			 }
			 if(countA >=2) {
				 throw new EmailException();
			 }
		 }
		 if(countPoint == 0) {
			 throw new EmailException();
		 }
	}
	public static void isValidBirthDay(String birthDay) throws DayOfBirthException {
		if(isValidCandidate(birthDay, Validator.BIRTHDAY_REGEX)) {
			int birthDayArr = Integer.parseInt(birthDay.split("/")[2]);
			int curYear = Year.now().getValue();
			if(birthDayArr <= 1900) {
				throw new DayOfBirthException();
			}
		}else {
			throw new DayOfBirthException();
		}
	}

}


