
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*,java.io.PrintWriter" %>

<%
    Connection conn = null;
    PreparedStatement preparedStatement = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        String jdbcUrl = "jdbc:mysql://localhost:3306/music_acad";
        String username = "root";
        String password = "tiger";
        conn = DriverManager.getConnection(jdbcUrl, username, password);

        // Prepare the SQL statement
        String sql = "INSERT INTO reg_details (full_name, email, phone_number, birth_date, gender, street_address1, street_address2, country, city, region, postal_code,password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, request.getParameter("fullName"));
        preparedStatement.setString(2, request.getParameter("emailAddress"));
        preparedStatement.setString(3, request.getParameter("phoneNumber"));
        preparedStatement.setString(4, request.getParameter("birthDate"));
        String gender = request.getParameter("gender");
        preparedStatement.setString(5, gender);
        preparedStatement.setString(6, request.getParameter("streetAddress1"));
        preparedStatement.setString(7, request.getParameter("streetAddress2"));
        preparedStatement.setString(8, request.getParameter("country"));
        preparedStatement.setString(9, request.getParameter("city"));
        preparedStatement.setString(10, request.getParameter("region"));
        preparedStatement.setString(11, request.getParameter("postalCode"));
        preparedStatement.setString(12, request.getParameter("password"));

        // Execute the SQL statement
        preparedStatement.executeUpdate();

        // Output success message
        out.println("Data inserted successfully");
    } catch (Exception e) {
        // Handle exceptions (log or output an error message)
        out.println("Error: " + e.getMessage());
    } finally {
        // Close resources
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
