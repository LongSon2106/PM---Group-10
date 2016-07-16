package Product.com;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CategoryDao {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver could not be loaded: " + e);
        }

    }

    public CategoryDao() {
    }

    public List<Category> getAll() {
        List<Category> list = new ArrayList<Category>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM category");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String catid = rs.getString("CatID");
                String catname = rs.getString("CatName");
                Integer status = rs.getInt("Status");

                Category category = new Category(catid, catname, status);
                list.add(category);
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

    public boolean Delete(String catid) {

        boolean rs = true;
        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("DELETE FROM category WHERE CatName = ?");
            pstmt.setString(1, catid);
            int count = pstmt.executeUpdate();

            if (count == 1) {
                rs = true;
            } else {
                rs = false;
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return rs;
    }

    public int getMaxPage(String name) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;
        double max = 0;
        double numpage = 0;
        int renumpage = 0;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT COUNT(*)M  FROM product p, category c WHERE p.SKU = c.CatID AND c.CatName = ?");
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                max = rs.getInt("M");
            }

            numpage = max / 9;
            numpage = Math.ceil(numpage);
            renumpage = (int) numpage;

            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return renumpage;
    }

    public boolean setCategory(Category category) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;
        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("INSERT INTO category(CatID, CatName) VALUE (?,?)");
            pstmt.setString((Integer) 1, category.getCatID());
            pstmt.setString((Integer) 2, category.getCatName());

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

    public static int Active(String catname) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("UPDATE category SET Status = 1 WHERE CatName = ?");
            pstmt.setString(1, catname);
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

    public static int Inactive(String catname) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("UPDATE category SET Status = 0 WHERE CatName = ?");
            pstmt.setString(1, catname);
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
