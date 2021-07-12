package data_input_output_stream;

import java.io.*;// 입출력 담당 클래스 IO

public class DataStreamExample {
    public static void main(String[] args) throws IOException {
        FileOutputStream fos = new FileOutputStream("/Users/yuhangyeol/Desktop/공업용//test.dat");
            // 이진수 값만 저장하는 피일 확장자 (dat)
    DataOutputStream dos = new DataOutputStream(fos);

    dos.writeUTF("김자바");
    dos.writeDouble(90.1);
    dos.writeInt(1);

        dos.writeUTF("홍빈");
        dos.writeDouble(20.1);
        dos.writeInt(2);

        dos.flush(); //내부적인걸 먼저 보낸다(비운다)
        fos.flush();
        dos.close();//내부적인걸 먼저 닫는다
        fos.close();

        FileInputStream fis = new FileInputStream("/Users/yuhangyeol/Desktop/공업용//test.dat");
        DataInputStream dis = new DataInputStream(fis);

        for(int i =0; i< 2; i++) {
           String n =  dis.readUTF();
           double s=  dis.readDouble();
           int o = dis.readInt();

            System.out.println(n+ " : "+ s + " : "+ o);
        }
        dis.close();
        fis.close();

    }
}
