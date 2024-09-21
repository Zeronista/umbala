package com.example.demo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DatabaseConnection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password_hash");
        String email = request.getParameter("email");
        String fullName = request.getParameter("full_name");
        String gender = request.getParameter("gender");
        int roleId = Integer.parseInt(request.getParameter("role_id"));
        String status = "active";

        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = DatabaseConnection.getConnection();
            String sql = "INSERT INTO users (username, email, password_hash, full_name, gender, role_id, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, fullName);
            stmt.setString(5, gender);
            stmt.setInt(6, roleId);
            stmt.setString(7, status);
            stmt.executeUpdate();
            response.sendRedirect("login.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
    }
}