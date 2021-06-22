package arr;

import java.io.*;
import java.util.Arrays;

public class Example {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
       int [] arr = new int [5];
       int [] arr2 =new int [5];
       double j = 0;
        System.out.println("1.  5명의 성적을 입력해주세요!");

        for(int i = 0; i < arr.length;i++){
            arr[i] = Integer.parseInt(br.readLine());
        }
        System.out.println("1. 성적의 평균은");
        for(int i = 0 ; i<arr.length;i++){
            j += arr[i];
        }
        System.out.println(j/5);

        System.out.println("2.성적의 최댓값과 최솟값은? ");
        Arrays.sort(arr);//오름차순 정렬
        System.out.printf("최댓값은   :%d\n 최소값은  : %d\n",arr[4],arr[0]);

        System.out.println("3.성적중 top 3점수는?");
        System.out.printf("1.등  : %d   2등  : %d  3등   : %d\n",arr[4],arr[3],arr[2]);

        System.out.println("4.다음 학생들의 점수의 학점은?");
        for(int i = 0; i <arr.length; i++){ //for 문으로 돌리면서 char[] gpa = new char[arr.lengh];
            if(arr[i]>=90){                 // gpa[i] = 'A'....'F'넣어서 출력하자
                System.out.println(arr[i]+"의 학점은 "+" "+"A");
                arr2[0] += 1;
            }
            else if(arr[i]>=80&&arr[i]<90){
                System.out.println(arr[i]+"의 학점은 "+" "+"B");
                arr2[1] += 1;
            }
            else if(arr[i]>=70&&arr[i]<80){
                System.out.println(arr[i]+"의 학점은 "+" "+"C");
                arr2[2] += 1;
            }
            else if(arr[i]>=60&&arr[i]<70){
                System.out.println(arr[i]+"의 학점은 "+" "+"D");
                arr2[3] += 1;
            }
            else {
                System.out.println(arr[i]+"의 학점은 "+" "+"F");
                arr2[4] += 1;
            }

        }
        System.out.println("5.학점을 받은 학생들의 수는?");
        System.out.println("A학점의 수  : "+arr2[0]);
        System.out.println("B학점의 수  :  "+arr2[1]);
        System.out.println("C학점의 수  :  "+arr2[2]);
        System.out.println("D학점의 수  :  "+arr2[3]);
        System.out.println("F학점의 수  :  "+arr2[4]);
    bw.flush();
    bw.close();
    }


}