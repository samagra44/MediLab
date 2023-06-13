/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/adminLogout")
public class adminLogout extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException{
        HttpSession session = req.getSession();
        session.removeAttribute("adminObj");
        session.setAttribute("succMsg", "Logout Successfuly");
        res.sendRedirect("admin_login.jsp");
    }
    
}
