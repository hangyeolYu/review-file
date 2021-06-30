package tree_set_sorting;

import java.util.Iterator;
import java.util.NavigableSet;
import java.util.TreeSet;

public class TreeSetSorting {
    public static void main(String[] args) {

        TreeSet<Integer> scores = new TreeSet<Integer>();
        scores.add(87);
        scores.add(98);
        scores.add(75);
        scores.add(95);
        scores.add(80);
        System.out.println(scores);
        System.out.println();

        //처음 TreeSet의 기본 오름차순 출력Iterator 사용
        System.out.println("[Iterator 활용 츌력]");
         Iterator<Integer>ascendingIterator = scores.iterator();
        while(ascendingIterator.hasNext()){
            System.out.print(ascendingIterator.next()+" ");
        }
        System.out.println();
        System.out.println();

        System.out.println("[Iterator 내림차순 출력]");

        Iterator<Integer> decendingIterator
                = scores.descendingIterator();

        while(decendingIterator.hasNext()){
            System.out.print(decendingIterator.next()+ " ");
        }

        System.out.println();
        System.out.println();

        NavigableSet<Integer> descendingSet
                = scores.descendingSet();

        System.out.println("[내림차순 정렬]");
        for(int score:descendingSet){
            System.out.print(score + " ");
        }
        System.out.println();
        System.out.println();

        NavigableSet<Integer> ascendingSet
                =descendingSet.descendingSet();

        System.out.println("[오름차순 정렬]");
        for(int score:ascendingSet){
            System.out.print(score + " ");
        }




    }
}
