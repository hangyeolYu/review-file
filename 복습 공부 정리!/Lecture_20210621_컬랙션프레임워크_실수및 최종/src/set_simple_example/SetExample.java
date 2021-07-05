package set_simple_example;

import java.util.*;

public class SetExample {
    public static void main(String[] args) {

        Set<String> set = new HashSet<>();
        //인터페이스는 상수,추상메소드

        set.add("Java");
        set.add("HTML");
        set.add("CSS");
        set.add("JavaScript");
        set.add("Java");//중복

        int size = set.size();
        System.out.println("객체 수 : " + size);

        //반복자
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()) {
            //객체가 없으면 false로 됨!
            String element = iterator.next();
            System.out.println("\t" + element);
            //\t 는 tab 만큼 띄어쓰기
        }
        System.out.println();
        //set.remove(3);//? 인덱스 개념이 없어서 안댁스를 통한 삭제 불가
        set.remove("JavaScript");
        set.remove("HTML");

        size = set.size();
        System.out.println("객체 수 : " + size);

        iterator = set.iterator();// 돌겠다고 하는데 혼자서는 못돔 
        while (iterator.hasNext()) {
            //객체가 없으면 false로 됨!
            String element = iterator.next();
            System.out.println("\t" + element);
            //\t 는 tab 만큼 띄어쓰기
        }
        System.out.println();

        System.out.println(set.contains("HTML"));
        set.clear(); // 전체삭제

        size = set.size();
        System.out.println("객체 수 : " + size);

        iterator = set.iterator();// 돌겠다고 하는데 혼자서는 못돔
        while (iterator.hasNext()) {
            //객체가 없으면 false로 됨!!!!!!!!!!!
            String element = iterator.next();
            System.out.println("\t" + element);

        }
        System.out.println(set.isEmpty()?"비어있음":"비어있지않음");
    }
}
