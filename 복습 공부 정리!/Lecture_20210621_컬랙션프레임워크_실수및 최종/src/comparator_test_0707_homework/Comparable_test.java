package comparator_test_0707_homework;

import java.util.Set;
import java.util.TreeMap;



public class Comparable_test { //하나의 자료 구조에 한해서 정렬을 도와주는 인터페이스 이다!
    public static void main(String[] args) {




        // Score
        System.out.println("[GradeComparator]");
       TreeMap<Student,String> Greadecom = new TreeMap <>( new GradeComparator());

       Greadecom.put(new Student(1,"김자바",4,80),"국어");
        Greadecom.put(new Student(2,"유한결",6,100),"수학");
        Greadecom.put(new Student(3,"홍길동",2,60),"영어");
        Greadecom.put(new Student(4,"모범생",1,100),"물리");

        Set<Student>keySet = Greadecom.keySet();
        for(Student s :keySet){
            System.out.println(s + " :"+ Greadecom.get(s));// 키셋 만들어서 키를 통해 만드는건 성공 정렬 기준만 다시잡자
        }


        //Comparable 작성해서 단순 id 비교를 통한 기뵨 출력

        TreeMap<Student,String> subject
                = new TreeMap<>();// 인자가 없는경우 comparable 의 compare 함수가 기본 정렬을 해줌!

        //subject.put(new Student(),"국어");//인자가 없는 디폴트 생성자를 부르는중
        System.out.println("[Comparable]");
        subject.put(new Student(1,"김자바",4,80),"국어");
        subject.put(new Student(2,"유한결",6,100),"수학");
        subject.put(new Student(3,"홍길동",2,60),"영어");
        subject.put(new Student(4,"모범생",1,100),"물리");
        //System.out.println(subject);// subject 의 key 를 담당할 기준이 없기때문!

        Set<Student>keySet2 = subject.keySet();
        for (Student s : keySet2){

            System.out.println(s + " :"+ subject.get(s));
        }




        System.out.println();
        System.out.println("[Score Comparator]");

        TreeMap<Student,String> subject3
                = new TreeMap<>(new ScoreComparator());

        subject3.put(new Student(1,"김자바",4,80),"국어");
        subject3.put(new Student(2,"유한결",6,100),"수학");
        subject3.put(new Student(3,"홍길동",2,60),"영어");
        subject3.put(new Student(4,"모범생",1,100),"물리");

        Set<Student>keySet3 = subject3.keySet();
        for (Student s : keySet3){

            System.out.println(s + " :"+ subject3.get(s));
        }

        //1. 성적 순서대로 (내림차순 출력 )
    }
}
