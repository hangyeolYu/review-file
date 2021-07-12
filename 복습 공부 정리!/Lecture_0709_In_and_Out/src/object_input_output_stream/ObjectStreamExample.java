package object_input_output_stream;

import java.io.*;

public class ObjectStreamExample {
    public static void main(String[] args) throws IOException, ClassNotFoundException {

        FileOutputStream fos = new FileOutputStream("/Users/yuhangyeol/Desktop/공업용//testObject.dat");
        ObjectOutputStream oos = new ObjectOutputStream(fos);

        oos.writeObject(new String( "이클립"));
        oos.writeObject(new int[] {1,2,3});
        oos.writeObject(new Integer(10));//사용 권장 하지않음!
        oos.writeObject(new Double(10));//사용 권장 하지않음!
        oos.flush();
        fos.flush();
        oos.close();
        fos.close();

        //객체 Input
        FileInputStream fis = new FileInputStream("/Users/yuhangyeol/Desktop/공업용//testObject.dat");
        ObjectInputStream ois = new ObjectInputStream(fis);
        String s= (String)ois.readObject();
        int [] intArr = (int [])ois.readObject();
        Integer i = (Integer) ois.readObject();
        Double d = (Double) ois.readObject();

        System.out.println(s);
        System.out.println(intArr);
        // 배열이므로 포이치로 출력
        for(int ii : intArr){
            System.out.print(ii + " ");
        }
        System.out.println();

        System.out.println(i);
        System.out.println(d);


        ois.close();
        fis.close();



        //객체 Input

    }
}
