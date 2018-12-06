package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

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
            if(preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if(connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
    	}
    	return rowCount;
    }
}
