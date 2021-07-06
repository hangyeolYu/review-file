package stream_aggregate;

import java.util.Arrays;
import java.util.stream.IntStream;

public class AggregateExample {
    public static void main(String[] args) {

        int [] arr = {1,2,3,4,5};

       //1.2의 배수 개수(filter (),count())
       //long count()
        IntStream intStream = Arrays.stream(arr);
        long arg= intStream.filter(a -> a%2==0)
                .count();
        System.out.println("2의 배수는 : "+arg+" 개");
        System.out.println();

       //2. 홀수의 합 (filter() , sum())
       //long sum()
         intStream = Arrays.stream(arr);//요소를 던지므로 비워짐 고로 새로 만들어야함! 변수는 존재하지만 요소는 존재하지않음 텅 빈 껍데기 상태
        long sum = intStream
                .filter(a -> a%2!=0)
                .sum();
        System.out.println("홀수의 합은 : "+sum );
        System.out.println();

       //3. 홀수의 평균(filter () , average())
        // OptionalXXX average()
        //average ().getAsDouble()
        intStream = Arrays.stream(arr);
        double getAs = intStream
                .filter(a -> a%2!=0)
                .average()
                .getAsDouble();
        System.out.println("홀수의 평균은 : "+getAs);
        System.out.println();


       //4. 최댓값(max(),getAsInt())
        intStream = Arrays.stream(arr);
        int max = intStream
                .max()
                .getAsInt();
        System.out.println("최대값은 : "+max);

        System.out.println();
       //5.최솟값(min(),getAsInt())
        intStream = Arrays.stream(arr);
        int min = intStream
                .min()
                .getAsInt();
        System.out.println("최소값은 : "+min);
        System.out.println();

        //6.첫번째 짝수(filter(),findFirst(),getAsInt())
        intStream = Arrays.stream(arr);
        int firstInt = intStream
                .filter(a->a%2==0)
                .findFirst()
                .getAsInt();
        System.out.println("첫번째 짝수는 : "+firstInt);

    }
}
