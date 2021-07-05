package vector;

import java.util.Vector;

public class VectorExample {
    public static void main(String[] args) {
        Vector<Fruit> list =new Vector<>();

        list.add(new Fruit("사과",3000));
        list.add(new Fruit("복숭아",10000));
        list.add(new Fruit("토마토",3000));
        list.add(new Fruit("수박",15000));
        list.add(new Fruit("청포도",5000));

        //print 메소드

        print(list);
        System.out.println();
        print2(list);



        //list.remove("토마토"); 객체로 넣은게 아니라 안됨!
        list.remove(2);
        print(list);
        System.out.println();

        list.remove(0);
        print(list);
        System.out.println();

        list.add(0,new Fruit("멜론",8000));
        print(list);
        System.out.println();


    }
    public static void print(Vector<Fruit>list){
        for(int i = 0;i < list.size();i++){
            System.out.println(i+" :  "+list.get(i));
        }
    }
    public static void print2(Vector<Fruit>list) {
        for(Fruit str : list){
            System.out.println(str);
        }
    }
    }

