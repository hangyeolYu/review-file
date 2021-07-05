package ArraylisttoString;

import java.util.List;
import java.util.ArrayList;
import java.util.Vector;
public class main {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        System.out.println("========== [ArrayList] ==========");
        List<String> list = new ArrayList<String>();
        System.out.println("총 객체수 : "+ list.size());
        System.out.println();


        list.add("Java"); // String 객체 저장
        list.add("Hello");
        list.add("ArrayList");
        list.add(2, "Collection");
        list.add("List");
        print2(list);

        // 저장된 총 객체 수 얻기
        System.out.println("총 객체수 : "+ list.size());
        System.out.println();

        String str = list.get(2); // 2번 인덱스 객체 얻기
        System.out.println("2 : " + str);
        System.out.println();


        print1(list);

        list.remove(2); // 2번 인덱스 객체 (Collection) 삭제
        print1(list);


        list.remove(2); // 2번 인덱스 객체 (ArrayList) 삭제
        print1(list);

        list.remove("List");
        print1(list);

        System.out.println("========== [일반 배열] ==========");

        final int ARRSIZE = 100;
        String[] arr = new String[ARRSIZE];

        add(arr, "Java"); // String 객체 저장
        add(arr, "Hello");
        add(arr, "ArrayList");
        print(arr);


        add(arr, 2, "Collection");
        print(arr);

        add(arr, 0, "Collection2");
        print(arr);


        add(arr, "List");
        print(arr);

        remove(arr, 2); // 2번 인덱스 객체 (Collection) 삭제
        print(arr);


        remove(arr, 2); // 2번 인덱스 객체 (ArrayList) 삭제
        print(arr);

        remove(arr, "List");
        print(arr);
    }



    public static void print(String[] arr) {
        for(int i = 0 ; i < size(arr); i ++) {
            System.out.println(i + " : " + arr[i]);
        }
        System.out.println();
    }
    public static void remove(String[] arr, String value) {

        for(int i = 0; i < size(arr); i ++) {
            if(arr[i].equals(value)) {
                remove(arr, i);
                break;
            }
        }
    }

    // 10 20 30 40 50
    public static void remove(String[] arr, int index) {
        for(int i = index; i < size(arr); i ++) {
            arr[i] = arr[i + 1];
        }
        arr[size(arr)] = null;
    }

    public static String get(String[] arr, int index) {
        return arr[index];
    }


    public static void set(String[] arr, int index, String value) {
        arr[index] = value;
    }

    // 0  1  2  3  4
    // 10 20 30 40 50
    public static void add(String[] arr, int index, String value) {
        for(int i = size(arr) - 1; i >= index; i --) {
            arr[i + 1] = arr[i];
        }
        arr[index] = value;
    }

    public static void add(String[] arr, String value) {
        arr[size(arr)] = value;
    }
    public static int size(String[] arr) {
        int cnt = 0;
        for(int i= 0; i < arr.length; i ++) {
            if(arr[i] != null) cnt ++;
            else break;
        }
        return cnt;
    }

    public static boolean isEmpty(String [] arr) {
        for(int i = 0; i < size(arr); i++) {
            if(arr[i] != null) return false;
        }
        return true;
    }

    public static void print1(List<String> list) {
        // 저장된 총 객체 수만큼 for문
        for(int i = 0; i < list.size(); i ++) {
            String temp = list.get(i);
            System.out.println(i + " : " + temp);
        }
        System.out.println();
    }

    public static void print2(List<String> list) {
        // for-each 구문
        for(String li : list) {
            System.out.println(li);
        }
        System.out.println();
    }

}