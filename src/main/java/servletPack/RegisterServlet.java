package servletPack;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Declare variables at the class level
    private String dbUrl;
    private String dbUser;
    private String dbPass;

    @Override
    public void init() throws ServletException {
        this.dbUrl = getServletContext().getInitParameter("dbUrl");
        this.dbUser = getServletContext().getInitParameter("dbUser");
        this.dbPass = getServletContext().getInitParameter("dbPassword");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Use try-with-resources for the Connection to ensure it closes automatically
        try {
            Class.forName("oracle.jdbc.OracleDriver");

            try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
                
                // 1. Check existing user
                String checkSql = "SELECT * FROM REGISTER WHERE email = ? OR phone = ?";
                try (PreparedStatement checkStmt = con.prepareStatement(checkSql)) {
                    checkStmt.setString(1, email);
                    checkStmt.setString(2, phone);
                    ResultSet rs = checkStmt.executeQuery();

                    if (rs.next()) {
                        request.setAttribute("errorMessage", "User already exists!");
                        request.getRequestDispatcher("Register.jsp").forward(request, response);
                        return; // Stop execution here
                    }
                }

                // 2. Insert new user
                String insertSql = "INSERT INTO REGISTER (name, email, phone, password) VALUES (?, ?, ?, ?)";
                try (PreparedStatement insertStmt = con.prepareStatement(insertSql)) {
                    insertStmt.setString(1, name);
                    insertStmt.setString(2, email);
                    insertStmt.setString(3, phone);
                    insertStmt.setString(4, password);

                    int rows = insertStmt.executeUpdate();
                    if (rows > 0) {
                        response.sendRedirect("Login.html");
                    } else {
                        out.println("<h2 style='color:red;'>Registration failed.</h2>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace(out); // Print full stack trace to browser for debugging
        }
    }
}