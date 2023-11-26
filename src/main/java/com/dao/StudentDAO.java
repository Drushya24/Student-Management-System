
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Student;

public class StudentDAO {
    private Connection conn;

    public StudentDAO(Connection conn){
        super();
        this.conn = conn;
    }

    public boolean addStudent(Student s) {
        boolean flag = false;

        String sql = "insert into student(name, dob, phone) values(?,?,?)";

        try {
            PreparedStatement p;
            p = conn.prepareStatement(sql);
            p.setString(1, s.getName());
            p.setString(2, s.getDob());
            p.setString(3, s.getPhone());

            if(p.executeUpdate()== 1) {
                flag=true;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return flag;
    }

    public List<Student> getAllStudents(){
    List<Student> list = new ArrayList<Student>();
    Student s = null;
    try {
        String sql = "select * from student";
        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()){
            s = new Student();
            s.setId(rs.getInt(1));
            s.setName(rs.getString(2));
            s.setPhone(rs.getString(3));
            s.setDob(rs.getString(4));
            list.add(s);
        }
    }catch (Exception e){
        e.printStackTrace();
    }
    return list;
    }

    public Student getStudentById(int id){
        Student s = null;
        try {
            String sql = "select * from student where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s = new Student();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setPhone(rs.getString(3));
                s.setDob(rs.getString(4));
            }
            System.out.println(s);
        }catch (Exception e){
            e.printStackTrace();
        }
        return s;
    }

    public boolean updateStudent(Student s) {
        boolean flag = false;
        try {
            String sql = "update student SET name=?, dob=?, phone=? where id=?";
            PreparedStatement p;
            p = conn.prepareStatement(sql);
            p.setString(1, s.getName());
            p.setString(2, s.getDob());
            p.setString(3, s.getPhone());
            p.setInt(4,s.getId());

            if(p.executeUpdate()== 1) {
                flag=true;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return flag;
    }

    public boolean deleteStudent(int id) {
        boolean flag = false;
        try {
            String sql = "delete from student where id=?";
            PreparedStatement p;
            p = conn.prepareStatement(sql);
            p.setInt(1,id);
            System.out.println(p);

            if(p.executeUpdate()== 1) {
                flag=true;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return flag;
    }
}