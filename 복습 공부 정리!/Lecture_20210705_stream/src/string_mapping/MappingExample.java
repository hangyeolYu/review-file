package string_mapping;

import java.util.Arrays;
import java.util.stream.IntStream;

public class MappingExample {
    public static void main(String[] args) {

        int [] intArray = {1,2,3,4,5};
        //1) int ->double
        IntStream intStream = Arrays.stream(intArray);
        intStream.asDoubleStream()
                //int -> double 요소 변환해서 DoubleStream 생성 (맵핑 )
                .forEach(d -> System.out.println(d));
        System.out.println();

        //2)
        //boxing (int -> Integer)
        intStream = Arrays.stream(intArray);
        intStream.boxed()//int -> Integer 박싱해서 스트림(Stream<Integer>) 생성(맵핑)
               .forEach(d -> System.out.println(d));
        //주소가 나오지 않는 이유는 Integer는 기본으로 toString() 이 정의되어  나오고 있음!




    }
}
