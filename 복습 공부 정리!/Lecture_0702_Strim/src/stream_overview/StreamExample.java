package stream_overview;


import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Stream;

public class StreamExample {
    public static void main(String[] args) {
        List<String> list = Arrays.asList(
                "딸기","수박","파인애플");

        Iterator<String> iterator=list.iterator();

        while(iterator.hasNext()){
            String str = iterator.next();
            System.out.println(str);
        }
// ----------------------자바 7 이전 방식 ------------------
        //Stream 을 이용 반복 (내부 반복자 )
      //  Stream<String> 스트림 클래스의 내부 형식은 String 이다

        //Stream 을 이용 반복 (내부 반복자) => 간단
      Stream<String> stream = list.stream();
        stream.forEach(name -> System.out.println(name)); //내임을 가져오고 그 네임으로 무얼 할꺼닝?






    }
}
