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

@WebServlet("/update")
public class Update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String dob = req.getParameter("dob");
        int id = Integer.parseInt(req.getParameter("id"));

        Student student = new Student(id, name, dob, phone);

        System.out.println(name);
        StudentDAO sd = new StudentDAO(DBconnect.getConn());
        HttpSession session = req.getSession();
        if(sd.updateStudent(student)) {
            session.setAttribute("succMsg", "Student updated successfully.....");
            resp.sendRedirect("index.jsp");
        }else {
            session.setAttribute("errMsg", "Error updating student.....");
            resp.sendRedirect("index.jsp");
        }
    }

}
