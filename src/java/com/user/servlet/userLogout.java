/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/userLogout")
public class userLogout extends HttpServlet {
      protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException{
        HttpSession session = req.getSession();
        session.removeAttribute("userObj");
        session.setAttribute("succMsg", "Logout Successfuly");
        res.sendRedirect("user_login.jsp");
      }
}
