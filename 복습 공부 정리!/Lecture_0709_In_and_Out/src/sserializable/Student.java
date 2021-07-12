package sserializable;

import java.io.Serializable;
//사용자 정의 클래스에서 각각의 필드들을 직렬화 할수 있게 만듬!
//모든 필드들을 바이트로 변환해도 좋다!

public class Student implements Serializable {


    //SerialVersionUID 필드: 클래스의 식별자
    //자바 자동 생성
    //직렬화 헀던 클래스 UID 플드값 == 역직렬화 클래스 UID 필드값
    //클래스 이름이 같으면 UID 값은 같음
    //클래스 이름이 같아도 클래스의 내용이 변경되면 UID 값이 변경될수 있음
    //그러면 역직렬화가 안되기때문에
    //명시적으로 UID를 지정할수 있음!
    //클래스 내용이 변경되더라도 UID 값이 설정되어있으면 오류발생 X
    static final long serialVersionUID = 1234;

    //직렬화에서 제외
    //키워드를 static


    String name; //힙 영역
    String id;  //힙 영역
    static String pass;//데이터  영역
    //패스위드(보안정보) 직렬화 과정에서 제외
    //필드는 유지가 되지만 값이 null 값으로 설정
}
