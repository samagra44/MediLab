/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.dao.UserDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/userChangePassword")
public class changePassword extends HttpServlet {
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");

		UserDao dao = new UserDao(DBConnect.getCon());
		HttpSession session = req.getSession();

		if (dao.checkOldPassword(uid, oldPassword)) {

			if (dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password Change Sucessfully");
				res.sendRedirect("change_password.jsp");

			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				res.sendRedirect("change_password.jsp");
			}

		} else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
			res.sendRedirect("change_password.jsp");
		}
    }
    
}
