package comparator_test_0707_homework;

public class Student implements Comparable<comparator_test_0707_homework.Student>{//하나의 자료 구조에 한해서 정렬을 도와주는 인터페이스 이다! <> 제네릭 형식이니 꼭
    // 형을 넣어줄것!
    int id;
    String name;
    int grade;//학년
    int score;//성적

    public Student (int id,String name,int grade,int score) {
        this.id = id;
        this.name = name;
        this.grade = grade;
        this.score = score;

    }

    @Override
    public int compareTo(Student o) {//현 생성자의 값과 들어오는 값의 비교 this.score ? o.score
        if(this.id<o.id)return -1;

        else if(this.id==o.id) return 0;

        else return 1;

    }
    @Override
    public String toString () {
        return " 번호는 :" + this.id + " "+"이름은 :"+ this.name + " "+"학년은 : "+this.grade+" "+ "점수는 :"+ this.score+ " "+"과목은 ";
    }
}
