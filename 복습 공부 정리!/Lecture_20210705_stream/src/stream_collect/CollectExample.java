package stream_collect;

import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class CollectExample {
    public static void main(String[] args) {
        List<Member> m = Arrays.asList(
         new Member("홍길동", Member.Gender.MALE,Member.City.Seoul,30),
         new Member("홍길순",Member.Gender.FEMALE,Member.City.Seoul,33),
         new Member("박클립",Member.Gender.MALE,Member.City.pusan,18),
         new Member("김인텔",Member.Gender.FEMALE,Member.City.Seoul,23),
         new Member("유한결",Member.Gender.MALE,Member.City.pusan,24)
                );

        //남성 회원만 묶어서 리스트 생성
        List<Member> maleList = m.stream()
                .filter(s ->s.getGender()==Member.Gender.MALE) //남성 회원만 골라서 쏘기
                .collect(Collectors.toList()); //새로운 리스트로 옮기기
        maleList.stream().forEach(s -> System.out.println(s.getName())); //리스트안의 요소 이름들을 출력하기!
        //리스트를 set에 넣기!
        System.out.println();

        Set<Member> femaleList = m.stream()
                .filter(s->s.getGender() == Member.Gender.FEMALE)
                .collect(Collectors.toSet());
        femaleList.stream()
                .forEach(s -> System.out.println(s.getName()));

        //서울에 살고있는 여성 회원만 묶어서 Set 생성 (coolect());
        System.out.println("[서울에 살고있는 여성 회원만 묶어서 Set 생성]");
        Set<Member> seoulFe = m.stream()
                .filter(s ->s.getCity() == Member.City.Seoul)
                .filter(s-> s.getGender()== Member.Gender.FEMALE) //Seoul,Female 등등 다 상수로 지정되어 잇어 == 비교가 가능하다!
                .collect(Collectors.toSet());
        seoulFe.stream()
                .forEach(s -> System.out.println(s.getName()));

        //나이가 30이상인 여성 회원만 묶어서 Set 생성(collect());
        System.out.println("[나이가 30이상인 여성 회원만 묶어서 Set 생성]");
        Set<Member> ageFe = m.stream()
                .filter(s ->(s.getAge()>=30)&&(s.getGender()== Member.Gender.FEMALE))
                .collect(Collectors.toSet());
        ageFe.stream()
                .forEach(s-> System.out.println(s.getName())); //얘도 소비형





    }
}
