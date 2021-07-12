package hello_server;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

//localhost 5001 포트로 연결 요청!
//connect() 정상 리턴시 -> 연결 성공

public class ClientExample {
    public static void main(String[] args)  {
        Socket socket = null; //지금 안염!

        try {
            socket = new Socket(); //열고! 오류가 생겨도 계속 열려있으므로
            System.out.println("[연결 요쳥!]");
            socket.connect(new InetSocketAddress("localhost", 5008));
            System.out.println("[연결 수락]");
            //메세지 보냄 (클라이언트 -> 서버)
            OutputStream os = socket.getOutputStream();
           String msg = "Hello Server~!";
           byte [] bytes = msg.getBytes(StandardCharsets.UTF_8);
           os.write(bytes);
           os.flush();
           //os.close(); 여기서 닫아버리면 다음 데이터를 받기전에 닫침!
           System.out.println("[데이터 보내기 성공]");

            InputStream is = socket.getInputStream();
            bytes = new byte[100];
            int readByte = is.read(bytes);
            msg = new String(bytes,0,readByte,"UTF-8");
            System.out.println("[데이터 받기 성공!~]"+ msg);
            is.close();



        }catch (Exception e){
            e.printStackTrace();//무슨 오류인지 출력!혹은
            System.out.println(e.getMessage());
        }
        //메세지 보냄 (내가 틀린거 ㅋ)
//        String data = "Hello Server";
//        try {
//            byte[] byteArr = data.getBytes("UTF-8");
//            OutputStream outputStream = socket.getOutputStream();
//            outputStream.write(byteArr);
//            outputStream.flush();
//            outputStream.close();
//        }catch (Exception e){
//            e.printStackTrace();
//        }


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
