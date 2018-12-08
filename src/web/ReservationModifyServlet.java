package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Reservation;
import repository.ReservationDAO;

@WebServlet("/modify")
public class ReservationModifyServlet extends HttpServlet {

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
				req.getRequestDispatcher("/modify.jsp").forward(req, resp);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		Reservation reservation = new Reservation();
		reservation.setReNo(Integer.parseInt(req.getParameter("reNo")));
		reservation.setName(req.getParameter("name"));
		reservation.setPassword(req.getParameter("password"));
		reservation.setTitle(req.getParameter("title"));
		reservation.setDate(req.getParameter("date"));
		reservation.setTime(Integer.parseInt(req.getParameter("time")));
		reservation.setGuest(Integer.parseInt(req.getParameter("guest")));
		reservation.setPhone(req.getParameter("phone"));
		reservation.setMessage(req.getParameter("message"));

		ReservationDAO reservationDAO = new ReservationDAO();
		int rowCount = reservationDAO.updateReservation(reservation);

		if (rowCount == 1)
			resp.sendRedirect(req.getContextPath() + "/list");
		else
			resp.sendRedirect(req.getContextPath() + "/error.html");
	}
}
