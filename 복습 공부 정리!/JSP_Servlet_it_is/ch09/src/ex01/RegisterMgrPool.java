package ex01;

import java.sql.*;
import java.util.*;
import ex01.RegisterBean;
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

    public boolean loginRegister (String id,String pwd ) {
        Connection conn = null; //DB 연결 객체
        PreparedStatement stmt = null; //sql 문 작성 객체
        ResultSet rs = null; //sql문 실행 결과 담는 객체

        ArrayList<RegisterBean> list = new ArrayList<>();
        boolean result = false;
        //배열 생성

        try {
            conn =
                    pool.getConnection();
            //jdbc 드라이버를 통해 db 연결
            String query = "SELECT  count(*) FROM REGISTER"
                    + " WHERE ID = ? AND PWD =?";
            stmt =  conn.prepareStatement(query);
            //Statement 보다 약간 질의 속도가 빠름!
            //why ? 질이문 미리 컴파일 해놓고 사용자한테 전달받은 값만
            //id, pwd 로 전달하도록 질의 처리 (질의문 변수 부분은 아직 모르곘으면 ? 작성 )

            stmt.setString(1,id);
            stmt.setString(2,pwd);
            //sql 구문에 ? 알아서 들어감 신기하네

            rs = stmt.executeQuery();
            //"SELECT count(*) FROM REGISTER" 쿼리안에 이걸 지우니 실행됨!
            //질의문 실행

           //아이디와 패스워드를 입력을 받아서
            // 해당 아이디와 패스워들르 가진 데이터가 있는지 테이블 조회
            //결과 테이블의 행 개수 1개라면
            //동일한 아이디 패스워드가 테이블 존재!

            if(rs.next() && rs.getInt(1)>0){
                result =true;

                //rs.getInt(1) :현재 행의 1번째 속성 값 (count(*))반환
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

    return result;
    }
}