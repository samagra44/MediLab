/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.doctor.servlet;

import com.dao.DoctorDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");

		DoctorDao dao = new DoctorDao(DBConnect.getCon());
		HttpSession session = req.getSession();

		if (dao.checkOldPassword(uid, oldPassword)) {

			if (dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password Change Sucessfully");
				res.sendRedirect("edit_profile.jsp");

			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				res.sendRedirect("edit_profile.jsp");
			}

		} else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
			res.sendRedirect("edit_profile.jsp");
		}
    }
    
}
