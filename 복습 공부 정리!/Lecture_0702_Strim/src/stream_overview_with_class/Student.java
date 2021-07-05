package stream_overview_with_class;

public class Student {
    String name;
    int score;

    public Student (String name, int score){
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

    @Override
    public String toString () {
        return "이름은 : "+ this.name + " ,"+ "성적은 : "+this.score;
    }


}
