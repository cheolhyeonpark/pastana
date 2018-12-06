package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Reservation;
import repository.ReservationDAO;

@WebServlet("/list")
public class reservationListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int current = 1;
		if (req.getParameter("current") != null) {
			current = Integer.parseInt(req.getParameter("current"));
		}
		
		ReservationDAO reservationDAO = new ReservationDAO();
		int total = reservationDAO.selectCount();
		int page = 10;
		int begin = (current-1)*page;
		int last = total % page == 0 ? total/page : total/page + 1;
		
		List<Reservation> list = reservationDAO.selectList(begin, page);
		req.setAttribute("current", current);
		req.setAttribute("last", last);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/reservation.jsp").forward(req, resp);
	}
}
