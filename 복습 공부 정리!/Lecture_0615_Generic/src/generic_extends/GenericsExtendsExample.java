package generic_extends;

public class GenericsExtendsExample {
    public static void main(String[] args) {

       int res1 = compare1(10,20);//반환된 변수를 받아줄 변수 res1
        System.out.println(res1);

        int res2 = compare1(10.0,10);//반환될때 함수안에서 더블로 바꿔서 정의하므로 결국은 10.0 , 10.0 의 비교가됨!
        System.out.println(res2);
    }
    //두 수를 비교하는 함수
    //t1 < t2 => -1
    //t1 == t2 => 0
    //t1 > t2 => 1
    public static <T extends Number> int compare1 // 이름이 아니라 그냥 함수인듯 ㅋ
    (T t1 , T t2){
    double v1 = t1.doubleValue();
    // 넘버 클래스 함수
        double v2 = t2.doubleValue();

        if(v1 < v2) return -1;
        else if (v1 == v2) return 0;
        else return 1;
    }
}
