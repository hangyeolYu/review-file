package Lambda_with_parametet;

import lambda_test.MyInterface;

public class MyInetfaceParamExample {
    public static void main(String[] args) {
        MyInterfaceParameter fi;

        //MyInterfaceParameter 안에 있는 추상 메소드 정의 (구현)
        fi = (x) -> System.out.println(x*5);//추상 메소드 재정의
        //마이인터페이스 파라미터 객체 지정을 안해도 익명 객체를 사용함
        fi.method(2); //추상 메소드 호출

        fi = x -> System.out.println(x*5);
        fi.method(2);

        fi = x -> {System.out.println(x*5);};// ;;;;;;;이거 잘보자
        fi.method(2);

        MyInterfaceAdd fa;

        //fa = (a,b) -> System.out.println(a+b);//다양한 추상메소드를 사용하기위해
        //인터페이스를 사용한다! void 일때

        //fa = (a,b) -> {return a+b;}; return값이 있을경우
        //return 문만 있을경우, return과 함께 중괄호 생략가능
        fa = (a,b) -> a+b;

        //fa.methodadd(3,5);

        int ret = fa.methodadd(3,5);
        System.out.println(ret);

        fa = (a,b) -> {
            System.out.println("a="+a+",b="+b);
            return a+b;//문장이 2개 이상이라 return 정의 필수!
        };
        System.out.println(fa.methodadd(3,5));
    }

    //추상 메소드 : 두 정수의 매개변수
    //두 정수의 더한 값을 출력하는 람다식을 작성하시오.
}
