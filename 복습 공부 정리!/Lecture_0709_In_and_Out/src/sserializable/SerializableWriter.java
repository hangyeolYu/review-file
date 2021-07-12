package sserializable;

import java.io.*;


public class SerializableWriter {
    public static void main(String[] args) throws IOException, ClassNotFoundException {

        FileOutputStream fos =new FileOutputStream("/Users/yuhangyeol/Desktop/공업용//arr.dat");
        ObjectOutputStream oos =  new ObjectOutputStream(fos);
        Student s = new Student();
        s.id = "1";
        s.name = "홍길동";
        Student.pass = "1234"; //static 직렬화 포함 X
        oos.writeObject(s);
        oos.flush();
        fos.flush();
        oos.close();
        fos.close();

        FileInputStream fis =new FileInputStream("/Users/yuhangyeol/Desktop/공업용//arr.dat");
        ObjectInputStream ois =  new ObjectInputStream(fis);

        Student p = (Student) ois.readObject();
        System.out.println(p.id);
        System.out.println(p.name);
        System.out.println(Student.pass);



    }
}
