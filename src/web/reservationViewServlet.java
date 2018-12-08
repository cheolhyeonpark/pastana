package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Reservation;
import repository.ReservationDAO;

@WebServlet("/view")
public class reservationViewServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getParameter("reNo") == null) {
			resp.sendRedirect(req.getContextPath() + "/list");
		} else {
			int reNo = Integer.parseInt(req.getParameter("reNo"));
			Reservation reservation = new Reservation();
			ReservationDAO reservationDAO = new ReservationDAO();
			reservation = reservationDAO.selectOne(reNo);
			if (reservation == null) {
				resp.sendRedirect(req.getContextPath() + "/error.html");
			} else {
				req.setAttribute("reservation", reservation);
				req.getRequestDispatcher("/view.jsp").forward(req, resp);
			}
		}
	}
}
