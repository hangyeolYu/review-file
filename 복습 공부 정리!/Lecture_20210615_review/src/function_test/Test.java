package function_test;
import java.util.Arrays;
import java.util.Scanner;
public class Test {

   static double box = 0.0;//1

    static  int [] arr1= {0,0};
   //static  int[]arr2={0,0};//2// 반환형으로 수정, int temp 사용해서 스왑 main 에서 가져와서 출력 sprit
    //return 형 이 하나밖에 없어서 배열을 사용한다 


    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        while(true) {

            chooseMenuPrint();
            int a = sc.nextInt();
            if(a==5)break;


            else if (a == 1) {
                //1.사용자에게 5개의 점수를 입력받아 평균을 구하는 함수
                //double average (매개 변수)
                //매개변수: main에서 입력받음 (배열)

                System.out.println("점수를 입력해주세요! ");

                for (int i = 0; i < 5; i++) {
                    average(new double[]{sc.nextDouble()});
                }
                System.out.printf("평균 점수는   : %-2f 점 입니다 \n", box / 5);

                continue;
            }
           else if (a == 2) {
                //2. 입력받은 두수(정수를) swap 하는 함수

                int num1, num2;

                System.out.println("a 번째 수와 b 번째 수를 각각 입력해주새요!");
                arr1[0] = sc.nextInt();
                arr1[1] = sc.nextInt();
                System.out.printf("변경 전 a  : %d ,  b   : %d\n", arr1[0], arr1[1]);
                swap(arr1.length);
                System.out.printf("변경 후 a  : %d ,  b   : %d\n", arr1[0], arr1[1]);

                continue;
            }
            else if (a == 3) {
                //3.사용자에게 입력받는 5개의 수 (정수)를 정렬하는 함수
                //bubble sort (과제)
                int arr3[];
                arr3 = new int[5];

                int inset1;
                System.out.println("5개의 숫자를 입력해주세요!");
                for (int i = 0; i < 5; i++) {
                    arr3[i] = sc.nextInt();
                }
                    bubbleSort(arr3);

                System.out.println("정렬후 !");
                System.out.println(Arrays.toString(arr3));
                continue;
            }
           else if(a==4){
               //4.주어진 {10,20,30,40,50} 정수중 사용자에게 입력받은 수의 인덱스를 반환하는 함수
                //없다면 -1 을 반환
                System.out.println("다음 함수 {10,20,30,40,50}중,");
                System.out.println("원하는 수를 입력해주세요! 인덱스를 반환합니다");
                System.out.println("있는 수가 아닐시 , -1이  나옵니다");
                int choose = sc.nextInt();
                int res1 = seach(choose);//int 반환형
                //seach(choose);//void 형
                System.out.println(res1);
                //System.out.println(choose > -1?choose:-1);

                continue;
            }

        }
    }

    public static void chooseMenuPrint(){
        System.out.println("===================");
        System.out.println("문제를 골라주세요!");
        System.out.println("1.  2.  3.  4.  ");
        System.out.println("끝내고 싶다면 5번  ");
        System.out.println("===================");

    }

    public static double average(double...arr){//1
        for(double i:arr){
               box += i;
         }
        return box;
        }
    public static void  swap(int ... ßarr1){//2
         int temp;
                  temp =arr1[0];
                   arr1[0]=arr1[1];
                   arr1[1] = temp;



        }
    // 반환값을 String 으로 해서 해보고 싶었으나 실패,그냥 void 로 해서 스태틱에 배열 생성후 넣고 메인에서 출력
    // return String.format("swap한 a 는 %s ,swap한 b 는 %s입니다!",
    //       String.valueOf(arr1[1]),String.valueOf(arr1[0]));

        public static void bubbleSort (int...arr3){//3
        int i,j,temp;
            for (i = 0; i < 5; i++) {
                 for ( j = 0; j < 5-(i+1); j++) {
                     if (arr3[j] > arr3[j+1]) {
                        temp = arr3[j+1];
                        arr3[j+1] = arr3[j];
                        arr3[j] = temp;
                         }
                     }
                 }

            //return Arrays.toString(arr3);
        }



    public static  int seach (int a){

        int arr4[] = {10,20,30,40,50};
        for(int i = 0;i <arr4.length;i++){

            if(arr4[i]==a){

                return i;
            }
        }
        return -1;
    }
}
