package vector_synchronized;

public class ID {
    int hp;

    public int getHp(){
        return hp;
    }
    public void setHp(int hp){
        this.hp = hp;

        try{
            Thread.sleep(2000);//2초정지
        }
        catch (InterruptedException e){
            System.out.println(e.getMessage());
        }
        System.out.println(Thread.currentThread().getName()
        +" :"+this.hp);

    }
}
