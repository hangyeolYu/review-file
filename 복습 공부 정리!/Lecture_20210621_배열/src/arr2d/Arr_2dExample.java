package arr2d;

import java.util.Scanner;

public class Arr_2dExample {
    public static void main(String[] args) {
        //1.
        Scanner sc = new Scanner(System.in);
        System.out.println("행 입력");
        int row = sc.nextInt();
        System.out.println("열 입력 :");
        int col = sc.nextInt();

//        System.out.println("[1차원 배열 출력]");
//        int [] arr_1d = new int [row * col];
//        int [] [] arr_2d = new int [row][col];
//
//        for(int i = 0;i < row * col;i++){
//            arr_1d[i] = i+1;
//        }
//        for(int i = 0;i <  arr_1d.length;i++){
//            System.out.printf("%2d ",arr_1d[i]);
//            if((i+1) % col == 0){
//                System.out.println(" ");
//            }
//            // 0  1  2  3  4
//            // 5  6  7  8  9
//            // 10 11 12 13 14
//        }
//
//        for(int i = 0;i < row;i++){
//            for(int j = 0;j < col;j++) {
//                arr_2d[i][j] = arr_1d[i*col+j];
//            }
//        }
//        System.out.println("[2차원 배열 출력]");
//        for(int i = 0;i < row;i++){
//            for(int j = 0;j < col;j++){
//                System.out.printf("%2d ",arr_2d[i][j]);
//
//            }
//            System.out.println(" ");
//
//            //i =0 ; col =5; 0+j (0~4)
//            //i =1 ; col =5; 5+j (5~9)
//            //i =2 ; col =5; 10+j (10~14)
//        }

        //2.

        int [] [] arr1 = new int[row][col];
        int [] [] arr2 = new int [row][col];

        //arr1 데이터 초기화
        //행의 길이
        for(int i = 0;i<arr1.length;i++){
            //열의 길이
            for(int j = 0; j < arr1[i].length;j++){
                arr1[i][j] = i+j;
            }

        }
        //arr2 데이터 초기화
        //행의 길이
        for(int i = 0;i<arr2.length;i++){
            //열의 길이
            for(int j = 0; j < arr2[i].length;j++){
                arr2[i][j] = i+j;
            }

        }
        //배열 비교
        System.out.println(arr1==arr2);
        //배열 이름끼리 비교 (주소값의 비교 )
        boolean hey = true;
        for(int i = 0;i<arr2.length;i++){
            if(hey == false)break;
            for(int j = 0; j < arr2[i].length;j++){
                if(arr2[i][j] != arr1[i][j]){
                    hey = false;
                    break;
                }
            }

        }
        System.out.println(hey==true?"두 배열의 내용물이 같습니다":"두 배열의 내용물이 다릅니다");



        //1.배열의 내용물끼리 비교
        // 두배열이 동일 한지 비교

        //2.두 배열의 덧셈 (addArray),뺄셈(SubArray)을 한 결과 저장

        //3.두 배열의 곱셈 (mulArray)한 결과 저장(**)ㅅ..

    }
}
