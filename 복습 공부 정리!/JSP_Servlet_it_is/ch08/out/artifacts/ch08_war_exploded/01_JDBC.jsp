<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/26
  Time: 10:52 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.* , java.util.*" %>
<%
  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  String user = "scott";
  String password = "tiger";

  Connection conn = null; //DB 연결 객체
  Statement stmt = null; //sql 문 작성 객체
  ResultSet rs = null; //sql문 실행 결과 담는 객체

  String id,pwd,name,num1,num2,email,phone;
  int count =0; //테이블에 저장된 레코드 (행) 갯수 저장

  try{
    Class.forName(driver);// JDBC 드라이버 객체 생성
    conn = DriverManager.getConnection(url,user,password);
    //jdbc 드라이버를 통해 db 연결
    stmt = conn.createStatement();
    //sql 문 작성 객체 생성

   rs =  stmt.executeQuery("SELECT * FROM REGISTER");
    //질의문 실행

    if (rs != null){
      while (rs.next()){ //다음 레코드 유무 반환 (true/false)
        id=rs.getString("ID");
        //컬럼 이름을 통해 데이터 반환
       pwd= rs.getString("PWD");
        name = rs.getString("NAME");
       num1= rs.getString("NUM1");
       num2= rs.getString("NUM2");
       email= rs.getString("EMAIL");
       phone= rs.getString("PHONE");

       out.println (id + "<br>");
        out.println (pwd + "<br>");
        out.println (name + "<br>");
        out.println (num1 + "<br>");
        out.println (num2 + "<br>");
        out.println (email + "<br>");
        out.println (phone + "<br>");

        //브라우저 출력

        count++;
      }
      out.println("레코드 수 : "+count + "<br>");
      //콘솔 (우리가 보는) 출력
    }
  }
  catch (ClassNotFoundException e){
    System.out.println("class not found");
  }catch (SQLException e){
    System.out.println("sql exception");
  }catch (Exception e){
    System.out.println(e.getMessage());
  }
  finally {
      if(rs!=null) rs.close();
      if(stmt != null) stmt.close();
      if(conn !=null) conn.close();
  }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
