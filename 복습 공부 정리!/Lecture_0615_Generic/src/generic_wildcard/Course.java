package generic_wildcard;

public class Course<T>{
    /*
    * 대학 과목명 (String )
    * 수강생 (Person,Worker,Student,HighStudent)
    *
    * */

    String courseName;
    T [] students;//수강생들

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public T[] getStudents() {
        return students;
    }

    public void setStudents(T[] students) {
        this.students = students;
    }

    public Course (String name , int capacity){
        this.courseName = name;
        //students = new T[capacity]; 이게 아님 ㅋ //(X)
        //why?
        //T 형의 크기가 뭔지 아직모름!
        // Student , String name , int age ;// 데이터 형에 따라서 도대체 뭐가 들어올지 모르는 상태,
        // 뭐가 올지 모르니 일단 Object 로 지정해서 (제일큼 ㅋ ) 크게 해놈
        //그리고 나중에 형변환을 함!
        students =(T[]) (new Object[capacity]);
        //타입 파라미터 배열생성 :
        //오브젝트 클래스의 배열로 만든 후에
        //타입 파라미터로 형 변환을 해줘야함!
    }
    //T 형 객체를 넣는 메소드 add
    //배열이 비어있는 부분을 찾아서 수강색 객체를 넣음!

    public void add (T t) {
        for(int i = 0; i < students.length;i++){
            if(students[i] == null) {
                students[i] = t;
                break;
            }
            //[수강생1 , 수강생 2, null, null, null]
            //break 를 안하면 ...
            //[수강생 1, 수강생 2, 수강생 3,수강생 3, 수강생 3]
            //break를 하면
            //[수강생1, 수강생 2, 수강생 3, null,null]
        }
    }

}
