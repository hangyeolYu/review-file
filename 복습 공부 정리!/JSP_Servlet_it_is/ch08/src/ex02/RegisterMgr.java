package ex02;

import java.sql.*;
import java.util.*;
//db 연동 되는 빈즈 부분
public class RegisterMgr {
    private final String driver = "oracle.jdbc.driver.OracleDriver";
    private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private final String user = "scott";
    private final String password = "tiger";

    //생성자
    //jdbc 드라이버 로딩
    public RegisterMgr() {
        try {
            Class.forName(driver);
        } catch (Exception e) {
            System.out.println("Error!");
            System.out.println(e.getMessage());
        }
    }


//DB 연결 생성
//사용자 데이터 저장 (배열? 어레이 리스트?)(ArrayList<RegisterBean>)

    public ArrayList<RegisterBean> getRegisterList () {
        Connection conn = null; //DB 연결 객체
        Statement stmt = null; //sql 문 작성 객체
        ResultSet rs = null; //sql문 실행 결과 담는 객체

        ArrayList<RegisterBean> list = new ArrayList<>();
        //배열 생성

        try {
            conn = DriverManager.getConnection(url, user, password);
            //jdbc 드라이버를 통해 db 연결
            stmt = conn.createStatement();
            //sql 문 작성 객체 생성

            rs = stmt.executeQuery("SELECT * FROM REGISTER");
            //질의문 실행

            if (rs != null){
                while (rs.next()){ //다음 레코드 유무 반환 (true/false)
                    //out.println("sss"); 첫행은 기준이라 다음부터 기준을 잡음 !
                    RegisterBean bean = new RegisterBean();


                    bean.setId(rs.getString("ID"));
                    //rs.getString() : 컬럼 이름을 통해 데이터 반환
                    //bean.setId(): 데이터를 bean 값으로 반환
                    bean.setPwd( rs.getString("PWD"));
                    bean.setName(rs.getString("NAME"));
                    bean.setNum1(rs.getString("NUM1"));
                    bean.setNum2(rs.getString("NUM2"));
                    bean.setEmail(rs.getString("EMAIL"));
                    bean.setPhone(rs.getString("PHONE"));
                    list.add(bean);

                }
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        finally {
            if(rs!=null) {
                try {
                    rs.close();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            if(stmt != null){
                try {
                    stmt.close();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            if(conn !=null){
                try {
                    conn.close();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }
        return list; //결과 반환

    }
}
