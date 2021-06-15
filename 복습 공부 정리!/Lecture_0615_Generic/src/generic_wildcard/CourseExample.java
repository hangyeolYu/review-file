package generic_wildcard;

import java.util.Arrays;

public class CourseExample {
    public static void main(String[] args) {

        Course <Person> personCourse
                = new Course<>("일반인 과정(국어)",5);

        personCourse.add(new Person("일반인!"));
        personCourse.add(new Worker("직장인"));
        personCourse.add(new Student("학식맨!"));
        personCourse.add(new HighStudent("고딩!"));
        //Person 은 부모 클래스 이기 때문에
        //Worker,Student,HighStudent (자식 클래스의) 객체를 담을 수 있음!

//        Person p = new Worker();//부모 변숭지만 실제로 자식을 담을수 있다~!
//        Person p1 = new Student();//다형성

        // 직장인 과정(5명), 학생과정(5) , 고등학생 과정(5)!

        Course<Worker> workerCourse
                = new Course<>("직장인 과정",5);
        workerCourse.add(new Worker("직장인"));

        Course<Student> studentCourse
                = new Course<>("학생 과정",5);
        studentCourse.add(new Student("학생"));
        studentCourse.add(new HighStudent("고등학생"));

        Course<HighStudent> highStudentCourse
                = new Course<>("고딩 과정 ",5);
        highStudentCourse.add(new HighStudent("고등학생"));

        //모든 과정 등록 가능
        registerCourse(personCourse);
        registerCourse(studentCourse);
        registerCourse(workerCourse);
        registerCourse(highStudentCourse);


        //학생 (고등학생)과정만 등록 가능
        registerCourseStudent(highStudentCourse);
        registerCourseStudent(studentCourse);

        //직장인 과정만 등록이 가능
        registerCourseWorker(workerCourse);

        //고등학생 과정만 등록이 가능한
        registerCourseHighStudent(highStudentCourse);

        //만약 일반인 과정과 직장인 과정만 등록이 가능한
        //registerCourseWorker2 함수를 정의하려면?

        registerCourseWorker2(personCourse);
        registerCourseWorker2(workerCourse);


    }

    public static void registerCourse
            (Course<?>  course){
        System.out.println(course.getCourseName()
        +"수강생  : "+
                Arrays.toString(course.getStudents()));
    }

    public static void registerCourseStudent
            (Course<? extends Student> course){
        System.out.println(course.getCourseName()
                +"수강생  : "+
                Arrays.toString(course.getStudents()));
    }

    public static void registerCourseWorker
            (Course<? extends Worker> course){
        System.out.println(course.getCourseName()
                +"수강생  : "+
                Arrays.toString(course.getStudents()));
    }
    public static void registerCourseHighStudent
            (Course<? extends HighStudent> course){
        System.out.println(course.getCourseName()
                +"수강생  : "+
                Arrays.toString(course.getStudents()));
    }
    public static void registerCourseWorker2
            (Course<? super Worker > course){
        System.out.println(course.getCourseName()
        +" 수강생  :" +
                Arrays.toString(course.getStudents()));
    }
}
