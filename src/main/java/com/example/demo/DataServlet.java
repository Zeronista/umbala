package com.example.demo;

import entity.Subject;
import model.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DataServlet {

    public List<Subject> fetchSubjects() throws SQLException, ClassNotFoundException {
        List<Subject> subjects = new ArrayList<>();
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
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
        return subjects;
    }

    public static void main(String[] args) {
        DataServlet dataServlet = new DataServlet();
        try {
            List<Subject> subjects = dataServlet.fetchSubjects();
            for (Subject subject : subjects) {
                System.out.println("ID: " + subject.getId());
                System.out.println("Title: " + subject.getTitle());
                System.out.println("Description: " + subject.getDescription());
                System.out.println("Category: " + subject.getCategory());
                System.out.println("Thumbnail URL: " + subject.getThumbnailUrl());
                System.out.println("Status: " + subject.getStatus());
                System.out.println("Created By: " + subject.getCreatedBy());
                System.out.println("Created At: " + subject.getCreatedAt());
                System.out.println("Updated At: " + subject.getUpdatedAt());
                //System.out.println("Avatar: " + new String(subject.getAvatar()));
                System.out.println("-----");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}