package Product.com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ProductDao {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver could not be loaded: " + e);
        }

    }

    public ProductDao() {
    }

    public static boolean isView(int Stt) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product WHERE STT = ?");
            pstmt.setInt(1, Stt);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int view = rs.getInt("View");
                view++;

                pstmt2 = conn.prepareStatement("UPDATE product SET VIEW = ? WHERE STT = ?");
                pstmt2.setInt((Integer) 1, view);
                pstmt2.setInt((Integer) 2, Stt);
                pstmt2.executeUpdate();

            }


            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return true;
    }

    public static boolean isOrder(int Stt, int Quantity) throws SQLException {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product WHERE STT = ?");
            pstmt.setInt(1, Stt);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int quantity = rs.getInt("Quantity");
                if (quantity < Quantity) {
                    return false;
                }
                quantity -= Quantity;

                pstmt2 = conn.prepareStatement("UPDATE product SET Quantity = ? WHERE STT = ?");
                pstmt2.setInt((Integer) 1, quantity);
                pstmt2.setInt((Integer) 2, Stt);
                pstmt2.executeUpdate();

            }


            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return true;
    }

    public List<Product> getAllPagingCate(int page, int rowPerPage, String namepage) throws SQLException {
        List<Product> list = new ArrayList<Product>();

        int curpage = (page - 1) * rowPerPage;
        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product p, category c WHERE p.SKU = c.CatID AND c.CatName = ? LIMIT ? OFFSET ?");
            pstmt.setString(1, namepage);
            pstmt.setInt((Integer) 2, rowPerPage);
            pstmt.setInt((Integer) 3, curpage);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");


                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public Product getByID(int Stt) {
        Product product = new Product();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product WHERE STT = ?");
            pstmt.setInt(1, Stt);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                product.setStt(stt);
                product.setID(id);
                product.setName(name);
                product.setPrice(price);
                product.setQuantity(quantity);
                product.setDate(date);
                product.setView(view);
                product.set_url(url);
                product.set_comment(comment);
                product.set_comment2(comment2);
                product.set_comment3(comment3);
                product.set_comment4(comment4);
                product.set_comment5(comment5);
                product.set_comment6(comment6);
                product.set_comment7(comment7);
                product.set_status(status);

            }

            if (conn != null) {
                conn.close();
                conn = null;
            }

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }

        return product;
    }

    public List<Product> getAllPaging(int page, int rowPerPage) throws SQLException {
        List<Product> list = new ArrayList<Product>();

        int curpage = (page - 1) * rowPerPage;
        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product LIMIT ? OFFSET ?");
            pstmt.setInt((Integer) 1, rowPerPage);
            pstmt.setInt((Integer) 2, curpage);


            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public List<Product> getNewestPaging() throws SQLException {
        List<Product> list = new ArrayList<Product>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY Date DESC LIMIT 3 OFFSET 0");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public List<Product> getMostView() throws SQLException {
        List<Product> list = new ArrayList<Product>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY View DESC LIMIT 3 OFFSET 0");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public List<Product> getMostBuy() throws SQLException {
        List<Product> list = new ArrayList<Product>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY Quantity DESC LIMIT 3 OFFSET 0");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public List<Product> getNewestPagingAll(int page, int rowPerPage) throws SQLException {
        List<Product> list = new ArrayList<Product>();

        int curpage = (page - 1) * rowPerPage;
        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY Date DESC LIMIT ? OFFSET ?");
            pstmt.setInt((Integer) 1, rowPerPage);
            pstmt.setInt((Integer) 2, curpage);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public List<Product> getMostViewAll(int page, int rowPerPage) throws SQLException {
        List<Product> list = new ArrayList<Product>();

        int curpage = (page - 1) * rowPerPage;
        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY View DESC LIMIT ? OFFSET ?");
            pstmt.setInt((Integer) 1, rowPerPage);
            pstmt.setInt((Integer) 2, curpage);


            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public List<Product> getMostBuyAll(int page, int rowPerPage) throws SQLException {
        List<Product> list = new ArrayList<Product>();

        int curpage = (page - 1) * rowPerPage;
        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY Quantity DESC LIMIT ? OFFSET ?");
            pstmt.setInt((Integer) 1, rowPerPage);
            pstmt.setInt((Integer) 2, curpage);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public List<Product> getProduct(String keyword) {
        List<Product> list = new ArrayList<Product>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product WHERE Name like ?");
            pstmt.setString((Integer) 1, keyword);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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

    public int getMaxPage() {

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
            pstmt = conn.prepareStatement("SELECT COUNT(*)M  FROM product");
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

    public boolean Delete(String stt) {

        boolean rs = true;
        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("DELETE FROM product WHERE STT = ?");
            pstmt.setString(1, stt);
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

    public boolean setProduct(Product product) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;
        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("INSERT INTO product(SKU, Name, Price, Quantity, URL, Comment, Comment2, Comment3, Comment4, Comment5, Comment6, Comment7) VALUE (?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString((Integer) 1, product.getID());
            pstmt.setString((Integer) 2, product.getName());
            pstmt.setDouble((Integer) 3, product.getPrice());
            pstmt.setInt((Integer) 4, product.getQuantity());
            pstmt.setString((Integer) 5, product.get_url());
            pstmt.setString((Integer) 6, product.get_comment());
            pstmt.setString((Integer) 7, product.get_comment2());
            pstmt.setString((Integer) 8, product.get_comment3());
            pstmt.setString((Integer) 9, product.get_comment4());
            pstmt.setString((Integer) 10, product.get_comment5());
            pstmt.setString((Integer) 11, product.get_comment6());
            pstmt.setString((Integer) 12, product.get_comment7());

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

    public List<Product> getAll() {
        List<Product> list = new ArrayList<Product>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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


    public List<Product> getAllA01() {
        List<Product> list = new ArrayList<Product>();

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY RAND() DESC LIMIT 3 OFFSET 0");

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("STT");
                String id = rs.getString("SKU");
                String name = rs.getString("Name");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                Date date = rs.getDate("Date");
                int view = rs.getInt("View");
                String url = rs.getString("URL");
                String comment = rs.getString("Comment");
                String comment2 = rs.getString("Comment2");
                String comment3 = rs.getString("Comment3");
                String comment4 = rs.getString("Comment4");
                String comment5 = rs.getString("Comment5");
                String comment6 = rs.getString("Comment6");
                String comment7 = rs.getString("Comment7");
                int status = rs.getInt("Status");

                Product product = new Product(stt, id, name, price, quantity, date, view, url, comment, comment2, comment3, comment4, comment5, comment6, comment7, status);
                list.add(product);
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





    public static int Active(String stt) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("UPDATE product SET Status = 1 WHERE STT = ?");
            pstmt.setString(1, stt);
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

    public static int Inactive(String stt) {

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            pstmt = conn.prepareStatement("UPDATE product SET Status = 0 WHERE STT = ?");
            pstmt.setString(1, stt);
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
    public static int Update(String _stt, String _sku, String _name, String _price, String _quantity, String _date, String _view, String _url){
        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database + "?characterEncoding=utf8";
        String dbUser = "root";
        String dbPassword = "";
        PreparedStatement pstmt = null;

        Connection conn;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            pstmt = conn.prepareStatement("UPDATE product SET SKU = ?, Price = ?, Quantity = ?, Date = ?, View = ?, URL = ? WHERE STT = ?");
                pstmt.setString(1, _sku);
                pstmt.setString(2, _price);
                pstmt.setString(3, _quantity);
                pstmt.setString(4, _date);
                pstmt.setString(5, _view);
                pstmt.setString(6, _url);
                pstmt.setString(7, _stt);
                pstmt.executeUpdate();


            pstmt.close();
            conn.close();

        } catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
        return -1;
    }

}
