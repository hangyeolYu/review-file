package stream_sorted;

public class Student implements Comparable<Student>{
    String name;
    int score;

    public Student(String name, int score) {
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
    public String toString() {
        return "이름 : " + name + ", 점수 : " + score;
    }

    @Override
    public int compareTo(Student o) {
//        if(score<o.score)return -1;  //오름차순
//        else if(score==o.score)return 0;
//        else return 1; /이 세줄을 굳이 안써도
        return Integer.compare(score,o.score);//기본 오름차순 정렬
        //return Integer.compare(score,o.score)*-1; 내림차순
        //return Integer.compare(o.score,score); 돌려도 내림차순
    }
}
