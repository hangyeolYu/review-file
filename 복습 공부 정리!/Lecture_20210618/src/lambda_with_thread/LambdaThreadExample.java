package lambda_with_thread;

public class LambdaThreadExample {
    public static void main(String[] args) {


        //Thread 생성방법
        //1.thread 클래스를 상속받은 클래스(Mythread)를 정의
        //MyThread thread = new MuThreaad();

        //2.Runnable 인터페이스를 구현한 클래스(MyRunnable)를 정의
        //(new Thread(new Runnable(클래스 이름의 객채 )))

        //MyRunnable runnable = new MyRunnable();
        //Thread thread = new Thread(runnable)

        //1.
        Thread thread1 = new Thread() {
            @Override
            public void run() {//바로 스레드를 정의해도됨!
                System.out.println("hello");
            }
        };
        thread1.run();

        Thread thread2 = new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("Hi");
            }
        });
        thread2.run();

        //Runnable 인터페이스는 run() 만 정의가 되어있는
        //함수적 인터페이스 (Functional Interface)
        //=> 람다식으로 작성

        //람다식을 이용해서 스레드의 작업 내용을 작성하고
        //스레드를 생성해부세요
        //1~10 까지 출력하는 스레드
        //1. Thread 객체 만드는 방법
        //2. Thread 객체 생성시 Runnable 객체를 매개값으로 주는 방법


        //람다식 사용버전
        Runnable runnable = () -> {

            //Runnable 인터페이스가
            //함수적 인터페이스 이기 때문
            //(추상 메소드가 오직 한 개 만 올수 있음! )
            for(int i = 1; i<=10;i++){
                System.out.println(i);
            }
        };
        Thread thi = new Thread(runnable);
        thread1.start();

        //익명 객체 사용 버전
        Thread th3 = new Thread(new Runnable() {
            @Override
            public void run() {
                for (int i = 1; i <= 10; i++) {
                    System.out.println(i);
                }
            }
        });
        th3.start();

        //Tread 클래스를 사용하는 버전
       Thread th2 = new Thread (() -> {
          for(int i = 1;i <=10;i++){
              System.out.println(i);

          }
       });
       th2.start();
       //익명 객체 사용 버전
       Thread th4 = new Thread(){
           @Override
           public void run(){
               for(int i = 1;i <=10;i++){
                   System.out.println(i);

               }
           }
       };
       th4.start();

    }
}
