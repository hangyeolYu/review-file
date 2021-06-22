package lambda_test;

import lambda_test.MyInterface;

public class MyInterfaceExample {
    public static void main(String[] args) {
        MyInterface fi; //객체 변수를 만듬

        fi = () -> {
            //추상 메소드를 정의
            String str = "method call1";
            System.out.println(str);
        };
        fi.method();

        fi = () -> { System.out.println("method call2"); };
        fi.method();

        fi = () ->  System.out.println("method call3"); //중가로 생략가능
        //한줄일시
        fi.method();
    }
}
