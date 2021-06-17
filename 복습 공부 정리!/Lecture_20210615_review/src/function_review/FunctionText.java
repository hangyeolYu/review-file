package function_review;
import java.util.Scanner;
public class FunctionText <T> {
    static int res2; //클래스에 데이터를 저장


    //객체 지향의 3대 특징
    //1.캡슐화(정보은닉)
   // (public,protected,private)
    //모두다, 상속 관계만,클래스 내에서만
    //외부에서 접근할떈 getter setter 를 사용햇따 !
    //2.상속 (부모~ 자식) extends~ super
    //3.다형성(데이터 타입 (형)을 다양하게 하는 타입)<>제너릭도 포함!


   // statc :클래스생성이 될때 같이 생성되는 고정 값(데이터)
    // 정적 : 한번만 생성
    //동적 : 변할수 있다! 

    //자체 필드를 가질수 있음

    //자체 함수를 가질 수 있음

    /*함수 정의법
    *
    *반환형 메소드 이름 (매개 변수){
    * //메소드 코드
    * }
    *   함수를 쓰면 좋은점?
    *1) 가독성 높음 (함수이름을 잘써야함: ,기능별로)ㅋㅋ ㄹㅇ
    *
    *   메인함수에 10줄 20줄 쓸때 그냥 밑에서 함수 만들어서
    * 함수이름 잘줘서 올려놓으면 보기편함 ㅋㅋㅋ
    *
    *   -가독성 좋게 이름 작성하는 법 :
    *   1)소문자로 시작해 중간에 복합어가 나오는 경우에 대문자로 해주면 됨 (카멜 표기법) 낙타 등모양
    *   ex) printMenu();
    *   2)동사부터 작성 (selectNumber(),chooseNum(),addTwoNum())
    *   카멜 표기법 ㅋㅋ abcdEfgHijkLmn..
    *
    * 2) 중복을 피함 !!!!!!!
    *
    *  */

    public static void main(String[] args) {//예도 마찬가지임!
     int x, y ;
        Scanner sc = new Scanner(System.in);

        System.out.println("x를 입력 :");
        x = sc.nextInt();
        System.out.println("y를 입력  :");
        y = sc.nextInt();

        //두수를 더하는 함수

        int res1 = add(x,y);// (1)이 함수를 호출해서          //(3) 그리고 반환한걸 res1 에 대입하라
        System.out.println(add(res1,3));
        //반환형은 재사용 가능!


        add2(x,y);
        //반환형이 없는  void는 재사용 불과!

        //새로운것  0616

        double z = 3.5;
        double h = 4.5;

        Double res3 = add(z,h) ;


        System.out.println(res1);//반환형 함수 호출을 완료한  메인 함수안의 res1 을 호출
        System.out.println(res2);//반환형이 없는 호출을 완료한 메인 클래스 안의 res2 를 호출
        System.out.println(res3);



        //데이터를 바로 초기화 하는 경우
        int []arr = {1};
        print(arr);

        //배열의 공간을 먼저 할당한 후에 나중에 데이터를 초기화 하는 경우
        int[]arr2 = new int[3];
        arr2[0] =1;
        arr2[1] = 2;
        arr2[2] = 3;
        print(arr2);

        //배열의 데이터 없이 바로 초기화 하는 경우 = 배열의 내용과 크기를 지정
        print(new int[]{1});
        print(new int [] {1,2,3});
        //print(new int [3]);// 공간만 할당하고 데이터 값은 0,0,0
        print();
        print(1);
        print(1,2,3);
        print(1,2,3,4,5,6);
        print(new int []{1,2,3,4,5,6,7,8,9});




    }
    //반환형이 있는경우 데이터를 가지고 이동함!

    /*
    * 함수 중복 정의(overload) vs 함수 재정의 (Override)
    *
    * 중복 정의 조건
    * 1) 함수 이름 동일
    * 2) 매개변수 타입||개수 ||순서가 다를때 오버 로드
    * 3) 반환형은 영향을 미치지 않음 (상관없음 )ex) 반환이 int 이던,double 이던 등등..
    *
    * 함수 재정의 (Override)
    * :상속 관계(**)에서 부모가 가지고 있는 함수를 자식이 재정의
    * :Object - toString (조상)
    * :Customer - toString (재정의!)
    *
    * why? toString 왜 재정의 해줘야 할까요?
    *>> 참조형 (배열,String Class,)우리가 만든 클래스(**)도 참조형!
    * :데이터가 저장된 주소값
    * >>기초형 (int,double,float,char,boolean)
    *
    * sout() 사실 요것도 sout 함수에서 호출되는 toString 함수임요!
    * */

    public static int add (int a,int b){ //(2) 인트형으로 반환해라
                  //반환형 // 함수이름
       return  a + b;
    }
    //반환형이 없는경우 (void) 데이터를 가지고 가지않고 여길 거쳐서 스태틱에 변수에 던짐
    public static void add2(int a,int b){
      res2 =a+b;       // 대입하고  a ,b 는 소멸
    }
     //타입이 다른경우
    public static double add(double z,double h) {
        return z+h;
    }
    //add 함수의 매개변수를 제너릭형으로 바꾸기(타입 파라미터 )
    //타입 파라미터 반환형 함수이름 (매개변수)
    //number: Integer,Float,Double,Byte,Short,Long....
    //a:3,b:4 ==>7.0

    /*
    * 가변 매개변수(매개변수가 여러개가 올수 있음을 생각하고 있음)
    * print(3),print(3,5),print(3,5,3)...
    *
    * */

//    public static void print(int[] arr){
//
//        //for-each 문 (향상된 for)
//        //배열안은 정해져 있고 배열을 출력할때 씀
//        //배열의 사이즈(arr) 만큼 각 배열의 원소를 i 에 대입해서 출력한다
//        for (int i:arr) {
//            System.out.println(i);
//        }
//    }

    public static void print(int...a){ // 위에 arr [] 배열식이랑  같은 함수
        for(int i :a){
            System.out.println(i);
        }
    }


    public static <T extends Number> double add(T c, T d){//----이거랑
        double x = c.doubleValue();//(double)c;
        double y = d.doubleValue();//(double)d;
        return x+y;
    }
    public static <T extends Number> void add(T c, T d,T e) {// 변수가 같으면 아예 같은 함수로 생각해버린다 !
        double x = c.doubleValue();//(double)c;
        double y = d.doubleValue();//(double)d;
        double z = (double) e;
        System.out.println(x + y + z);
    }
    //갯수가 다른경우
    public static int add(int a,int b,int c){
        return a+b+c;
    }

    //순서가 다를경우
    public static double add(int a, double b) {// || (double a, int b)
        return a+b;
    }
}
