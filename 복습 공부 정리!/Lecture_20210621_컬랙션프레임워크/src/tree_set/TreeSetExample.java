package tree_set;

import java.util.TreeSet;

public class TreeSetExample {
    public static void main(String[] args) {
        TreeSet<Integer> scores = new TreeSet<>();

        scores.add(87);
        scores.add(98);
        scores.add(75);
        scores.add(95);
        scores.add(80);

        int score;
        score = scores.last();
        System.out.println("가장 높은 점수  : "+score);

        score = scores.first();
        System.out.println("가장 낮은 점수 : "+score);

        //1.95점 아래 점수
        score = scores.lower(95);
        System.out.println("95점 아래의 점수 : "+score);
        //2.95점 위의 점수
        score = scores.higher(95);
        System.out.println("95점 바로 위의 점수..? : "+score);

    //treeSet의 오름차순 출력

        while(scores.size()!=0){

            System.out.print(scores.pollFirst()+",");
        }
    //treeSet 의 내림차순 출력
        // (위에서 다 빼다가 삭제해서 인자가 없음!)
    while(scores.size()!=0){
        System.out.print(scores.pollLast()+",");
    }

    //TreeSet 비어있으면 true
    //TreeSet 비어있지 않으면 false
    while(!scores.isEmpty()){
        score = scores.pollFirst();
        System.out.println(score);
    }

    //방법이 어떻든 결과가 같다면 전뿌다 정답!

    }
}
