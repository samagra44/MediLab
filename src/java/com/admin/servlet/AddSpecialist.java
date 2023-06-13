/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.dao.SpecialistDao;
import com.db.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException{
        String specName = req.getParameter("specName");
        SpecialistDao dao = new SpecialistDao(DBConnect.getCon());
        boolean f = dao.addSpecialist(specName);
        HttpSession session = req.getSession();
         if (f) {
                session.setAttribute("succMsg", "Specialist Added");
                res.sendRedirect("AdminPage.jsp");
            } else {
                session.setAttribute("errorMsg", "Error");
                res.sendRedirect("AdminPage.jsp");
            }
    }
    
}
