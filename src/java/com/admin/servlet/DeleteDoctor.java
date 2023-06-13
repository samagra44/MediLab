/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.dao.DoctorDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {
    protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        	int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DBConnect.getCon());
		HttpSession session = req.getSession();

		if (dao.deleteDoctor(id)) {
			session.setAttribute("succMsg", "Doctor Delete Sucessfully..");
			res.sendRedirect("view_doctor.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			res.sendRedirect("view_doctor.jsp");
		}
		

        
    }
    
}
