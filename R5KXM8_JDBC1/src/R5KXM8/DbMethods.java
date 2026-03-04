package R5KXM8;

import java.sql.Connection;
import java.sql.DriverMenager;
import java.sql.PreparedStatement;
import java.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbMethods {
	private static final String url = "jdbc:sqlite:c:/sqlite3/autodb";
	
	public static void Register() {
		try {
			Class.forName(className: "org.sqlite.JDBC");
		} catch (ClassNotFoundException e) {
			System.out.println("SQLite JDBC driver nem található: " + e.getMessage());
		}
		
		String sql =
				"CREATE TABLE IF NOT EXISTS Auto (" +
				" Rendszam char PRIMARY KEY," +
				" Tipus char NOT NULL," +
				" Szin char NOT NULL," +
				" Kor INTEGER NOT NULL" +
				" Ar INTEGET NOT NULL" +
				"Tulaj char NOT NULL" +
				");";
		
		try(Connection conn = Connect();
				Statement st = conn.createStatement()) {
			
		} catch (SQLException e) {
			System.out.println("Register hiba: " + e.getMessage());
			
		}
		
		public static Connection Connect() throws SQLException {
			return DriverManager.getConnection(url);
		}
		
		public static void ReadAllData() {
			String sql = "SELECT Rendszam, Tipus, Szin, Kor, Ar, Tulaj FROM Auto ORDER BY Rendszam";
			
			try(Connection conn Connect();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql)) {
				
				System.out.println("\nRendszam\tTipus\tSzin\tKor\nAr\tTulaj");
				System.out.println("---------------------------------------------------");
				
				while (rs.next()) {
					System.out.println(
							rs.getString("Rendszam") + "\t" +
							rs.getString("Tipus") + "\t" +
							rs.getString("Szin") + "\t" +
							rs.getInt("Kor") + "\t" +
							rs.getInt("Ar") + "\t" +
							rs.getString("Tulaj")
							);
				}
			} catch (SQLException e) {
				System.outprintln("ReadAll hiba: " + e.getMessage());
			}
			
		}
		
		public static void Insert(String rendszam, String tipus, String szin, int kor, int ar, String tulaj) {
			String sql = "INSERT INTO Auto (Rendszam, Tipus, Szin, Kor, Ar, Tulaj) VALUES (?,?,?,?,?,?)";
		}
		
	}
}
