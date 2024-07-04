<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>

<%
    // Retrieve form data
    String senderName = request.getParameter("name");
    String senderEmail = request.getParameter("email");
    String subject = request.getParameter("subject");
    String messageText = request.getParameter("message");

    // Receiver's email address
    String receiverEmail = "tarunipriya1803@gmail.com";  // Update with recipient's email

    // Setup mail server properties
    Properties properties = new Properties();
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.host", "smtp.gmail.com");  // Update with your SMTP server
    properties.put("mail.smtp.port", "587");  // Update with your SMTP server port

    // Create session with authentication
    Session session = Session.getInstance(properties, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, "taruni1803");  // Update with your email password
        }
    });

    try {
        // Create a default MimeMessage object
        Message message = new MimeMessage(session);

        // Set From: header field
        message.setFrom(new InternetAddress(senderEmail, senderName));

        // Set To: header field
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));

        // Set Subject: header field
        message.setSubject(subject);

        // Set actual message
        message.setText("Name: " + senderName + "\nEmail: " + senderEmail + "\n\n" + messageText);

        // Send message
        Transport.send(message);

        // Display success message
        out.println("<div>Email sent successfully!</div>");
    } catch (MessagingException e) {
        // Display error message
        out.println("<div>Error sending email. Please try again later.</div>");
        e.printStackTrace();
    }
%>
