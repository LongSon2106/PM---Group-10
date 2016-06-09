package Account.com;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class AccountDao {

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver could not be loaded: " + e);
        }
    }

    public AccountDao() {
    }

    public static boolean isLogin(String username, String password) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("SELECT * FROM account WHERE Username = _utf8mb4 ? AND Password = _utf8mb4 ? COLLATE utf8mb4_bin");
            pstmt.setString((Integer) 1, username);
            pstmt.setString((Integer) 2, password);

            ResultSet rs = pstmt.executeQuery();


            while (rs.next()) {
                pstmt2 = conn.prepareStatement("UPDATE account SET LastAcc = ? WHERE Username = ?");
                pstmt2.setString(1, dateFormat.format(date));
                pstmt2.setString(2, username);
                pstmt2.executeUpdate();
                return true;
            }

            rs.close();
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static Account getName(String Username) {
        Account account = new Account();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("SELECT * FROM account WHERE Username = ?");
            pstmt.setString(1, Username);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                String repassword = rs.getString("Repassword");
                String email = rs.getString("Email");
                String cmt = rs.getString("Comment");
                Integer stt = rs.getInt("Status");
                String name = rs.getString("Nameuser");
                String add = rs.getString("Address");
                String tel = rs.getString("Phone");
                String dateRes = rs.getString("Date");
                String dateLast = rs.getString("LastAcc");

                account.setUsername(username);
                account.setPassword(password);
                account.setRepassword(repassword);
                account.setEmail(email);
                account.setComment(cmt);
                account.setStatus(stt);
                account.setNameuser(name);
                account.setAddress(add);
                account.setPhone(tel);
                account.setDateRes(dateRes);
                account.setDateLast(dateLast);
            }

            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return account;
    }

    public static int Active(String username) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("UPDATE account SET Status = 1 WHERE Username = ?");
            pstmt.setString(1, username);
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

    public static int Inactive(String username) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("UPDATE account SET Status = 0 WHERE Username = ?");
            pstmt.setString(1, username);
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

    public static int Delete(String username) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("DELETE FROM account WHERE Username = ?");
            pstmt.setString(1, username);
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

    public static int Update(String oldpassword, String username, String address, String phone) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database + "?characterEncoding=utf8";
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("SELECT * FROM account WHERE Username = ?");
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                if (oldpassword.equals(rs.getString("Password"))) {
                    pstmt2 = conn.prepareStatement("UPDATE account SET Address = ?, Phone = ? WHERE Username = ?");
                    pstmt2.setString(1, address);
                    pstmt2.setString(2, phone);
                    pstmt2.setString(3, username);
                    pstmt2.executeUpdate();
                } else {
                    return -1;
                }
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return 1;
    }

    public static int UpdateNewPass(String oldpassword, String password, String username, String address, String phone) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("SELECT * FROM account WHERE Username = ?");
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                if (oldpassword.equals(rs.getString("Password"))) {
                    pstmt2 = conn.prepareStatement("UPDATE account SET Password = ?, Repassword = ?, Address = ?, Phone = ? WHERE Username = ?");
                    pstmt2.setString(1, password);
                    pstmt2.setString(2, password);
                    pstmt2.setString(3, address);
                    pstmt2.setString(4, phone);
                    pstmt2.setString(5, username);
                    pstmt2.executeUpdate();
                } else {
                    return -1;
                }
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return 1;
    }

    public boolean setRegister(Account account) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database + "?characterEncoding=utf8";
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;
        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            if (!account.getPassword().equals(account.getRepassword())) {
                return false;
            }

            pstmt = conn.prepareStatement("INSERT INTO account(Username, Password, Repassword, Email, Address, Nameuser, Phone) VALUE (?,?,?,?,?,?,?)");
            pstmt.setString((Integer) 1, account.getUsername());
            pstmt.setString((Integer) 2, account.getPassword());
            pstmt.setString((Integer) 3, account.getRepassword());
            pstmt.setString((Integer) 4, account.getEmail());
            pstmt.setString((Integer) 5, account.getAddress());
            pstmt.setString((Integer) 6, account.getNameuser());
            pstmt.setString((Integer) 7, account.getPhone());

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

    public List<Account> getAll() throws SQLException {
        List<Account> list = new ArrayList<Account>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM account");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                String repassword = rs.getString("Repassword");
                String email = rs.getString("Email");
                String cmt = rs.getString("Comment");
                Integer stt = rs.getInt("Status");
                String name = rs.getString("Nameuser");
                String add = rs.getString("Address");
                String tel = rs.getString("Phone");
                String dateRes = rs.getString("Date");
                String dateLast = rs.getString("LastAcc");

                Account account = new Account(username, email, repassword, password, cmt, stt, name, add, tel, dateRes, dateLast);
                list.add(account);
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
}
