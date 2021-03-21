package dao;

import model.User;
import rowmaper.UserMapper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl extends AbstractDAO<User> implements UserDAO {
    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users ";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String FIND_BY_NAME = "select * from users where `name` like ? ";
    private static final String SUM_RECORD_SEARCH_BY_NAME = "select count(*) from users where `name` like ? ";
    private static final String SORT_BY_NAME = "select * from users order by name";
    private static final String SUM_RECORD = "select count(*) from users ";
    private static final String RECORD_PAGING = "select * from users limit ? offset ? ";
    private static final String RECORD_PAGING_SEARCH = "select * from users where name like ? limit ? offset ? ";
    BaseDAO baseDAO = new BaseDAO();

    @Override
    public Integer insertUser(User user) throws SQLException {
      return insert(INSERT_USERS_SQL,user.getName(),user.getEmail(),user.getCountry() );
    }

    public static void main(String[] args) {
        UserDAO userDAO =new UserDAOImpl();
        User user=new User("long","long long","long lon long");
        try {
            System.out.println(userDAO.insertUser(user));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<User> selectUser(Integer id) {
        return query(SELECT_USER_BY_ID,new UserMapper(),id);
    }




//    public static void main(String[] args) {
//        /* test */
//
////        UserDAO userDAO = new UserDAOImpl();
////        List<User> list=userDAO.selectUser(3);
////        if(list.size()==0){
////            System.out.println("'k otim thay");
////        }else {
////            System.out.println(list.get(0));
////        }
//    }


//    @Override
//    public User selectUser(int id) {
//        User user = null;
//        try {
//            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(SELECT_USER_BY_ID);
//            preparedStatement.setInt(1, id);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                String name = resultSet.getString("name");
//                String email = resultSet.getString("email");
//                String country = resultSet.getString("country");
//                user = new User(id, name, email, country);
//            }
//
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return user;
//    }

    @Override
    public List<User> selectAllUsers() {
        return query(SELECT_ALL_USERS,new UserMapper());
    }



    @Override
    public boolean deleteUser(Integer id) throws SQLException {
//        boolean rowDelete;
//        PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(DELETE_USERS_SQL);
//        preparedStatement.setInt(1, id);
//        rowDelete = preparedStatement.executeUpdate() > 0;
//        return rowDelete;
        return update(DELETE_USERS_SQL,id);
    }

//    public static void main(String[] args) {
//        UserDAO userDAO =new UserDAOImpl();
////        try {
//            System.out.println(userDAO.updateUser(new User(4,"phuong","phuongphuong","viet nammam")));
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        try {
//            System.out.println(userDAO.deleteUser(3));
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//    }


    @Override
    public boolean updateUser(User user)  {
//        boolean rowUpdate;
////        PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(UPDATE_USERS_SQL);
////        preparedStatement.setInt(4, user.getId());
////        preparedStatement.setString(1, user.getName());
////        preparedStatement.setString(2, user.getEmail());
////        preparedStatement.setString(3, user.getCountry());
////        rowUpdate = preparedStatement.executeUpdate() > 0;
//        return rowUpdate;
        return update(UPDATE_USERS_SQL, user.getName(),user.getEmail(),user.getCountry(),user.getId());
    }

//    public static void main(String[] args) {
//        UserDAO userDAO =new UserDAOImpl();
//        try {
//            boolean check=userDAO.updateUser(new User(3,"quang comomn","quoc pro","viet nam"));
//            System.out.println(check);
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//    }

//    @Override
//    public List<User> findName(String name) {
//        User user = null;
//        List<User> userList = new ArrayList<>();
//        try {
//            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(FIND_BY_NAME);
//
//            preparedStatement.setString(1, "%" + name + "%");
//            System.out.println(preparedStatement);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String nameUser = resultSet.getString("name");
//                String email = resultSet.getString("email");
//                String country = resultSet.getString("country");
//                user = new User(id, nameUser, email, country);
//                userList.add(user);
//            }
//
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return userList;
//    }

    @Override
    public List<User> sortByName() throws SQLException {
        User user = null;
        List<User> userList = new ArrayList<>();
        PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(SORT_BY_NAME);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String country = resultSet.getString("country");
            user = new User(id, name, email, country);
            userList.add(user);
        }
        return userList;
    }

    @Override
    public int sum_Record() throws SQLException {
        int sum = 0;
        PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(SUM_RECORD);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            return resultSet.getInt(1);
        }
        return 0;
    }


    @Override
    public List<User> listforpaging(int record_for_page, int page_index) {
        List<User> userList = new ArrayList<>();
        User user = null;
        try {
            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(RECORD_PAGING);
            preparedStatement.setInt(1, record_for_page);
            preparedStatement.setInt(2, (page_index - 1) * record_for_page);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public int end_Page(int record_For_Page) throws SQLException {
        int end_Page;
        int sumRecord = sum_Record();
        end_Page = sum_Record() / record_For_Page;
        if (end_Page %2 !=0) {
            end_Page++;
        }
        return end_Page;
    }

    @Override
    // 5
    public int sum_Record_Search(String name) throws SQLException {
        PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(SUM_RECORD_SEARCH_BY_NAME);
        preparedStatement.setString(1,"%"+name+"%");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            return resultSet.getInt(1);
        }
        return 0;
    }



    @Override
    public List<User> listForPagingSearchByName(int record_for_page, int page_index, String txt_name) {
        List<User> userList = new ArrayList<>();
        User user;
        try {
            PreparedStatement preparedStatement = this.baseDAO.getConnection().prepareStatement(RECORD_PAGING_SEARCH);
            preparedStatement.setString(1, "%" + txt_name + "%");
            preparedStatement.setInt(2, record_for_page);
            preparedStatement.setInt(3, (page_index - 1) * record_for_page);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
                userList.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }



    @Override
    public int end_Page_Result(int record_For_Page,String txt_Name) throws SQLException {
        int end_Page_For_Search;
        int sum_Record=sum_Record_Search(txt_Name);
        end_Page_For_Search=sum_Record/record_For_Page;
        if(end_Page_For_Search %2 != 0){
            end_Page_For_Search ++;
        }
        return end_Page_For_Search;
    }
//    public static void main(String[] args) throws SQLException {
//        UserDAOImpl userDAO =new UserDAOImpl();
//        System.out.println(userDAO.sum_Record_Search("q"));
//        System.out.println(userDAO.end_Page_Result(2,"q"));
//    }
// voi sum_Record =7 thi cho ket qua la true voi sum =5 thi cho ket qua la false

}
