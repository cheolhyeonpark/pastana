package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.ReservationDAO;

@WebServlet("/delete")
public class reservationDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getParameter("reNo") == null) {
			resp.sendRedirect(req.getContextPath() + "/list");
		} else { 
			int reNo = Integer.parseInt(req.getParameter("reNo"));
			req.setAttribute("reNo", reNo);
			req.getRequestDispatcher("/delete.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int reNo = Integer.parseInt(req.getParameter("reNo"));
		String password = req.getParameter("password");
		ReservationDAO reservationDAO = new ReservationDAO();
		int rowCount = reservationDAO.deleteReservation(reNo, password);
		if (rowCount == 1) {
			resp.sendRedirect(req.getContextPath() + "/list");
		} else {
			resp.sendRedirect(req.getContextPath() + "/error.html");
		}
	}
}
