package stream_sorted;
import java.util.*;

public class NameOrderComparator implements Comparator<Student> {
// 우리가 지정하는 Comparator





        @Override
        public int compare(Student o1, Student o2) {
            // TODO Auto-generated method stub
            return o1.name.compareTo(o2.name);//오름차순
            //return o1.name.compareTo(o2.name)*-1;//내림차순
        }


}
