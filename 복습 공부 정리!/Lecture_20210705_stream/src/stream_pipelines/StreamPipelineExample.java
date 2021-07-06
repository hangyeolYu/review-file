package stream_pipelines;
import java.util.*;
import java.util.stream.*;

public class StreamPipelineExample {
    public static void main(String[] args) {
        List<Member> list = Arrays.asList(
                new Member("홍길동",0,20),
                new Member("홍길순",Member.FEMALE,45),
                new Member("박박박",Member.MALE,60),
                new Member("이이이",Member.FEMALE,36)
        );
        //filter((람다식)),mapInt(m ->m.getAge())
        // .average()함수를 이용해서
        //남성 회원의 나이 평균값을 구하는 프로그램 작성

        double avg = list.stream()
                .filter(a ->a.getGender() ==Member.MALE )   //성별이 남성인 사람만 들고옴 (중간처리)
                .mapToInt(a ->a.getAge())//객체 -> 객체 나이값으로 매핑 (중간처리)
                .average().getAsDouble();//최종처리
        System.out.println("남성 회원 평균 나이 : "+avg+"(세)");
    }
}
