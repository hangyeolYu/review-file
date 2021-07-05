package stream_pipelines;

import java.util.*;
import java.util.stream.Stream;
public class PipelineExample {
    public static void main(String[] args) {

        List<Student> slist = Arrays.asList(
                new Student("홍길동",30),
                new Student("홍길순",50),
                new Student("김인텔",80)
                );

        //학생들의 성적의 평균을 계산
        //1).중간 처리 :
        // mapToInt ((s)->{s.getScore()});
        //(학생 객체 -> 점수 매핑 )mapToInt(getScore)

        //메소드 참조(Method Reference)
        //:불필요한 매개변수 제거하기 위해
        //mapToInt (클래스 이름 :: static 메소드 이름)
        //mapToInt (객체변수 이름 ::  메소드 이름)

        //2).최종 처리 :average()

        double avg = slist.stream() //원본 스트림
                .mapToInt(s->s.getScore()) // 중간처리 스트림 객체안에 저장되어 있는 데이터를  int 형으로 바꿈! (데이터를 모은듯 ㅋ)
                .average() //최종처리 스트림  //더하고 평균내 임마 ㅋ
                .getAsDouble(); //반환값을 더블로 가져옴!
        System.out.println("평균 점수 : "+avg);
    }
}
