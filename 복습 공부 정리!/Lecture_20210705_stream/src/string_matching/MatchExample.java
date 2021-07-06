package string_matching;

import java.util.Arrays;

public class MatchExample {
    public static void main(String[] args) {
        int [] intArr = {2,4,6,8,10};
        boolean res =
                Arrays.stream(intArr).allMatch(a -> a%2==0 );
        System.out.println(res);

        //1. 하나라도 홀 수 가 있는지 확인(anyMatch())
        res =
                Arrays.stream(intArr).anyMatch(a -> a%2 !=0);
        System.out.println(res);

        //2. 모두 20의 배수가 없는지 확인(noneMatch())
        res =
                Arrays.stream(intArr).noneMatch(a -> a%20 ==0);
        System.out.println(res);




    }
}
