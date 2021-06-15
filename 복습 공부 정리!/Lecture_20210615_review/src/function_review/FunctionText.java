package function_review;
import java.util.Scanner;
public class FunctionText {
    static int res2; //클래스에 데이터를 저장
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
    *1) 가독성 높음 (함수이름을 잘써야함: )ㅋㅋ ㄹㅇ
    *
    *   -가독성 좋게 이름 작성하는 법 :
    *   1)소문자로 시작해 중간에 복합어가 나오는 경우에 대문자로 해주면 됨 (카멜 표기법) 낙타 등모양
    *   ex) printMenu();
    *   2)동사부터 작성 (selectNumber(),chooseNum(),addTwoNum())
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

        int res1 = add(x,y);// (1)이 함수를 호출해서

                               //(3) 그리고 반환한걸 res1 에 대입하라

        add2(x,y);

        System.out.println(res1);//반환형 함수 호출을 완료한  메인 함수안의 res1 을 호출
        System.out.println(res2);//반환형이 없는 호출을 완료한 메인 클래스 안의 res2 를 호출
    }
    //반환형이 있는경우 데이터를 가지고 이동함!
    public static int add (int a,int b){ //(2) 인트형으로 반환해라
                  //반환형 // 함수이름
       return  a + b;
    }
    //반환형이 없는경우 (void) 데이터를 가지고 가지않고 여길 거쳐서 스태틱에 변수에 던짐
    public static void add2(int a,int b){
      res2 =a+b;       // 대입하고  a ,b 는 소멸
    }
}
