package server_client_test;


import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;

//localhost 5001 포트로 연결 요청!
//connect() 정상 리턴시 -> 연결 성공

public class ServerClientExample { //현재 내 아이피로 포트번호를 생성해 서버를 구축해
    //내 아이피에서 포트번호로 서버를 접속함 //내가 만든거에 내가 들어감  ㅋ.ㅋ
    public static void main(String[] args) throws IOException {
        ServerSocket serversocket = null;

        try {
          serversocket = new ServerSocket();
            System.out.println("[연결 요쳥!]");
            serversocket.bind(new InetSocketAddress("localhost", 5008));
            while (true){
                System.out.println("[연결 기달림]");
                Socket socket =
                serversocket.accept();

                InetSocketAddress isa
                = (InetSocketAddress) socket
                        .getRemoteSocketAddress();
                System.out.println("[연결 수락함]"
                        + isa.getHostName());

            }
        }catch (Exception e){
            e.printStackTrace();//무슨 오류인지 출력!혹은
            System.out.println(e.getMessage());
        }






        //현재 연결되어았으면(serverSocket이 닫혀 있지 않은 경우 )
        if(!serversocket.isClosed()){
            try {
                serversocket.close();//연결끊기
            }catch (IOException e){
                e.printStackTrace();
            }

        }
    }
}
