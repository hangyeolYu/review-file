package inet_address;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class InetAddressExample {
    public static void main(String[] args)  {

        //로컬 컴퓨터의 InetAddress 얻기
        //예외 (UnknowHost Exception) 처리해야함
        try {
            InetAddress local
                    = InetAddress.getLocalHost(); //나의 아이피 주소 불러오기
            System.out.println("IP주소 : " + local.getHostAddress());

            //InetAddress 도메인의 IP 주소
            InetAddress [] arr = InetAddress.getAllByName("www.naver.com");
            for(InetAddress i : arr){
                System.out.println("IP 주소" + i.getHostAddress());
            }

        }catch (UnknownHostException e){
            e.printStackTrace();// 예외 메세지 출력 하기
        }



    }
}
