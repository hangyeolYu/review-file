package lambda_test;

public interface MyInterface {
    //추상 메소드 (abstract method)
    //:메소드가 선언만 되어 있고 구현되어있지 않은 함수
    //:누가 구현함? 사용하는 곳에서 (implements 맞나?) 맞추어 구현하면 됨
    int x =3; // 상수 정의 final
    public void method();//추상 메소드
    //public void otherMethod();//컴파일 오류

    /*람다식에서 사용하려면 추상 메소드가 오직 1개만 올수 있음
    *why?
    *
    * 객체가 필요없는 함수까지 재정의 하는것을 막기위해
    *
    *
    *
    * */



    //인터페이스
    //1.상수(final)=> 그냥 생략 가능
    //=> 뭔 변수를 써도 그냥 상수임

    //2.추상 메소드(abstract)얘또 생략가능
    //=>안써줘도 그냥 추상 메서드 임

    //3.디폴트 메소드 (default)
    //4.정적 메소드 (static)


    //추상 클래스 (abstract class)
    //하나이상의  추상 메소드를 갖는 클래스

}
