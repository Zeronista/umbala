package com.example.demo;

import entity.Blog;
import entity.Subject;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DatabaseConnection;

@WebServlet(name = "dataServlet", value = "/data")
public class DataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> subjects = new ArrayList<>();
        List<Blog> blogs = new ArrayList<>();

        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = DatabaseConnection.getConnection();

            // Fetch subjects
            String sqlSubjects = "SELECT * FROM Subjects";
            stmt = connection.prepareStatement(sqlSubjects);
            rs = stmt.executeQuery();
            while (rs.next()) {
                subjects.add(new Subject(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("category"),
                        rs.getString("thumbnail_url"),
                        rs.getString("status"),
                        rs.getInt("created_by"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"),
                        rs.getBytes("avatar")
                ));
            }
            System.out.println("Fetched subjects: " + subjects.size()); // Debug log
            rs.close();
            stmt.close();

            // Fetch blogs
            String sqlBlogs = "SELECT * FROM BlogPosts";
            stmt = connection.prepareStatement(sqlBlogs);
            rs = stmt.executeQuery();
            while (rs.next()) {
                blogs.add(new Blog(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("author_id"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"),
                        rs.getBytes("avatar")
                ));
            }
            System.out.println("Fetched blogs: " + blogs.size()); // Debug log

            // Set the data to the request attributes
            request.setAttribute("subjects", subjects);
            request.setAttribute("blogs", blogs);

            // Forward to JSP
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
    }
}
