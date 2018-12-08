package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import domain.Reservation;

public class ReservationDAO {

	private final String driverClassName = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://54.180.91.49:3306/studydb";
	private final String username = "study";
	private final String password = "1111";

	private Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(this.driverClassName);
			connection = DriverManager.getConnection(this.url, this.username, this.password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	public int insert(Reservation reservation) {
		int rowCount = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql = "INSERT INTO reserve(name, password, title, date, time, guest, phone, message) values(?, password(?), ?, STR_TO_DATE(?,'%Y-%m-%d'), ?, ?, ?, ?)";
		try {
			connection = this.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, reservation.getName());
			preparedStatement.setString(2, reservation.getPassword());
			preparedStatement.setString(3, reservation.getTitle());
			preparedStatement.setString(4, reservation.getDate());
			preparedStatement.setInt(5, reservation.getTime());
			preparedStatement.setInt(6, reservation.getGuest());
			preparedStatement.setString(7, reservation.getPhone());
			preparedStatement.setString(8, reservation.getMessage());
			rowCount = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, preparedStatement, null);
		}
		return rowCount;
	}

	public int selectCount() {
		int rowCount = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM reserve";
		try {
			connection = this.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				rowCount = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, preparedStatement, resultSet);
		}
		return rowCount;
	}

	public List<Reservation> selectList(int begin, int page) {
		List<Reservation> list = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String sql = "SELECT reNo, name, title, date FROM reserve ORDER BY reNo DESC LIMIT ?, ?";
		try {
			connection = this.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, begin);
			preparedStatement.setInt(2, page);
			resultSet = preparedStatement.executeQuery();
			list = new ArrayList<>();
			while (resultSet.next()) {
				Reservation reservation = new Reservation();
				reservation.setReNo(resultSet.getInt("reNo"));
				reservation.setName(resultSet.getString("name"));
				reservation.setTitle(resultSet.getString("title"));
				reservation.setDate(resultSet.getString("date"));
				list.add(reservation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, preparedStatement, resultSet);
		}
		return list;
	}

	public Reservation selectOne(int reNo) {
		Reservation reservation = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String sql = "SELECT reNo, name, title, date, time, guest, phone, message FROM reserve WHERE reNo = ?";
		try {
			connection = this.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, reNo);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				reservation = new Reservation();
				reservation.setReNo(resultSet.getInt("reNo"));
				reservation.setName(resultSet.getString("name"));
				reservation.setTitle(resultSet.getString("title"));
				reservation.setDate(resultSet.getString("date"));
				reservation.setTime(resultSet.getInt("time"));
				reservation.setGuest(resultSet.getInt("guest"));
				reservation.setPhone(resultSet.getString("phone"));
				reservation.setMessage(resultSet.getString("message"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, preparedStatement, resultSet);
		}
		return reservation;
	}

	private void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
