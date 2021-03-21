package bo;

import dao.LoginDAO;
import dao.LoginDAOImpl;

public class loginBOImpl implements LoginBO {
    LoginDAO loginDAO = new LoginDAOImpl();


    @Override
    public boolean findUser(String name, String pass) {
        return loginDAO.findUser(name,pass);
    }


}
