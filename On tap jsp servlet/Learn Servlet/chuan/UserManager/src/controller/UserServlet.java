package controller;

import bo.UserBO;
import bo.UserBOImpl;
import model.User;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"", "/users"})
public class UserServlet extends HttpServlet {
    UserBO userBO = new UserBOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("");
        }
        switch (action) {

            case "create": {
                String message;
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                try {
                    message = userBO.insertUser(new User(name, email, country));
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("create.jsp").forward(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
            case "edit": {
                String message = null;
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                User user = new User(id, name, email, country);

                try {
                    if (userBO.updateUser(user)) {
                        message = "edit ok";
                    } else {
                        message = "edit not ok";
                    }
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("edit.jsp").forward(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            List<User> userList = userBO.selectAllUsers();
            request.setAttribute("listUser", userList);
            request.getRequestDispatcher("list.jsp").forward(request, response);
        }
        switch (action) {
            case "create": {
                response.sendRedirect("create.jsp");
                break;
            }
            case "edit": {
                User user = null;
                int id = Integer.parseInt(request.getParameter("id"));
                user = userBO.selectUser(id);
                request.setAttribute("user", user);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;
            }
            case "delete": {
                User user=null;
                int id=Integer.parseInt(request.getParameter("id"));
                try {
                    userBO.deleteUser(id);
                    List<User> listUser=userBO.selectAllUsers();
                    request.setAttribute("listUser",listUser);
                    request.getRequestDispatcher("list.jsp").forward(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            case "search":
                {
                String name= request.getParameter("find");
                String message=null;
                try {
                    List<User> userList =userBO.findName(name);
                    if(userList.size()==0){
                        message="Name not Found";
                        request.setAttribute("message",message);
                    }else {
                        request.setAttribute("listUser",userList);
                    }
                    request.getRequestDispatcher("list.jsp").forward(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            }
        }
    }
}
