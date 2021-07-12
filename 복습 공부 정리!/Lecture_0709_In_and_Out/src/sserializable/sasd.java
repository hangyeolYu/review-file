package sserializable;

import java.io.FileInputStream;

import java.io.IOException;
import java.io.ObjectInputStream;

public class sasd {
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        FileInputStream fis =new FileInputStream("/Users/yuhangyeol/Desktop/공업용//arr.dat");
        ObjectInputStream ois =  new ObjectInputStream(fis);

        Student p = (Student) ois.readObject();
        System.out.println(p.id);
        System.out.println(p.name);
        System.out.println(Student.pass);
    }
}
