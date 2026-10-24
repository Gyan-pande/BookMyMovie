package servletPack;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. Fetch connection details from ServletContext
		// This is the "Context" part you wanted!
		String dbUrl = getServletContext().getInitParameter("dbUrl");
		String dbUser = getServletContext().getInitParameter("dbUser");
		String dbPass = getServletContext().getInitParameter("dbPassword");

		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String newPassword = request.getParameter("newPassword");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. Use the variables fetched from the context
			try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {

				// Check user exists
				String checkQuery = "SELECT * FROM REGISTER WHERE email=? AND phone=?";
				try (PreparedStatement check = con.prepareStatement(checkQuery)) {
					check.setString(1, email);
					check.setString(2, phone);

					try (ResultSet rs = check.executeQuery()) {
						if (rs.next()) {
							// Update password
							String updateQuery = "UPDATE REGISTER SET password=? WHERE email=? AND phone=?";
							try (PreparedStatement ps = con.prepareStatement(updateQuery)) {
								ps.setString(1, newPassword);
								ps.setString(2, email);
								ps.setString(3, phone);

								int i = ps.executeUpdate();

								if (i > 0) {
									request.setAttribute("successMsg", "✅ Password updated successfully!");
									request.getRequestDispatcher("Login.html").forward(request, response);
								}
							}
						} else {
							request.setAttribute("errorMsg", "❌ User not found!");
							request.getRequestDispatcher("Forgot.jsp").forward(request, response);
						}
					}
				}
			} // Connection closes automatically here due to try-with-resources

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
}