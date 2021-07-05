package queue_test;

import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;

public class QueueExample{
    public static void main(String[] args) {
        Queue<Student> resQuese = new LinkedList<Student>();

        //학생 줄 세움
        //학번 (입학년도 + 이름 순)
        //입학년도가 먼저인 사람부터 확식을 받을 수 있는 프로그램으 작성
        //입학년도가 같다면 그냥 번호순 (이름순)으로 받을 수있는 프로그램 작성

        resQuese.offer(new Student(20201));
        resQuese.offer(new Student(20216));
        resQuese.offer(new Student(20183));
        resQuese.offer(new Student(20072));

        while(!resQuese.isEmpty()){
            Student s = resQuese.poll();
            System.out.println(s+ " 가 학식을 받았습니다! ");
        }
        PriorityQueue<Student>sortedQueue = new PriorityQueue<>();//이걸쓰러면 comparable 을 해당 클래스에 임폴트 해야함!
            Student s = resQuese.poll();
            sortedQueue.add(s);
        }// comparable 인터페이스를 활용한 클래스 구분
        while(!sortedQueue.isEmpty()){
            Student s= sortedQueue.poll();
            System.out.println(s + " 가 학식을 받았습니다!");
        }
        //학번 : 입학연도 (4) +학생번호 (1)
        //ex) 2007년 입학한 학생 1번
        while(!sortedQueue.isEmpty()){
            Student s= sortedQueue.poll();
            System.out.println(s.toString().subtring(0,9)+ " 년 입학한 학생"+
                    s.toString().substring(9,10+" 번"));





    }

//    @Override
//    public int compareTo(Student o) {
//        return 0;
//    }
}
