package com.example.demo;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DatabaseConnection;
import Module.*;

import static Module.HashPassword.hashPassword;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password_hash"); // Raw password
        String email = request.getParameter("email");
        String fullName = request.getParameter("full_name");
        String gender = request.getParameter("gender");
        int roleId = Integer.parseInt(request.getParameter("role_id"));
        String status = "active";

        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Hash the password before storing it
            String hashedPassword = hashPassword(password);

            connection = DatabaseConnection.getConnection();

            // Check if username or email already exists
            String checkUserSql = "SELECT * FROM users WHERE username = ? OR email = ?";
            stmt = connection.prepareStatement(checkUserSql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Username or email already exists
                request.setAttribute("error", "Username or email already exists.");
                request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
                return;
            }

            // Insert the new user into the database
            String insertSql = "INSERT INTO users (username, email, password_hash, full_name, gender, role_id, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = connection.prepareStatement(insertSql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, hashedPassword); // Store the hashed password
            stmt.setString(4, fullName);
            stmt.setString(5, gender);
            stmt.setInt(6, roleId);
            stmt.setString(7, status);

            stmt.executeUpdate();

            // Redirect to login page after successful registration
            ReturnMail mail = new ReturnMail();
            String capcha = mail.generateVerificationCode();
            mail.sendMail(email,capcha);
            session.setAttribute("email", email);
            session.setAttribute("capcha", capcha);
            response.sendRedirect(request.getContextPath() + "/jsp/verify-register.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed due to server error.");
            request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
