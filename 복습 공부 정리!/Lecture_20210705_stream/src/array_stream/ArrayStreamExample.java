package array_stream;

import java.util.Arrays;
import java.util.stream.Stream;
import java.util.stream.IntStream;


public class ArrayStreamExample {
    static int sum = 0;
    static int sum2 =0;
    public static void main(String[] args) {
        //String
        //int

        String [] strArray ={"홍길동","홍길순","김자바","홍순순","홍길동"};
        //stream 만들고 forEach 를 통해 요소 출력

        Stream<String>strStream = Arrays.stream(strArray);

        strStream.forEach(s -> System.out.println(s));
        System.out.println();

        //홍씨를 찾기!
        Stream<String>strStream2 = Arrays.stream(strArray);

        strStream2.filter(s -> s.startsWith("홍"))
                .forEach(s -> System.out.println(s));
        System.out.println();
        System.out.println("[중복 제거 distinct]");
        Stream<String>strStream3 = Arrays.stream(strArray);

        strStream3.distinct().filter(s -> s.startsWith("홍길"))
                .forEach(s -> System.out.println(s));
        //distinct() 검색 한것중 겹쳐진건 삭제하는 함수







        int [] intArrays = {1,2,3,4,5};
        //stream 만들고 forEach 를 통해 요소 출력

        IntStream intStream = Arrays.stream(intArrays);
        //기초자료형 int,double,long 은 따로 있음!
        intStream.forEach(s -> System.out.println(s));
        System.out.println();
        //한번 반복한 경우 더이상 반복할수 없다!


        IntStream intStream2 = Arrays.stream(intArrays);
        //다른 변수를 만들어 새롭게 돌아야한다!

        intStream2.forEach(s -> sum += s);
        System.out.println("합은 : "+sum);
        //외북 계산이 아닌 내부계산식을 가져오므로 이런 식의 경우
        //static int = sum(전역 변수, 정적 변수) 을 가져와야한다!
        // Stream .?? 은 하나의 함수 이기에 메인에서는 볼수 없다!
        // == 클래스에서 스태틱을 만들어야 한다


        //레인지 크로즈드 함수를 사용해 1,5 합을 구할수 있다!
        IntStream intStream3 = IntStream.rangeClosed(1,5);
        intStream3.forEach(s -> sum2 +=s);
        System.out.println("총합 : "+sum2);

        IntStream.range(1,5);// 1<=     <5
        IntStream.rangeClosed(1,5); //1 <=   <=5


    }
}
