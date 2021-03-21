package controller;

import bo.LoginBO;
import bo.loginBOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"", "/login"})
public class LoginServlet extends HttpServlet {
    LoginBO loginBO = new loginBOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = null;
        String name = request.getParameter("username");
        String pass = request.getParameter("password");
        if (loginBO.findUser(name, pass)) {
            request.getRequestDispatcher("welcome").forward(request, response);
        } else {
            message = "Sorry username or password error";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }
}
