package ex03;

import java.sql.*;
import java.util.*;
import ex02.RegisterBean;
//db 연동 되는 빈즈 부분
public class RegisterMgrPool {
    private DBConnectionMgr pool = null;

    //생성자
    //jdbc 드라이버 로딩
    public RegisterMgrPool() {
        try {
           pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error!");
            System.out.println("커넥션 풀 객체 반환 실패!");
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
            conn =
                    pool.getConnection();
            //jdbc 드라이버를 통해 db 연결
            stmt = conn.createStatement();
            //sql 문 작성 객체 생성

            rs = stmt.executeQuery("SELECT * FROM REGISTER");
            //질의문 실행

            if (rs != null){
                while (rs.next()){ //다음 레코드 유무 반환 (true/false)
                    //out.println("sss");
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
            pool.freeConnection(conn);
            //커넥션 풀에 객체 반환 (재사용 하기 위함  )
            //close ()호출 x (객체 메모리 해제 X)
            //pool이라는 가상 공간에서 가져오고 다시 갔다놈
            //why? 다시 DB에서 객체를 뽑으면 시간이 오래걸리니!
        }
        return list; //결과 반환

    }
}