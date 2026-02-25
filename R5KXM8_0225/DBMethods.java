package R5KXM8;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Statement;
import java.sql.PreparedStatement;

import java.sql.ResultSet;

public class DBMethods {
	final static String url = "jdbc:sqlite:C:/sqlite3/autodb";
	
	public static void Register() {
		try {
			Class.forName("org.sqlite.JDBC");
		}
		catch (ClassNotFoundException e) {
			System.out.println("Class not found exception" + e.getMessage());
		}
	}
	
	public static Connection Connect() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url);
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public static void DisConnect(Connection conn) {
		if(conn!= null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public static void CommandExec(String command) {
		Connection conn = Connect();
		try {
			Statement s = conn.createStatement();
			s.execute(command);
		}
		catch (SQLException e) {
			System.out.println("Command: " + command);
			System.out.println(e.getMessage());
		}
		DisConnect(conn);
	}
	
	public static void ReadAllData() {
		String rendszam = "";
		String tipus = "";
		String szin = "";
		String tulaj = "";
		int kor = 0;
		int ar = 0;
		String sqlp = "SELECT Rendszam, Tipus, Szin, Kor, Ar, Tulaj FROM Auto";
		Connection conn = Connect();
		
		System.out.println("Autó tábla\n");
		
		try {
			Statement statement = conn.createStatement();
			ResultSet result_set.getString("Rendszam");
			while (result_set.next()) {
				rendszam = result_set.getString("Rendszam");
				tipus = result_set.getString("Tipus");
				szin = result_set.getString("Szin");
				kor = result_set.getString("Kor");
				ar = result_set.getString("Ar");
				tulaj = result_set.getString("Tulaj");
				System.out.println(
				rendszam + "\t" +
				tipus + "\t" +
				szin + "\t" +
				kor + "\t" +
				ar + "\t" +
				tulaj
				);
			}
			result.set.Close();
			catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			DisConnect(conn);
		}
	}
	
}
