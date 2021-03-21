package bo;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserBO {
    public String insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
//    public List<User> findName(String name) throws SQLException;
    public List<User> sortByName() throws  SQLException;
    public List<User> listforpaging(int record_for_page,int page_index);
    public int end_Page(int record_For_Page) throws  SQLException;
    public List<User> listForPagingSearchByName(int record_for_page,int page_index,String txt_Name);
    public int end_Page_Result(int record_For_Page,String txt_Name) throws SQLException;
}
