package system_in;

import java.io.*;

/*
 엔터 문자

 \n : 유닉스,리눅스
 \r: aor
 \r\n : 윈도우(\r : 캐리지 리턴, \n: 엔터 )

 \r : 커서를 가장 첫 위치로 보냄
 \n (new line):커서를 다음 라인으로 보냄ㅗㅁ

 */
public class SystemInExample {
    public static void main(String[] args) throws Exception{

        InputStream is = System.in;
        byte [] data = new byte[100];

        System.out.println("이름 : ");
        int nameBytes = is.read(data);

        String 이름 = new String (data,0,nameBytes-1);

        System.out.println("성별 : ");
        int genderBytes = is.read(data);

        String gender = new String (data,0,genderBytes-1);

        System.out.println("이름 : "+이름);
        System.out.println("성별 : "+gender);


    }
}
