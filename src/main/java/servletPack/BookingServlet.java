package servletPack;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 1. Fetch DB details from the ServletContext
        String dbUrl = getServletContext().getInitParameter("dbUrl");
        String dbUser = getServletContext().getInitParameter("dbUser");
        String dbPass = getServletContext().getInitParameter("dbPassword");

        // GET LOGGED USER
        HttpSession session = request.getSession(false); // false means don't create a new session if one doesn't exist
        String user = (session != null) ? (String) session.getAttribute("user") : null;

        if (user == null) {
            out.println("<h3>Please login first to see your bookings.</h3>");
            return;
        }

        try {
            Class.forName("oracle.jdbc.OracleDriver");

            try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
                
                String query = "SELECT * FROM BOOKINGS WHERE USERNAME=?";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setString(1, user);

                    try (ResultSet rs = ps.executeQuery()) {
                        
                        boolean found = false;
                        while (rs.next()) {
                            found = true;
                            out.println("<div class='booking-item'>");
                            out.println("<b>" + rs.getString("MOVIE") + "</b><br>");
                            out.println("Theater: " + rs.getString("THEATER") + "<br>");
                            out.println("Time: " + rs.getString("SHOWTIME") + "<br>");
                            out.println("Seats: " + rs.getString("SEATS"));
                            out.println("</div><hr>");
                        }
                        
                        if (!found) {
                            out.println("<p>No bookings found for user: " + user + "</p>");
                        }
                    }
                }
            } 
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error fetching bookings: " + e.getMessage() + "</p>");
        }
    }
}