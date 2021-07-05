package hash_set_hashcode;

public class Member {
    String name; //필드
    int age;

    public Member(String name, int gae) {
        this.name = name;
        this.age = age; //필드 초기화
    }
    @Override//Object 클래스에 있는 함수
    public boolean equals(Object obj){//instanceof 객체인지 아닌지 확인하는 함수
        if(!(obj instanceof Member))return false;

        //obj instanceof Member:true
        return ((Member)obj).name.equals(name)&&((Member)obj).age==age;

    }
    @Override
    public int hashCode() {
        return name.hashCode()+age;
    }

}