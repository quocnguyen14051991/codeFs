package controller;

import java.util.Scanner;

import commons.Validator;
import exceptions.DayOfBirthException;
import exceptions.EmailException;

public class MainController {
	public static void main(String[] args) {
		MainController.displayMainMenu();
	}

	private static Scanner sc = new Scanner(System.in);
	private static boolean isExist;
	private static String EXPERIENCE = " experience";
	private static String FRESHER = "fresher";
	private static String INTERN = "intern";

	public static void displayMainMenu() {
		int choose = 0;
		do {
			System.out.println("1. Add New Candidate\n" + "2. Show Candidates \n" + "3. Update Candidate \n"
					+ "4. Delete Candidate \n" + "5. Exist \n");

			System.out.println("Please Choose 1-5: ");
			choose = sc.nextInt();
			switch (choose) {
			case 1: {

				addNewCandidate();
				break;
			}
			case 2: {

				showCandidate();
				break;
			}
			case 3: {

				updateCandidate();
				break;
			}
			case 4: {

				deleteCandidate();
				break;
			}
			case 5: {
				isExist = true;
				break;
			}
			default:
				System.out.println("Please Choose Again!");
				displayMainMenu();
			}
			if (isExist) {
				break;
			}
		} while (choose >= 1 && choose <= 7);
	}

	private static void exists() {
		// TODO Auto-generated method stub

	}

	private static void deleteCandidate() {
		// TODO Auto-generated method stub

	}

	private static void updateCandidate() {
		// TODO Auto-generated method stub

	}

	private static void showCandidate() {
		// TODO Auto-generated method stub
		int choose = 0;
		do {
			System.out.println("1. Show All Info Experience\n" + "2.  Show All Info Fresher \n"
					+ "3. Show All Info Intern \n" + "4. Back To Menu \n" + "5. Exist \n");
			System.out.println("Please Choose Candidate To Show");
			choose = sc.nextInt();
			switch (choose) {
			case 1: {
				showAllCandidate(EXPERIENCE);
				break;
			}
			case 2: {
				showAllCandidate(FRESHER);
				break;
			}
			case 3: {
				showAllCandidate(INTERN);
				break;
			}
			case 4: {
				displayMainMenu();
				break;
			}
			case 5: {
				isExist = true;
				break;
			}

			default:
				System.out.println("Please Choose Again!");
				showCandidate();
			}
			if (isExist) {
				return;
			}
		} while (choose >= 1 && choose <= 5);

	}

	private static void showAllCandidate(String eXPERIENCE2) {
		// TODO Auto-generated method stub

	}

	private static void addNewCandidate() {
		// TODO Auto-generated method stub
		int choose = 0;
		do {
			System.out.println("1. Add New Experience\n" + "2. Add New Fresher \n" + "3. Add New Intern \n"
					+ "4. Back To Menu \n" + "5. Exist \n");
			System.out.println("Please Choose Candidate To Add");
			choose = sc.nextInt();
			switch (choose) {
			case 1: {
				addNewCandidates(EXPERIENCE);
				break;
			}
			case 2: {
				addNewCandidates(FRESHER);
				break;
			}
			case 3: {
				addNewCandidates(INTERN);
				break;
			}
			case 4: {
				displayMainMenu();
				break;
			}
			case 5: {
				isExist = true;
				break;
			}
			default:
				System.out.println("Please Choose Again!");
				addNewCandidate();
			}
			if (isExist) {
				return;
			}
		} while (choose >= 1 && choose <= 5);

	}

	private static void addNewCandidates(String obj) {
		boolean flag ;
		// TODO Auto-generated method stub
		sc.nextLine();
		System.out.println("please input candidate Id :");
		String candidateId = sc.nextLine();

		System.out.println("please input full Name :");
		String fullName = sc.nextLine();

		String dayOfBirth = null;
		do {
			flag =true;
			System.out.println("please input day Of Birth :");
			dayOfBirth = sc.nextLine();
			try {
				Validator.isValidBirthDay(dayOfBirth);
			} catch (DayOfBirthException e) {
				// TODO Auto-generated catch block
				flag =false;
				e.printStackTrace();
			}
			
		}while(!flag);
		

		System.out.println("please input phone :");
		String phone = sc.nextLine();

		
		String email = null;
		do {
			flag = true;
			System.out.println("please input email :");
			email = sc.nextLine();
			try {
				Validator.isValidEmail(email);
			} catch (EmailException e) {
				// TODO Auto-generated catch block
				flag =false;
				e.printStackTrace();
			}
		} while (!flag);
		
		

		System.out.println("please input candidate Type :");
		int candidateType = sc.nextInt();

		System.out.println("please input candidate Count :");
		int candidateCount = sc.nextInt();

		if (obj.equals(EXPERIENCE)) {

			System.out.println("Please input expInYear :");
			double expInYear = sc.nextDouble();

			sc.nextLine();
			System.out.println("Please input proSkill :");
			String proSkill = sc.nextLine();

			System.out.println("Please input Certificated ID :");
			String certificatedID = sc.nextLine();

			System.out.println("Please input certificate Name :");
			String certificateName = sc.nextLine();

			System.out.println("Please input  certificate Rank :");
			String certificateRank = sc.nextLine();

			System.out.println("Please input  certificated Date :");
			String certificatedDate = sc.nextLine();

		} else if (obj.equals(FRESHER)) {
			sc.nextLine();
			System.out.println("Please input graduation Date :");
			String graduationDate = sc.nextLine();

			System.out.println("Please input graduation Rank :");
			String graduationRank = sc.nextLine();

			System.out.println("Please input education :");
			String education = sc.nextLine();

			System.out.println("Please input Certificated ID :");
			String certificatedID = sc.nextLine();

			System.out.println("Please input certificate Name :");
			String certificateName = sc.nextLine();

			System.out.println("Please input  certificate Rank :");
			String certificateRank = sc.nextLine();

			System.out.println("Please input  certificated Date :");
			String certificatedDate = sc.nextLine();

		} else if (obj.equals(INTERN)) {
			sc.nextLine();
			System.out.println("Please input majors :");
			String majors = sc.nextLine();

			System.out.println("Please input semester :");
			String semester = sc.nextLine();

			System.out.println("Please input universityName :");
			String universityName = sc.nextLine();

			System.out.println("Please input Certificated ID :");
			String certificatedID = sc.nextLine();

			System.out.println("Please input certificate Name :");
			String certificateName = sc.nextLine();

			System.out.println("Please input  certificate Rank :");
			String certificateRank = sc.nextLine();

			System.out.println("Please input  certificated Date :");
			String certificatedDate = sc.nextLine();

		}

	}

}
