package dao;

import model.User;

import java.util.List;

public interface LoginDAO {
   boolean findUser(String name,String pass);
}
