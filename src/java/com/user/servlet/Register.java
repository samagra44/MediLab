/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user_register")
public class Register extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            User u = new User(fullName, email, password);
            UserDao dao = new UserDao(DBConnect.getCon());
            HttpSession session = req.getSession();

            boolean f = dao.register(u);
            if (f) {
                session.setAttribute("sucMsg", "RegisteredSuccessFully");
                res.sendRedirect("signup.jsp");
            } else {
                session.setAttribute("errorMsg", "Something Went Wrong");
                res.sendRedirect("signup.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
