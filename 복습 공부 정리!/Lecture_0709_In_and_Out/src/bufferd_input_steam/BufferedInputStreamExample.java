package bufferd_input_steam;

import java.io.*;

public class BufferedInputStreamExample { //버퍼 스트림을 활용한 데이터 복사
    public static void main(String[] args) throws IOException {
        FileInputStream fis = new FileInputStream("/Users/yuhangyeol/Desktop/은밀한 PDF,IMG모음/KakaoTalk_Photo_2021-07-05-16-27-08.jpeg");

        BufferedInputStream bis
                = new BufferedInputStream(fis);

        FileOutputStream fos = new FileOutputStream("/Users/yuhangyeol/Desktop/은밀한 PDF,IMG모음/KakaoTalk2_Photo_2021-07-05-16-27-08.jpeg");

        BufferedOutputStream bos
                = new BufferedOutputStream(fos);

        int data;
        while((data = bis.read()) != -1){
            bos.write(data);
        }
        bos.flush(); //데이터가 들어가 잇음!
        fos.flush();
        bos.close();
        fos.close();
        fis.close();
        bis.close();
    }
}
