/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/appAppointment")
public class AppointmentServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userid"));
        String fullname = req.getParameter("fullname");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        String appoint_date = req.getParameter("appoint_date");
        String email = req.getParameter("email");
        String phno = req.getParameter("phno");
        String diseases = req.getParameter("diseases");
        int doctor_id = Integer.parseInt(req.getParameter("doct"));
        String address = req.getParameter("address");

        Appointment ap = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id,
                address, "Pending");

        AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
        HttpSession session = req.getSession();

        if (dao.addAppointment(ap)) {
            session.setAttribute("succMsg", "Appointment Sucessfully");
            res.sendRedirect("user_appointment.jsp");
        } else {
            session.setAttribute("errorMsg", "Something wrong on server");
            res.sendRedirect("user_appointment.jsp");
        }

    }

}
