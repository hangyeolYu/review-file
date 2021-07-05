package parallel_process;

import java.util.Arrays; //Collection 컬렉션 사용하려고 임폴트 함!
import java.util.List;
import java.util.stream.Stream;

public class parallelExample {
    public static void main(String[] args) {
        List<String> list = Arrays.asList("딸기","수박","파인애플");

        //순차 처리
        //Thread.currentThread().getName()
        Stream<String> stream = list.stream();
        stream.forEach(s ->print(s));
       // stream.forEach((s) ->{print(s)}); 한문장만 올경우 (),{}생략 가능


    Stream<String> pstream = list.parallelStream(); //자동 병열처리 설정 (라운드 로빈) 지 새끼들한테 먹이 조금씩 배분해주는거 보고 영감받
    pstream.forEach(s -> print(s));




    }
    public static void print(String str){
        System.out.println(str + ": " +
                    Thread.currentThread().getName());
    }
}
