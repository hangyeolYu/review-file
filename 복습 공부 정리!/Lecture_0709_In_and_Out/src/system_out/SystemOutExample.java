package system_out;

import java.io.*;
import java.nio.charset.StandardCharsets;

public class SystemOutExample {
    public static void main(String[] args) throws Exception{


        OutputStream os = System.out;
        String hangul = "가나다라";
        byte [] hByte = hangul.getBytes(StandardCharsets.UTF_8);
        os.write(hByte);
        os.flush();
        os.close();




    }
}
