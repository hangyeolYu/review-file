package array_list;


import java.util.ArrayList;//이차원배열같이 ArrayList<ArrayList> list 사용을함!

public class arrayListExample {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<String>();//() 안에 지정을 해도되고 안해도 늘어남!

        System.out.println("객체 수  : "+list.size());
        System.out.println();

        list.add("JAVA");//스트링 객체 저장 (맨마지막에 )
        list.add("ArrayList");
        list.add("Hello");//얘는 3으로 밀려남
        list.add(2,"Collection"); //해당 인덱스에 객체 저장
        list.add("list");

        //list에 들어가있는 객체 출력 함수
        //print1(ArrayList<String>li),print2(ArrayList<String>li)
        //print1:for문 (li.get(i))
        //print2: for -each구문

        print1(list);
        print2(list);
        System.out.println("객체 수  : "+list.size());
        System.out.println();

        list.remove(2);
        print2(list);
        System.out.println();

        System.out.println(list.get(2));
        System.out.println();

        list.remove("list");
        print1(list);
        System.out.println();

        String [] arr = new String[10];
        arr[0] = "JAVA";
        arr[1] = "ArrayList";
        arr[2] = "Hello";
        arr[2] = "Collection";
        arr[3] = "List";

        print3(arr);
        System.out.println();



        // add(String value, String[])
        // : 맨 끝에 추가
        // add(int index, String value, String[])
        // : index에 주어진 객체 추가
        // set(int index, String value, String[])
        // : index 위치의 객체 수정
        // remove(int index, String[])
        // : index 위치의 객체 삭제
        // remove(String value, String[])
        // : 주어진 객체 삭제
        // get(int index, String[])
        // : index 위치의 객체 반환




    }
    // 차이점?!!?(다형성,polymorphism) import 확인하자
    //list<String> 인터페이스를 가져옴
    //ArrayList<String> ////class ArrayList implements List;

    public static void print1(ArrayList<String> list){//static 에서 호출하면 무조건 static 에서 가져와야함
        for(int i =0; i<list.size();i++){
            System.out.println(i+" : "+list.get(i));
        }

    }
    public static void print2(ArrayList<String>list){//class ArrayList implements List;

        for(String str:list){
            System.out.println(str);

        }
    }
    public static void print3(String [] arr){
        for (String str:arr) {
            System.out.println(str);
        }
    }
}
