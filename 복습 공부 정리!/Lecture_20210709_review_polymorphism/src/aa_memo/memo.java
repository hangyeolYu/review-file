package aa_memo;

public class memo {

    /*

 다형성 : 형을 다양하게 하는 형식

    Shape:
    int x,y

    Rectangle extends Shape:
        Shape s = new Rectangle();
   (데이터 타입)(변수)   (객체 생성 )
    int w,h


    자식 객체 -> 부모 객체 변수 (O)
    ex) Shape s = new Rectangle ();
    왜냐하면 자식 객체는 부모객체 변수가 접근할 수 있는 모든 필드/함수를 접근할 수 있기 때문
    s.getW(),s.getH(); 이걸 할수는 있지만 => ((Rectangle)s).getW(), ((Rectangle)s).getH() 형식으로 형변환을 해줘야함!


    부모 객체 -> 자식 객체 변수 (X)
    ex) Rectangle r = new Shape();
    r.getW(), r.getH(); ?? 할수가 없다! r. 찍으면 있긴있으나 변수 객체 타입은 Shape 은 가지고잇지않음!



    Shape [] shape = new Shape[4];

    shape [0] = new Rectangle ( 1 , 2 , 5 ,6);
    shape [1] = new Circle (1 , 2 , 8);
    shape [2] = new Triangle (1 , 2, 4 ,5);
    Shape [3] = new Shape (1 , 2); //만약 추상 클래스가 아니라면 생성자 가능!
    다형성의 객체도 가질수 잇다 !

    for (int i =0; i< shape.length;i++){
    sout shape[i]
    shape[i].printinfo();
    sout "AREA : " + shape[i].getArea();
    {...}
    코드의 중복을 줄일수 있다!

    //만약 에리야 함수가 상속 Shape 클래스가 아닌 Circle 클래스에만 정의 되어있다면
    if( shape [i] instanceof Circle){
    //만약 셰이프[i] 변수의 객체 타입이 썰클 객체 타입이라면?
    sout "Area : "+ ((Circle)shape[i]).getArea());
     //Circle 로 형변환을 한  shpe[i]의 배열 변수에 getArea를 정의후 출력하라!
    }
    }

        try {}catch {}finally //예외 발생 유무와 관계없이 무조건 실행




     */
}
