/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
        String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		UserDao dao = new UserDao(DBConnect.getCon());
		User user = dao.login(email, password);

		if (user != null) {
			session.setAttribute("userObj", user);
			res.sendRedirect("mainPage.jsp");
		} else {
			session.setAttribute("errorMsg", "invalid email & password");
			res.sendRedirect("user_login.jsp");
		}

	}

}
    

