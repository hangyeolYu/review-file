package hello_server;




import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

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
            while (true){ //메세지 받기 여기서 받아야함!
                System.out.println("[연결 기달림]");
                Socket socket =
                serversocket.accept();//클라이언트 연결 수락

                InetSocketAddress isa
                = (InetSocketAddress) socket
                        .getRemoteSocketAddress();
                System.out.println("[연결 수락함]"
                        + isa.getHostName());

                InputStream is = socket.getInputStream();
                byte [] bytes = new byte[100];
                 int readBytes = is.read(bytes);
                 String msg = new String(bytes,0,readBytes,"UTF-8");
                System.out.println("[데이터 받기 성공~] "+ msg);
                //is.close(); 예도 보내고 기달리는 동안 소켓을 닫으면 오류가 남!

                //서버(OutputStream)-> 클라이언트(inputStream)
                OutputStream os = socket.getOutputStream();
                 msg = "Hello Client!";
                bytes = msg.getBytes(StandardCharsets.UTF_8);
                os.write(bytes);
                os.flush();
                os.close();
                System.out.println("[데이터 보내기 성꽁~!]");
                socket.close();



            }
        }catch (Exception e){
            e.printStackTrace();//무슨 오류인지 출력!혹은
            System.out.println(e.getMessage());
        }

        //메세지륿 받음 내가 틀린거 ㅋ
//        try {
//
//            InputStream inputStream
//                    =serversocket.get
//            byte[] byteArr = new byte[100];
//            int readCount = inputStream.read(byteArr);
//            String data = new String(byteArr, 0, readCount, "UTF-8")
//            inputStream.flush();
//            inputStream.close();
//        }catch (Exception e){
//            e.printStackTrace();
//        }





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
