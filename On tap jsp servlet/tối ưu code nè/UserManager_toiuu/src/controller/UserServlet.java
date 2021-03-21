//package controller;
//
//import bo.UserBO;
//import bo.UserBOImpl;
//import model.User;
//
//import javax.jws.soap.SOAPBinding;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//@WebServlet(name = "UserServlet", urlPatterns = {"", "/users"})
//public class UserServlet extends HttpServlet {
//    UserBO userBO = new UserBOImpl();
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if (action == null) {
//            response.sendRedirect("");
//        }
//        switch (action) {
//
//            case "create": {
//                String message;
//                String name = request.getParameter("name");
//                String email = request.getParameter("email");
//                String country = request.getParameter("country");
//                try {
//                    message = userBO.insertUser(new User(name, email, country));
//                    request.setAttribute("message", message);
//                    request.getRequestDispatcher("create.jsp").forward(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                break;
//            }
//            case "edit": {
//                String message = null;
//                int id = Integer.parseInt(request.getParameter("id"));
//                String name = request.getParameter("name");
//                String email = request.getParameter("email");
//                String country = request.getParameter("country");
//                User user = new User(id, name, email, country);
//
//                try {
//                    if (userBO.updateUser(user)) {
//                        message = "edit ok";
//                    } else {
//                        message = "edit not ok";
//                    }
//                    request.setAttribute("message", message);
//                    request.getRequestDispatcher("edit.jsp").forward(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                break;
//            }
//        }
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if (action == null) {
//            int end_Page = 0;
//            try {
//                end_Page = userBO.end_Page(3);
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//            int page_Index = 1;
//            List<User> userList;
//            userList = userBO.listforpaging(3, page_Index);
//            request.setAttribute("end_Page", end_Page);
//            request.setAttribute("listUser", userList);
//            request.getRequestDispatcher("list.jsp").forward(request, response);
//        }
//        switch (action) {
//            case "create": {
//                response.sendRedirect("create.jsp");
//                break;
//            }
//            case "edit": {
//                User user = null;
//                int id = Integer.parseInt(request.getParameter("id"));
//                user = userBO.selectUser(id);
//                request.setAttribute("user", user);
//                request.getRequestDispatcher("edit.jsp").forward(request, response);
//                break;
//            }
//            case "delete": {
//                User user = null;
//                int id = Integer.parseInt(request.getParameter("id"));
//                try {
//                    userBO.deleteUser(id);
//                    List<User> listUser = userBO.selectAllUsers();
//                    request.setAttribute("listUser", listUser);
//                    request.getRequestDispatcher("list.jsp").forward(request, response);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                break;
//            }
//            case "search": {
//                String txt_Name = request.getParameter("find");
//                int end_Page = 0;
//                try {
//                    end_Page = userBO.end_Page_Result(2, txt_Name);
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                int page_Index = 1;
//                String message = null;
//                List<User> userList = null;
//                userList = userBO.listForPagingSearchByName(2, page_Index, txt_Name);
//                if (userList.size() == 0) {
//                    message = "Name not Found";
//                    request.setAttribute("message", message);
//                } else {
//                    request.setAttribute("txt_Search",txt_Name);
//                    request.setAttribute("listUser", userList);
//                    request.setAttribute("end_Page", end_Page);
//                    request.setAttribute("listUser", userList);
//                    request.getRequestDispatcher("list.jsp").forward(request, response);
//                }
//                request.getRequestDispatcher("list.jsp").forward(request, response);
//                break;
//            }
//            case "paging": {
//                String txt_Search = request.getParameter("txt_Search");
//                if (txt_Search.equals("")) {
//                    int end_Page = 0;
//                    try {
//                        end_Page = userBO.end_Page(3);
//                    } catch (SQLException throwables) {
//                        throwables.printStackTrace();
//                    }
//                    int page_Index = Integer.parseInt(request.getParameter("page_index"));
//                    List<User> userList = new ArrayList<>();
//                    userList = userBO.listforpaging(3, page_Index);
//                    request.setAttribute("end_Page", end_Page);
//                    request.setAttribute("listUser", userList);
//                    request.getRequestDispatcher("list.jsp").forward(request, response);
//                } else {
//                    int end_Page_Search = 0;
//                    try {
//                        end_Page_Search = userBO.end_Page_Result(2, txt_Search);
//                    } catch (SQLException throwables) {
//                        throwables.printStackTrace();
//                    }
//                    int page_Index_Search = Integer.parseInt(request.getParameter("page_index"));
//                    List<User> userList_Search = null;
//                    userList_Search = userBO.listForPagingSearchByName(2, page_Index_Search, txt_Search);
//                    request.setAttribute("txt_Search",txt_Search);
//                    request.setAttribute("end_Page", end_Page_Search);
//                    request.setAttribute("listUser", userList_Search);
//                    request.getRequestDispatcher("list.jsp").forward(request, response);
//                }
//                break;
//            }
//        }
//    }
//
//}
