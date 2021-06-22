package method_reference;

//api
import java.util.function.IntBinaryOperator;

public class MethodRefExample {
    public static void main(String[] args) {
        //두개의 Int 형 연산을 담을 수 있는 클래스
        IntBinaryOperator operator;

        //메소드 참조법
        operator = (x,y) -> Calculator.staticMethod(x,y);

        System.out.println("결과 1 :   "+
                operator.applyAsInt(1,2));



        //정적 메소드 참조
        //클래스 이름 :: 정적 메소드 이름
        operator = Calculator :: staticMethod;
        System.out.println("결과 2 :   "+
                operator.applyAsInt(1,2));


        //갹채 메소드 참조
        //갹체 이름 :: 갹체 메소드 이름
        Calculator c = new Calculator();
        operator = (x,y) -> c.staticMethod(x,y);
        System.out.println("결과 3 :   "+
                operator.applyAsInt(3,4));

        operator = c::instanceMethod;
        System.out.println("결과 4 :   "+
                operator.applyAsInt(3,4));



        /*(x,y) -> Calculator.staticMethod(x,y);
        *
        *
        * */

    }
}
