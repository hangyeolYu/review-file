package set_performance_test;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

public class SetPerformanceTest {
    public static void main(String[] args) {
        Set<String> sHashSet = new HashSet<>();
        Set<String> sTreeSet = new TreeSet<>();
        Set<String> sLinkedHashSet = new LinkedHashSet<>();

        Set<Integer> iHashSet = new HashSet<>();
        Set<Integer> iTreeSet = new TreeSet<>();
        Set<Integer> iLinkedHashSet = new LinkedHashSet<>();

        //1.중복된 원소를 넣을 경우
        System.out.println("[Duplicate Test]");
        duplicateTest(iHashSet);
        duplicateTest(iTreeSet);
        duplicateTest(iLinkedHashSet);
        System.out.println();

        //2.원소 정렬 여부
        System.out.println("[Sort Test]");
        sortTest(iHashSet);//랜덤
        sortTest(iTreeSet);//크기 정렬 순수
        sortTest(iLinkedHashSet); //원소 삽입 순서
        System.out.println();

        //3. 원소 삽입 속도 비교

        System.out.println("[add Test]");
        addTest(sHashSet);//
        addTest(sTreeSet);//
        addTest(sLinkedHashSet); //
        System.out.println();


        //4. 원소 검색

        System.out.println("[search Test]");
        searchTest(sHashSet);//
        searchTest(sTreeSet);// 이게빨라야하지만 현재의 데이터는 Linked 랑
        //다를게 없다 데이터 형태에 따라 어떤 컬렉션을 쓸지 염두할것!
        searchTest(sLinkedHashSet); //
        System.out.println();

        //5. 원소 삭제

        System.out.println("[remove Test]");
        removeTest(sHashSet);//
        removeTest(sTreeSet);//
        removeTest(sLinkedHashSet); //
        System.out.println();
    }

    public static void duplicateTest(Set<Integer> set) {
        int[] arr = {10, 10, 20, 20, 30, 30};
        for (int i : arr) {
            set.add(i);
        }
        System.out.println(set.getClass().getName()
                + " : " + set.toString());
    }

    public static void sortTest(Set<Integer> set) {
        int[] arr = {10, 20, 30, 80, 50, 70, 60, 40, 90};
        for (int i : arr) {
            set.add(i);
        }
        System.out.println(set.getClass().getName()
                + " : " + set.toString());
    }

    public static void addTest(Set<String> set) {
        int size = 1000000;
        long startTime, endTime;

        startTime = System.nanoTime();//long 으로 반환함 8바이트 크기 정수
        for (int i = 0; i < size; i++) {
            set.add("Data" + i);//원소 더하기
        }
        endTime = System.nanoTime();
        System.out.println(set.getClass().getName()
                + " 원소 추가 실행 속도 " + (endTime - startTime) + "ns");

    }
    //searchTest(contains())

    public static void searchTest(Set<String> set) {
        int size = 1000000;
        long startTime, endTime;

        startTime = System.nanoTime();//long 으로 반환함 8바이트 크기 정수
        for (int i = 0; i < size; i++) {
            set.contains("Data" + i);//검색
        }
        endTime = System.nanoTime();
        System.out.println(set.getClass().getName()
                + " 원소 검색 실행 속도 " + (endTime - startTime) + "ns");

    }

        //removeTest(remove())
        public static void removeTest(Set<String> set) {
            int size = 1000000;
            long startTime, endTime;

            startTime = System.nanoTime();//long 으로 반환함 8바이트 크기 정수
            for (int i = 0; i < size; i++) {
                set.remove("Data" + i);//삭제
            }
            endTime = System.nanoTime();
            System.out.println(set.getClass().getName()
                    + " 원소 삭제 실행 속도 " + (endTime - startTime) + "ns");


        }
}
