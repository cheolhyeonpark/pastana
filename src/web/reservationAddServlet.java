package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Reservation;
import repository.ReservationDAO;

@WebServlet("/add")
public class reservationAddServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			Reservation reservation = new Reservation();
			reservation.setName(req.getParameter("name"));
			reservation.setPassword(req.getParameter("password"));
			reservation.setTitle(req.getParameter("title"));
			reservation.setDate(req.getParameter("date"));
			reservation.setTime(Integer.parseInt(req.getParameter("time")));
			reservation.setGuest(Integer.parseInt(req.getParameter("guest")));
			reservation.setPhone(req.getParameter("phone"));
			reservation.setMessage(req.getParameter("message"));

			ReservationDAO reservationDAO = new ReservationDAO();
			int rowCount = reservationDAO.insert(reservation);

			if (rowCount == 1)
				resp.sendRedirect(req.getContextPath() + "/list");
			else
				resp.sendRedirect(req.getContextPath() + "/error.html");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error.html");
		}
	}
}
