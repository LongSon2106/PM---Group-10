package Bill.com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDao {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver could not be loaded: " + e);
        }

    }

    public BillDao() {
    }

    public static int Active(Integer stt) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("UPDATE bill SET Status = 1 WHERE STT = ?");
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

    public static int Inactive(Integer stt) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("UPDATE bill SET Status = 0 WHERE STT = ?");
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

    public static int Delete(Integer stt) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("DELETE FROM bill WHERE STT = ?");
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

    public boolean setBill(Bill bill) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database + "?characterEncoding=utf8";
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("INSERT INTO bill(Name, Address, Product, Phone) VALUE (?,?,?,?)");
            pstmt.setString((Integer) 1, bill.getName());
            pstmt.setString((Integer) 2, bill.getAddress());
            pstmt.setInt((Integer) 3, bill.getProduct());
            pstmt.setString((Integer) 4, bill.getPhone());

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

    public List<Bill> getAll() throws SQLException {
        List<Bill> list = new ArrayList<Bill>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM bill");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Integer stt = rs.getInt("STT");
                String nameuser = rs.getString("Name");
                String address = rs.getString("Address");
                Integer product = rs.getInt("Product");
                Integer status = rs.getInt("Status");
                Date date = rs.getDate("Date");
                String phone = rs.getString("Phone");


                Bill bill = new Bill(stt, date, nameuser, address, product, status, phone);
                list.add(bill);
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

    public static Bill getStt(String STT) {
        Bill bill = new Bill();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("SELECT * FROM bill WHERE STT = ?");
            pstmt.setString(1, STT);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Integer stt = rs.getInt("STT");
                String nameuser = rs.getString("Name");
                String address = rs.getString("Address");
                Integer product = rs.getInt("Product");
                Integer status = rs.getInt("Status");
                Date date = rs.getDate("Date");
                String phone = rs.getString("Phone");

                bill.setStt(stt);
                bill.setName(nameuser);
                bill.setAddress(address);
                bill.setProduct(product);
                bill.setStatus(status);
                bill.setDate(date);
                bill.setPhone(phone);
            }

            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return bill;
    }

    public Bill getByID(String Stt) {
        Bill bill = new Bill();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM bill WHERE STT = ?");
            pstmt.setString(1, Stt);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Integer stt = rs.getInt("STT");
                String nameuser = rs.getString("Name");
                String address = rs.getString("Address");
                Integer product = rs.getInt("Product");
                Integer status = rs.getInt("Status");
                Date date = rs.getDate("Date");
                String phone = rs.getString("Phone");

                bill.setStt(stt);
                bill.setName(nameuser);
                bill.setAddress(address);
                bill.setProduct(product);
                bill.setStatus(status);
                bill.setDate(date);
                bill.setPhone(phone);
            }

            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return bill;
    }
}
