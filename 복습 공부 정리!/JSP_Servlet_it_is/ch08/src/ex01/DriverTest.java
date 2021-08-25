package ex01;

import java.sql.*;

public class DriverTest {
    public static void main(String[] args) {

        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "scott";
        String password = "tiger";

        try{
            Class.forName(driver);
            System.out.println("jdbc driver 로딩 성공!");

            DriverManager.getConnection(url,user,password);
            //db서버에 연결을 시도하는 부분
            System.out.println("오라클 연결 성공!");
        }catch (ClassNotFoundException e){ //1
            System.out.println("jdbc driver 로딩실패!");
        }catch (SQLException e) {
            System.out.println("오라클 연결 실패! ");
        }
    }
}
