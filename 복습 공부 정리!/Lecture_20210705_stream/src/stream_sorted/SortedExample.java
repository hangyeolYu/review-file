package stream_sorted;

import java.util.Arrays;
import java.util.*;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class SortedExample {
    public static void main(String[] args) {

        //배열,컬렉션 sort()

        //객체 요소 => 기초 자료형 이거나 자바에서 제공하는 데이터 타입이면
        //int ,double,String...=> 정렬 방식 (내부구현)Comparable 구현
        //class String implements Comparable <String> //사전순서 오름차순
        //class Integer implements Comparable <Integer>//크기순서 오름차순
        //class Double implements Comparable <Double>//크기순서 오름차순
        //@Override
        //public int compareTo(String o){
        // }

        //이방식이 아닌
        //*우리가 원하는 정렬방식으로 바꾸고 싶다!
        //Comparator 구현
        //Class NewOrder implements Comparator<String>//사전순서 내림차순 등등..
        //@Override
        //public int compare(String o1,String o2){
        // }
        //Class NewOrder implements Comparator<Integer>//크기순서 내림차순 등등..
        //Class NewOrder implements Comparator<Double>//크기순서 내림차순 등등..

        //=> .sorted(new NewOrder())

        //근데만약 객체 요소가  int ,double,String...가 아니라
        //객체 요소 => Student 클래스형 이라면?

        //class Student implements Comparable<Student>//기본 정렬 방식을 구현 (내맘 ㅋ)

        //String name;
        //int score;

        //==>sorted()

        //-----Comparator 구현 (다른 방식을 추가하고 싶을떈 )
       // class Student implements Comparator<Student>
        // 기본정렬 방식이 아닌 다른 방식 구현
        //ex) 위에 기본정렬은 이름순 이므로 새롭게 정의하는 성적 오름차순으로 할때

        //=> sorted(new NewOrder())

        //----NewOrder 클래스 구현없이 익명 구현 객체
        //sorted(new Comparator<Student>(){
        // @Override
        // public int compare(Student o1,Student o2){
        //
        //
        //}
        // )

        //Comparator 인터페이스가 함수형 인터페이스 (Functional Interface)
        //>>>추상 메서드가 오직 하나만 존재하는 인터페이스를 함수형 인터페이스 라고 함
        //>>> 왜 하나만? 불필요한 재정의를 막기위해 (사용하지 않은 메소드의 재정의 까지 할필요가 X)

        //=> 람다식으로 바꿀 수있음! ==힘수형 인터페이스는

        //sorted((Student o1,Student o2)->{return o1.name.compareTo(o2.name);})
        //sorted((Student o1,Student o2)-> o1.name.compareTo(o2.name)) 문장이 하나만 오면 ;,{} return  생략 가능




        //숫자 요소일 경우
        int [] intArray = {5,3,2,1,4};
        IntStream intStream = Arrays.stream(intArray);
        intStream.sorted()//오름차순 정렬
                .forEach(n -> System.out.println(n));

       // String 요소일 경우
        System.out.println("[String 형 ]");
        String [] strArray = {"a","ab","aa","abc"};
        Stream<String> stringStream = Arrays.stream(strArray);
        stringStream.sorted()
                .forEach(n -> System.out.println(n));

        //객체 요소일 경우
        //정해진 크기(객체 정해짐 )의 Arrays -> List로 변경하고 싶을때
        // 사용할수 있는 함수가 많아서!
       List<Student> sList = Arrays.asList(
               new Student("홍길동",30),
               new Student("홍길순",10),
               new Student("이클립",20)
       );
       //1.나이를 기준으로 sorted()
       sList.stream()
               .sorted() //Comparable 인터페이스가 Student 구현되어야함
               .forEach(s-> System.out.println(s));//toString 정의가 필요!



        //2. 이름을 기준으로 sorted (Comparator<T>)
        //NameOrderComparator implements Comparator<>
        System.out.println();

//        sList.stream(new Comparator<Student>());{
//                .sorted((Student o1, Student o2)->
//                     o1.name.compareTo(o2.name))});
//                .forEach(s-> System.out.println(s));



//        sList.stream()  //위에 있는 람다식 정석
//                .sorted(new Comparator<Student>() {
//                    @Override
//                    public int compare(Student o1,Student o2) {
//                        return o1.name.compareTo(o2.name);
//
//                    }
//                })
//                .forEach(s-> System.out.println(s));
        System.out.println();
        sList.stream()
                .sorted(new NameOrderComparator())//부를수 잇는 이유는 이미 컴패어 함수가 구현되어있어서 가능하다!
                .forEach(s-> System.out.println(s));

    }
}
