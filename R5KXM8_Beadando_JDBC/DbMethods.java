import java.sql.*;

public class DbMethods {

    public Connection Connect() {

        Connection conn = null;

        try {

            String url = "jdbc:sqlite:Forma1.db";
            conn = DriverManager.getConnection(url);

            Statement s = conn.createStatement();
            s.execute("PRAGMA foreign_keys = ON");

        } catch (SQLException e) {
            SM(e.getMessage());
        }

        return conn;
    }

    public void DisConnect(Connection conn) {

        try {
            conn.close();
        } catch (SQLException e) {
            SM(e.getMessage());
        }
    }

    public void Reg() {

        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            SM("Driver hiba");
        }
    }

    public void SM(String msg) {
        System.out.println(msg);
    }

    // =================
    // VERSENYZŐ LISTA
    // =================

    public void VersenyzoLista() {

        String sql = "SELECT * FROM Versenyzo";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                System.out.println(
                        rs.getInt("versenyzo_id") + " "
                                + rs.getString("nev") + " "
                                + rs.getInt("pont"));
            }

            rs.close();

        } catch (SQLException e) {
            SM(e.getMessage());
        }

        DisConnect(conn);
    }

    // =================
    // CSAPAT LISTA
    // =================

    public void CsapatLista() {

        String sql = "SELECT * FROM Csapat";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                System.out.println(
                        rs.getInt("csapat_id") + " "
                                + rs.getString("nev") + " "
                                + rs.getString("motor") + " "
                                + rs.getInt("koltseg"));
            }

            rs.close();

        } catch (SQLException e) {
            SM(e.getMessage());
        }

        DisConnect(conn);
    }

    // =================
    // KAPCSOLAT LISTA
    // =================

    public void VersenyzoCsapatLista() {

        String sql = "SELECT * FROM VersenyzoCsapat";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                System.out.println(
                        rs.getInt("versenyzo_id") + " - "
                                + rs.getInt("csapat_id"));
            }

            rs.close();

        } catch (SQLException e) {
            SM(e.getMessage());
        }

        DisConnect(conn);
    }

    // =================
    // SELECT COUNT
    // =================

    public int SelectCount(String table, String column, String value) {

        int pc = 0;

        String sql = "SELECT count(*) FROM " + table + " WHERE " + column + " = ?";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, value);

            ResultSet rs = ps.executeQuery();

            if (rs.next())
                pc = rs.getInt(1);

            rs.close();

        } catch (SQLException e) {
            SM(e.getMessage());
        }

        DisConnect(conn);

        return pc;
    }

    // =================
    // INSERT VERSENYZŐ
    // =================

    public void InsertVersenyzo(String id, String nev, String nemzet, String datum, String pont) {

        String sql = "INSERT INTO Versenyzo VALUES (?, ?, ?, ?, ?)";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(id));
            ps.setString(2, nev);
            ps.setString(3, nemzet);
            ps.setString(4, datum);
            ps.setInt(5, Integer.parseInt(pont));

            ps.executeUpdate();

            SM("Versenyző beszúrva");

        } catch (Exception e) {
            SM(e.getMessage());
        }

        DisConnect(conn);
    }

    // =================
    // INSERT CSAPAT
    // =================

    public void InsertCsapat(String id, String nev, String motor, String alapitas, String koltseg) {

        String sql = "INSERT INTO Csapat VALUES (?, ?, ?, ?, ?)";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(id));
            ps.setString(2, nev);
            ps.setString(3, motor);
            ps.setString(4, alapitas);
            ps.setInt(5, Integer.parseInt(koltseg));

            ps.executeUpdate();

            SM("Csapat beszúrva");

        } catch (Exception e) {
            SM(e.getMessage());
        }

        DisConnect(conn);
    }

    // =================
    // KAPCSOLAT INSERT
    // =================

    public void InsertKapcsolat(String versenyzo, String csapat) {

        if (SelectCount("Versenyzo", "versenyzo_id", versenyzo) == 0) {
            SM("Nincs ilyen versenyző!");
            return;
        }

        if (SelectCount("Csapat", "csapat_id", csapat) == 0) {
            SM("Nincs ilyen csapat!");
            return;
        }

        String sql = "INSERT INTO VersenyzoCsapat VALUES (?, ?)";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(versenyzo));
            ps.setInt(2, Integer.parseInt(csapat));

            ps.executeUpdate();

            SM("Kapcsolat beszúrva");

        } catch (Exception e) {
            SM(e.getMessage());
        }

        DisConnect(conn);
    }

    // =================
    // UPDATE
    // =================

    public void UpdateKoltseg(String id, String koltseg) {

        String sql = "UPDATE Csapat SET koltseg = ? WHERE csapat_id = ?";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(koltseg));
            ps.setInt(2, Integer.parseInt(id));

            int db = ps.executeUpdate();

            if (db == 1)
                SM("Költség módosítva");
            else
                SM("Nincs ilyen csapat");

        } catch (Exception e) {
            SM(e.getMessage());
        }

        DisConnect(conn);
    }

    // =================
    // PARAM LISTA
    // =================

    public void CsapatMotorLista(String motor) {

        String sql = "SELECT * FROM Csapat WHERE motor = ? ORDER BY nev";

        Connection conn = Connect();

        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, motor);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                System.out.println(
                    "Csapat: " + rs.getString("nev")
                    + " | Motor: " + rs.getString("motor")
                    + " | Költség: " + rs.getInt("koltseg")
                );
}

            rs.close();

        } catch (SQLException e) {
            SM(e.getMessage());
        }

        DisConnect(conn);
    }
}