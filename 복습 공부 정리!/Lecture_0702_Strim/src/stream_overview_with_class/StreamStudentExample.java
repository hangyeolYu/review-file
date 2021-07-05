package stream_overview_with_class;

import java.util.Arrays;//사용(컬렉션)
import java.util.List;//리스트 사용(컬렉션)
import java.util.stream.Stream;

public class StreamStudentExample {
    public static void main(String[] args) {


        List<Student> list = Arrays.asList(//이거 복슴좀 ㅋㅋ
                new Student("홍길동",90),
                new Student("이클립",90)
                );

        //1.Stream<student>
        //각 Student 객체를 반복하는 스트림을 얻음
        //2.Student 객체의 필드 (이름과 성적)을 출력
        Stream<Student> stream = list.stream();
       // stream.forEach(name -> System.out.println(name));//한번 보내면 사라짐..왜지..?
        stream.forEach(name ->{ System.out.println(name.getName()+name.getScore());  System.out.println(name.getName()+name.getScore());});
        //name == list에 저장된 각 객체
        //섹시하니 연습하자.. ㅎ
        //아니네 걍 써야되네 ㅡㅡ 훨씬 빠름

    }
}
