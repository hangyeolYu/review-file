package comparator_test_0707_homework;

import java.util.Comparator;

public class ScoreComparator
        implements Comparator<Student> {

    //성적을 내림차순으로 정렬
    //만약 성젹이 같다면 id를 오름차순으로 정렬
    @Override
    public int compare(Student o1, Student o2) {
        if(o1.score>o2.score)return -1;

        else if (o1.score==o2.score) {
            if (o1.id < o2.id) return -1;
            else if (o1.id == o2.id) return 0;
            else return 1;
        }

            else return 1;
    }
}
