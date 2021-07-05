package linked_list;

import java.util.*;



public class LinkedListExample {
    public static void main(String[] args) {
        ArrayList<String> list1 = new ArrayList<String>();
        //인덱스 ->원소 검색
        LinkedList<String>list2 = new LinkedList<>();//<> 안에 형 안써도됨!
        //원소 -> 인덱스-> 원소 검색

        long startTime; //int :4byte,long:8byte
        long endTime;

        System.out.println("ArrayList vs LinkedList");
        System.out.println("원소 삽입 비교");
        startTime = System.nanoTime();
        for(int i=0 ;i < 100000;i++){
            list1.add(0,String.valueOf(i));//int -> String 형변환
            // ArrayList 인덱스 0번에 계속 추가 뒤로 계속 밀려남
        }
        endTime = System.nanoTime();
        System.out.println("[ArrayList 걸린 시간]"+ (endTime-startTime));

        startTime = System.nanoTime();
        for(int i=0 ;i < 100000;i++){
            list2.add(0,String.valueOf(i));//int -> String 형변환
            //
        }
        endTime = System.nanoTime();
        System.out.println("[LinkedList 걸린 시간]"+ (endTime-startTime));


        System.out.println();
        System.out.println();


        System.out.println("ArrayList vs LinkedList");
        System.out.println("원소 검색 비교");
        startTime = System.nanoTime();
        for(int i=0 ;i < 100000;i++){
            list1.get(i);//                 인덱스 i번 검색
        }
        endTime = System.nanoTime();
        System.out.println("[ArrayList 걸린 시간]"+ (endTime-startTime));

        startTime = System.nanoTime();
        for(int i=0 ;i < 100000;i++){
            list2.get(i);
        }
        endTime = System.nanoTime();
        System.out.println("[LinkedList 걸린 시간]"+ (endTime-startTime));

    }
}
