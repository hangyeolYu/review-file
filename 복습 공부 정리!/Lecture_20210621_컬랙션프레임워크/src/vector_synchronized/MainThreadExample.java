package vector_synchronized;

public class MainThreadExample {
    public static void main(String[] args) {
    MyVectorList<String> list1 = new MyVectorList<>();
    //Vector: 모든 함수들이 synchronized 동기화 되어있음
    MyArrayList<String> list2 = new MyArrayList<>();
    //일반 함수

        //4가지중 메인함수에서는 4가지
        //1. Thread 를 익명 객체로 만드는 방법
        //2.Runnable 을 익명객체로 만들어서 매개값으로 전달하는 방법
        //3. 람다식  (Runnable)
        //4. 람다식  (Thread)

        //1.번 방법
       Thread th1 = new Thread() {
            public void run(){
            list1.add("th1");
                System.out.println();
            }
        };

       //2.
        Thread th2 = new Thread(new Runnable() {
            @Override
            public void run() {
                list1.add("th2");
                System.out.println();
            }
        }) ;

        //4.
        Thread th3 = new Thread(() -> {
            //public void run() 안써도 되는 이유는 ?
            //Runnable 인터페이스가 가 함수적 인터페이스이기 때문
            list2.add("thr3");
            System.out.println();
        });

        //3.
        Runnable runnable = () -> {
            //public void run() 안써도 되는 이유는 ?
            //Runnable 인터페이스가 가 함수적 인터페이스이기 때문
            list2.add("thr4");
            System.out.println();
        };
        Thread th4 = new Thread(runnable) {};



        th1.start();//Vector 는 동기화 성질을 띄어서 끝날때까지
        th2.start();//요놈이 안들어옴
        th3.start();
        th4.start();
    }
}
