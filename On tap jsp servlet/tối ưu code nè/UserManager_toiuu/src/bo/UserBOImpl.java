//package bo;
//
//import dao.UserDAO;
//import dao.UserDAOImpl;
//import model.User;
//
//import java.sql.SQLException;
//import java.util.List;
//
//public class UserBOImpl implements  UserBO {
//    UserDAO userDAO =new UserDAOImpl();
//    @Override
//    public String insertUser(User user) throws SQLException {
//        String message=null;
//        if(user.equals(null)){
//            message="Add new not ok";
//        }else {
//            message= userDAO.insertUser(user);
//        }
//        return message;
//    }
//
////    @Override
////    public User selectUser(int id) {
////        return userDAO.selectUser(id);
////    }
//
//    @Override
//    public List<User> selectAllUsers() {
//       return userDAO.selectAllUsers();
//    }
//
//    @Override
//    public boolean deleteUser(int id) throws SQLException {
//        return userDAO.deleteUser(id);
//    }
//
//    @Override
//    public boolean updateUser(User user) throws SQLException {
//        boolean check=false;
//        check=userDAO.updateUser(user);
//        return check;
//    }
//
////    @Override
////    public List<User> findName(String name) throws SQLException {
////     return userDAO.findName(name);
////    }
//
//    @Override
//    public List<User> sortByName() throws SQLException {
//        return userDAO.sortByName();
//    }
//
//    @Override
//    public List<User> listforpaging(int record_for_page, int page_index) {
//        return userDAO.listforpaging(record_for_page,page_index);
//    }
//
//    @Override
//    public int end_Page(int record_For_Page) throws SQLException {
//        return userDAO.end_Page(record_For_Page);
//    }
//
//    @Override
//    public List<User> listForPagingSearchByName(int record_for_page, int page_index, String txt_Name) {
//        return userDAO.listForPagingSearchByName(record_for_page,page_index,txt_Name);
//    }
//
//    @Override
//    public int end_Page_Result(int record_For_Page, String txt_Name) throws SQLException {
//        return userDAO.end_Page_Result(record_For_Page,txt_Name);
//    }
//}
