package console_test;

import java.io.*;
public class ConsoleExample {
    public static void main(String[] args) {

        Console console = System.console();
        System.out.println("아이디 : ");
        String id = console.readLine();
        //콘솔출력

        System.out.println("패스워드 : ");
        char [] charPass = console.readPassword();
        //콘솔출력 X

        //char [] -> String
        String strPass = new String(charPass);

        System.out.println(id);
        System.out.println(strPass);
    }
}
