package comparable_set;

import java.util.*;
public class Comparable_test { //하나의 자료 구조에 한해서 정렬을 도와주는 인터페이스 이다!
    public static void main(String[] args) {
        TreeMap<Student,String> subject
        = new TreeMap<>();

        //subject.put(new Student(),"국어");//인자가 없는 디폴트 생성자를 부르는중
        subject.put(new Student(1,"김자바",4,80),"국어");
        subject.put(new Student(2,"유한결",6,100),"수학");
        subject.put(new Student(3,"홍길동",2,60),"영어");
        subject.put(new Student(4,"모범생",1,100),"물리");
        System.out.println(subject);// subject 의 key 를 담당할 기준이 없기때문!

        //성적 순서대로 출력!
        //만약에 성적이 동일하다면 id 순서대로 (오름차순)출력! //완료 Compare 함수 정의된거 보자!

        System.out.println("");
        System.out.println("[역순 정렬!]");

        NavigableSet<Student> Set
        = subject.descendingKeySet();
        for(Student arr:Set){
            System.out.print(arr+ " "+subject.get(arr));
        }
        System.out.println();
        System.out.println();

        System.out.println("[다시 돌려~]");
        subject.descendingKeySet();
        System.out.print(subject);

        //성적 순서대로 출력!
        //만약에 성적이 동일하다면 id 순서대로 (오름차순)출력!
    }
}
