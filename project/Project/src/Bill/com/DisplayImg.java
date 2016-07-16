package Bill.com;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;

public class DisplayImg {
    private static final int BUFFER_SIZE = 4096;

    public static void main(String idBill) {
        String url = "jdbc:mysql://localhost:3306/mobile";
        String user = "root";
        String password = "";
        String filePath = "F:/Homework/Software_Engineering/Partner/project dt/Project/web/images/demo/bill/" + idBill + ".png";

        try {
            Connection conn = DriverManager.getConnection(url, user, password);

            String sql = "SELECT URL from detailbill WHERE idBill = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, idBill);

            ResultSet result = statement.executeQuery();
            if (result.next()) {
                Blob blob = result.getBlob("URL");
                InputStream inputStream = blob.getBinaryStream();
                OutputStream outputStream = new FileOutputStream(filePath);

                int bytesRead = -1;
                byte[] buffer = new byte[BUFFER_SIZE];
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                inputStream.close();
                outputStream.close();
                System.out.println("File saved");
            }
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
