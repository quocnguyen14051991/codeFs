package exceptions;

public class DayOfBirthException extends Exception {
	public DayOfBirthException() {
		super("Day of birth > 1900 and < today");
	}

}
