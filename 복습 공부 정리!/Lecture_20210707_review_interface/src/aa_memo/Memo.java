package aa_memo;

public class Memo {
    /*
    * 전역 변수 (global variable):동일 클래스 내에서 합수 밖에서 선연된 변수
    *
    * 지역변수(local variable) : 동일 클래스 내에서 함수 안에서 선언된 변수
    *
    * public class Card {
    * //전역 변수
    * (필드,정적 변수) int age ,static int a.       this.age: //객체의 필드 접근
    *
    * public void method (int a , int b) { int a, int b : 지역 변수
    *  지역 변수
    * int sum :지역변수 ,for (int s:arr) int s : 지역변수
    * }
    *
    *
    *-----------------클래스와 인터페이스-----------------------------
    *
 클래스 (다중상속 (X))
    * -하나의 객체를 정의하기 위한 설계도
    * -ex) 강의실의 속할할수 있는 칠판,빔프로젝트 의자.. 등등
    * -필드(속성) + 함수(기능) (abstract 함수,static 함수 ,일반 함수 다)
    * -하나 이상의 abstract  함수를 포함한 클래스 => 추상 클래스
    *
    * -abstract 함수 (추상 메소드 )
    *    :선언만 되어있고 구현되어 있지 않은 메소드
    *
    * abstract void sound () {///구현부 X} (X)
     * abstract void sound (); (O)
     *
     *
    * Animal(super) ( (abstract void sound();)>> Dog,Cat
    * --Animal : sound (),getAge(),getName();
    *  (하나라도 추상클래스를 가지게 되면 ) Abstract class Animal 이 됨!
    *
    * Dog,Cat 클래스에서 @Override 해야함!
    *
    * 애니멀 클라스의 사운드 함수를 일반적으로 정의하기에는 광범위함   (그냥 sound()를 올리기에는)
    * 각자 클래스 를 가야 알수있음!
    *
    * 저 사운드를 구체화 할수 잇는 함수가 필요함!
    *
    *
인터페이스 (다중상속 (O))
    * - 객체를 정의하는 설계도가 아님 (구체적일 필요가 없음 ,추상적 )
    * -ex) List(인터페이스) -> ArrayList,LinkedList,Vector (클래스)
    *  List 가 인터페이스 인 이유는 공통된 함수가 많아서 List를 인터페이스로 만들고
    *   구체화적인 부분은 클래스로 만든 형태이다
    *
    *
    *-여러 클래스에서 사용하는 함수를 따로 저장해두는 궁간
    *-상수,abstract 함수,static 함수 ,default 함수
    *
         *  ex) 강의실 이라는 부모클래스에 노트북, 아이패드,무선 키보드, 리모콘 이라는 자식 클래스의 배터리를 충천하는 함수가 필요함!
         * -추상 클래스 전자기기 (대상의 필드+함수가 필요함 )(구체화적인 내용이 필요하다면) (부모-자식  관계)  가 좋다
         * - 인터페이스 (그냥 함수만 관리하는 관계라면  ) (필드가 존자할수없음! )   가 좋다
         *   굳이 하나하나 @Override charge() 하지말고 인터페이스 (ElectronicManaging) 의 안에 (charge())라는 함수를 뺄수있음!
         *
         * * -상수       int a=3; (static final 자동생략 )
         *
         * -추상메소드
         *   public void b();(abstract 자동 생략) (자식이 재정의를 무조건해야함)
         *
         * -default 메소드   (자식이 재정의 선택적)
         * public default void c(){}
         *
         * -static 메소드    (인터페이스.메소드 이름())
         * public static void d() {}
         *

    *  클래스 implements 인터페이스(구현관계) 여기서만 사용가능!
    *  클래스 extends 클래스 (다중 상속 불가)(상속관계 )
    * 인터페이스 extends 인터페이스 (다중 상속 가능)
    *
    * 클래스 implements 인터페이스1,인터페이스 2
    * 클래스 extends 클래스 implements 인터페이스1,인터페이스 2 (클래스에는 상속이 먼저 나와야함! )
    * 인터페이스 extends 인터페이스 1,인터페이스 2
    *
    *
*---다형성
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    *
    * */
}
