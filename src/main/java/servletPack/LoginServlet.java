package servletPack;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

  
	private static final long serialVersionUID = 1L;
	
	private String dbUrl;
    private String dbUser;
    private String dbPass;
    
    @Override
    public void init() throws ServletException {
        // Now it's safe to call getServletContext()
        this.dbUrl = getServletContext().getInitParameter("dbUrl");
        this.dbUser = getServletContext().getInitParameter("dbUser");
        this.dbPass = getServletContext().getInitParameter("dbPassword");
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM REGISTER WHERE name=? AND password=?"
            );

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

         // AFTER successful login
            if (rs.next()) {

                // CREATE SESSION
                HttpSession session = request.getSession();

                // STORE USER DATA FROM DATABASE
                session.setAttribute("user", rs.getString("NAME"));
                session.setAttribute("email", rs.getString("EMAIL"));
                session.setAttribute("phone", rs.getString("PHONE"));

                // REDIRECT TO HOMEPAGE
                response.sendRedirect("HomePage.jsp");
            }
            else {

                response.sendRedirect("Login.html?error=invalid");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
