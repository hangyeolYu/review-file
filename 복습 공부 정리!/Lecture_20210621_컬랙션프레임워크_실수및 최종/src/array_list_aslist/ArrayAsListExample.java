package array_list_aslist;

import java.util.*;

public class ArrayAsListExample {
    public static void main(String[] args) {

        //Arrays.asList()=>Arrays => list
        List<String>list1 = Arrays.asList("홍길동","홍길순","김자바");//고정객체

        //list1.add("유한결");//왜이럴까? List 클래스의 add 함수가 abstract

        for(String name:list1){
            System.out.println(name);
        }
        System.out.println();

        List<Integer>list2
                =Arrays.asList(1,2,3);//고정객체

        for(int value:list2){
            System.out.println(value);
        }
    }
}
