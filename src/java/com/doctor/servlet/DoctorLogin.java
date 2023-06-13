/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.doctor.servlet;

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

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

        DoctorDao dao = new DoctorDao(DBConnect.getCon());
        Doctor doctor = dao.login(email, password);

        if (doctor != null) {
            session.setAttribute("doctObj", doctor);
            res.sendRedirect("doctor_index.jsp");
        } else {
            session.setAttribute("errorMsg", "invalid email & password");
            res.sendRedirect("doctor_login.jsp");
        }
    }

}
