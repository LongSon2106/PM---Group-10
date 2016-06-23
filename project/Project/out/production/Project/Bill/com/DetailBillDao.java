package Bill.com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by KUBO0212 on 12/9/2015.
 */
public class DetailBillDao {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver could not be loaded: " + e);
        }

    }

    public DetailBillDao(){

    }

    public boolean setdetailBill(String product, Integer stt, Integer quantity) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database + "?characterEncoding=utf8";
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;


        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("INSERT INTO detailbill (NameBill, Product, idBill, Quantity) SELECT Name, ?, ?, ? FROM bill WHERE STT = ?");
            pstmt.setString((Integer) 1, product);
            pstmt.setInt((Integer) 2, stt);
            pstmt.setInt((Integer) 3, quantity);
            pstmt.setInt((Integer) 4, stt);

            int count = pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            if (count == 1) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static List<DetailBill> getStt(String STT) {
        List<DetailBill> list = new ArrayList<DetailBill>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("SELECT * FROM detailbill WHERE idBill = ?");
            pstmt.setString(1, STT);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Integer stt = rs.getInt("STT");
                String nameuser = rs.getString("NameBill");
                Integer idbill = rs.getInt("idBill");
                String product = rs.getString("Product");
                Integer quantity = rs.getInt("Quantity");

                DetailBill detailBill = new DetailBill(nameuser, product, quantity, stt, idbill);
                list.add(detailBill);
            }

            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return list;
    }

    public static int Delete(Integer stt) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("DELETE FROM detailbill WHERE idBill = ?");
            pstmt.setInt(1, stt);
            int count = pstmt.executeUpdate();


            pstmt.close();
            conn.close();

            if (count == 1) {
                return 1;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }
}
