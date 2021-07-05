package hash_table;


import java.awt.*;
import java.util.Hashtable;
import java.util.Map;
import java.util.Scanner;

public class HashTableExample {
    public static void main(String[] args) throws InterruptedException {
        Map<String,String> map =new Hashtable<String,String>();

        //키에는 아이디 저장
        //값(value)에는 비밀번호 저장
        map.put("abcd","1234");//지워지고
        map.put("abcd","1234");//덮어씀

        map.put("eunbin544","1111");
        map.put("qwertyuiop","22222");

        Scanner sc= new Scanner(System.in);
        int count = 0;
        while(true){

            System.out.println();
            System.out.println();
            System.out.println("[로그인 페이지]");
            System.out.println("아이디 : ");
            String id = sc.next();

            System.out.println("비밀번호 : ");
            String pass = sc.next();

//------------------------내가 한 풀이 -----------------------------

            //1.아이디가 존재하는지 확인(?)
            boolean check= map.containsKey(id);
            boolean cheakPass = map.containsValue(pass);

            if(check){
                System.out.println("사용중인 아이디 입니다!");
                if(cheakPass){
                    System.out.println("로그인 성공!");
                    break;

                }
                else{
                    count++;
                    if(count==5){
                        Toolkit toolkit = Toolkit.getDefaultToolkit();
                        //static 메소드 
                        System.out.println("잠금.");
                        for(int i =10; i> 0;i--){
                            toolkit.beep();
                            System.out.println(i+" 초 후에 잠금해제!");
                            Thread.sleep(1000);
                        }
                        count =0;

                    }
                    else {
                        System.out.println("비밀번호는 틀렸지요~");
                        Toolkit toolkit = Toolkit.getDefaultToolkit();
                        toolkit.beep();
                        System.out.println("5회이상 입력시 10초간 잠깁니다");

                        System.out.println("현재 " + count + "회 오류 입니다");

                        continue;
                    }
                }
            }
            else {
                System.out.println("등록된 아이디가 아닙니다!");
                continue;
            }
            //2.아이디가 존재한다면 비밀번호를 비교 (?)
            //3.로그인 성공

            //1.비밀번호 불일치
            //2.아이디 자체가 존재하지 않을경우
        }
        System.out.println("[홈페이지]");

//--------------------------------------------------------


    }
}
