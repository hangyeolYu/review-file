package server_client_test;



import java.io.IOException;
import java.net.*;

//localhost 5001 포트로 연결 요청!
//connect() 정상 리턴시 -> 연결 성공

public class ClientExample {
    public static void main(String[] args)  {
        Socket socket = null; //지금 안염!

        try {
            socket = new Socket(); //열고! 오류가 생겨도 계속 열려있으므로
            System.out.println("[연결 요쳥!]");
            socket.connect(new InetSocketAddress("localhost", 5008));
        }catch (Exception e){
            e.printStackTrace();//무슨 오류인지 출력!혹은
            System.out.println(e.getMessage());
        }
        //현재 연결되어았으면
        if(!socket.isClosed()){
            try {
                socket.close();//연결끊기
            }catch (IOException e){
                e.printStackTrace();
            }

        }
    }
}
