package Lambda_with_parametet;

@FunctionalInterface//추상 메소드를 오직 딱 하나만 작성할수 있음!
public interface MyInterfaceParameter {
    public void method (int x);//둘다 추상 메소드 (무조건 재정의 해야함!)

    //public void OtherMethod(int x); 추상 메소드 하나만 올수 있음!

    public default void otherMethod(int x){
        //디폴트 메소드 내용...
    }
    //디폴트 메소드 (재정의 선택적)
    public static void otherMethod2(int x){
        //정적 메소드 내용
    }
}
