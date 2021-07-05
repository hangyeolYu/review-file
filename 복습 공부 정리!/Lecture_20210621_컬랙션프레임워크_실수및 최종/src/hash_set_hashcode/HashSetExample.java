package hash_set_hashcode;

import java.util.*;

public class HashSetExample {
    public static void main(String[] args) {
        Set<Member> set = new HashSet<>();
        //Set<Member> set = new Set<>();
        //불가능한 이유?
        //Set 인터페이스 추상 메소드-> 객체 생성 불가능
        set.add(new Member("홍길동",40));//1
        set.add(new Member("홍길동",40));//2

        //1==2 주소값은 다르므로 false
        //1.equals(2)내용물은 같으므로 true
        //set에 저장된 객체수는 ? 1개
        System.out.println(set.size());
    }
}
