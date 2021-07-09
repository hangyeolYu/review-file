package stream_optional;


import java.util.*;
import java.util.stream.Stream;

public class OptionalExample {
    public static void main(String[] args) {
       List<Integer> list = new ArrayList<>();
//        //list의 요소가 비어있음
//
//        //list 요소가 비어있을 경우 averager() 함수 실행   //Integer -> int 변환해 맵핑함 (s -> s.intValue)
//        double avg = list.stream().mapToInt(s -> s.intValue())
//                .average().getAsDouble();
//        System.out.println(avg);
        //NoSuchElementException :list안에 처리할 요소가없음

        //OptionalDouble average()
        //요소가 없을 경우 디폴트 값을 생성할 수 있음

        //방법 1.(isPresent()) //average ==OptionalDouble
        //(isPresent(),ifPresent(),orElse(),double)
       OptionalDouble op1 =  list.stream().mapToInt(s -> s.intValue()).average(); //더블 클래스로 변환하기 전에 옵셔널 클래스를 거친 케이스
       if(op1.isPresent())//boolean 으로 물어봄 애초에 isPresent =true 이므로!
       {System.out.println("평균 : "+op1.getAsDouble());}
       else {
           System.out.println("평균 : 0.0");
       }

       //방법2.(orElse)
        double op2 =  list.stream().mapToInt(s -> s.intValue()).average().orElse(0.0); //요소값이 없을경우 디폴트 값 지정
        System.out.println("평균은 ? :"+op2);

       //방법 3(ifPresent(DoubleConsumer)) //요소를 소비하는 코드
        list.stream().mapToInt(s ->s.intValue())
                .average()
                .ifPresent(a-> System.out.println("평균은 : "+a));//더블 클래스 자체 변환 후 소비
        //값이 없을때는 출력 자체가 X
        //값 이 잇을때만 요소 소비 코드를 통해 소비함





   }
}
