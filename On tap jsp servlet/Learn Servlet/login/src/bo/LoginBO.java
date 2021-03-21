package bo;

import model.User;

import java.util.List;

public interface LoginBO {
    boolean findUser(String name,String pass);

}
