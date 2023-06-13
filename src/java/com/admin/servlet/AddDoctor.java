/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobNo = req.getParameter("mobno");
            String password = req.getParameter("password");

            Doctor d = new Doctor(fullName, dob, qualification, spec, email, mobNo, password);
            DoctorDao dao = new DoctorDao(DBConnect.getCon());
            HttpSession session = req.getSession();
            if (dao.registerDoctor(d)) {
                session.setAttribute("succMsg", "Doctor Added....");
                res.sendRedirect("doctor.jsp");

            }else{
                 session.setAttribute("errorMsg", "Error....");
                res.sendRedirect("doctor.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
                
                
    }

}
