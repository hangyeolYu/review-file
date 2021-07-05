package queue_test;



//학생식당에서 줄을 서고 있는 모습
public class Student implements Comparable{
    private int sno;//학번

    public Student(int sno) {
        this.sno = sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }


    public int getSno() {
        return sno;
    }

    @Override
    public String toString () {
        return "학번 : "+ sno;
    }

    public int compareTo(Student o) {
        if(this.sno < o.sno) return -1;
        else if(this.sno == o.sno)return 0;
        else return 1;


    }
}


