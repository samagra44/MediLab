/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            HttpSession session = req.getSession();
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                session.setAttribute("adminObj", new User());
                res.sendRedirect("AdminPage.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid Email or Password");
                res.sendRedirect("admin_login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
