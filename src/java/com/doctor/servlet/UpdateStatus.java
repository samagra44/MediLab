/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.doctor.servlet;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        try{
            int id = Integer.parseInt(req.getParameter("id"));
            int did = Integer.parseInt(req.getParameter("did"));
            String comm = req.getParameter("comm");
            AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
            HttpSession session = req.getSession();
            if(dao.updateCommentStatus(id, did, comm))
            {
                session.setAttribute("succMsg", "Commented");
                res.sendRedirect("patient.jsp");
            }else{
                  session.setAttribute("errorMsg", "Error");
                res.sendRedirect("patient.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
}
