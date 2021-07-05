package comparator_test_0707_homework;

import java.util.Comparator;

public class GradeComparator
implements Comparator<Student> {


    @Override
    public int compare(Student o1, Student o2) {
        if (o1.grade > o2.grade) return -1;

        else if (o1.grade == o2.grade)
            if (o1.id < o2.id) return -1;
            else if (o1.id == o2.id) return 0;
            else return 1;

        else return 1;
    }
}
