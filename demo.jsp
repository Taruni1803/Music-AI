<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // JDBC database URL, username, and password
    String url = "jdbc:mysql://localhost:3306/music_acad";
    String user = "root";
    String password = "tiger";

    // Database connection and query
    Connection conn = null;
    Statement stmt = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        conn = DriverManager.getConnection(url, user, password);

        // Create a statement
        stmt = conn.createStatement();

        // SQL query to update progress_level for a specific email
        String sql = "UPDATE reg_details SET progress_level = 'new_value' WHERE email = 'anshupriya1023@gmail.com'";

        // Execute the query
        int rowsAffected = stmt.executeUpdate(sql);

        // Check if the update was successful
        if (rowsAffected > 0) {
            out.println("Progress level updated successfully!");
        } else {
            out.println("Failed to update progress level. Email not found.");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace(); // Handle exceptions appropriately in a production environment
    } finally {
        // Close the database resources
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
