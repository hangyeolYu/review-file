package vector;

public class Fruit {
    String name;
    int price;

    public Fruit(String name,int price){
    this.name = name;
    this.price = price;

    }
    @Override// toString 은 Object 클래스에 았으니 필드에 맞게 재정의가 가능!
    public String toString (){
        //return "과일이름  :"+name+", 가격   :"+price;
        return String.format("과일이름  : %6s, 가격  %6d",name,price);//이쁘게~
    }
}
