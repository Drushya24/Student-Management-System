package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.StudentDAO;
import com.entity.Student;

@WebServlet("/register")
public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String dob = req.getParameter("dob");
		
		Student student = new Student(name, dob, phone);
		
		System.out.println(name);
		StudentDAO sd = new StudentDAO(DBconnect.getConn());
		HttpSession session = req.getSession();
		if(sd.addStudent(student)) {
			session.setAttribute("succMsg", "Student created successfully.....");
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("errMsg", "Error creating student.....");
			resp.sendRedirect("index.jsp");
		}
	}
	
}
