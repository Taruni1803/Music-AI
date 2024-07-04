<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // JDBC database URL, username, and password
    String url = "jdbc:mysql://localhost:3306/music_acad";
    String user = "root";
    String password = "tiger";

    // User input from the login form
    String emailAddress = request.getParameter("emailAddress");
    String userPassword = request.getParameter("password");

    // Database connection and query
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        conn = DriverManager.getConnection(url, user, password);

        // Prepare the SQL query
        String sql = "SELECT * FROM reg_details WHERE email = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, emailAddress);
        pstmt.setString(2, userPassword);

        // Execute the query
        rs = pstmt.executeQuery();

        // Check if the user exists in the database
        if (rs.next()) {
            // User authenticated, retrieve the user's progress level from the database
            
            int userProgressLevel = rs.getInt("progress_level"); // Replace "progress_level" with the actual column name

            // Set the progress level in the session (optional)
            session.setAttribute("userProgressLevel", userProgressLevel);

            // Redirect to the appropriate page (e.g., index.jsp) with progress level as a parameter
            response.sendRedirect("index.jsp?progressLevel=" + userProgressLevel);
        } else {
            // Invalid credentials, you can redirect or display an error message
            response.sendRedirect("login_mcad.html?error=1");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace(); // Handle exceptions appropriately in a production environment
    } finally {
        // Close the database resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
