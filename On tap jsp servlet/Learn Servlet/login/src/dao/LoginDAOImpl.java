package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAOImpl implements LoginDAO {
    private static final String SELECT_USER = "select * from userreg where name= ? and pass= ? ";
   BaseDAO baseDAO =new BaseDAO();

    @Override
    public boolean findUser(String name, String pass) {
        boolean status=false;
        try {
            Connection connection= this.baseDAO.getConnection();
            System.out.println("conection"+connection);
            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(SELECT_USER);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, pass);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            status=resultSet.next();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return status;
    }
}
