package shape_line;

import java.util.Scanner;

public interface Graphic { //관계부터 보자 어디에서 어떻게 쓰이는지부터 풀자

    public default<T extends Shape, Line> void printOriginal(T c) {
        System.out.println("기준점은 : " +    c.getX() + ", " + c.getY());
    }

    public static <T extends Shape, Line> void printInfo(T c) {
        System.out.println(c.toString());
    }

    public default <T extends Shape, Line> void move(T c ) {
        Scanner sc = new Scanner(System.in);
        System.out.println("얼마나 이동할지 d1,d2 를 입력해주세요!");
        System.out.println("x+ d1식의  d1 =");
        int d1 = sc.nextInt();
        c.setX(c.getX() + d1);
        System.out.println("y+ d2식의  d2 =");
        int d2 = sc.nextInt();
        c.setY(c.getY() + d2);

        // set
        // x = 3, y = 5
        // (2, 2) => x = 2, y = 2

        // x = 3, y = 5
        // (2, 2) => x = 5, y = 7

    }


}
