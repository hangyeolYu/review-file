package stream_reduce;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class ReduceExample {
    public static void main(String[] args) {
        int [] arrInt = {10,2,5};//배열은 스트림 형태를 가지고 있지 않으니
        int sub = Arrays.stream(arrInt) //어레이 리스트에 담아 스트림을 가져옴!
                .reduce((a,b)->a-b).getAsInt();
        System.out.println(sub);

        List<String> words = Arrays.asList( //값이 바로 지정될때 asList 사용!
                "banana",
                "watermelon",
                "apple",
                "peach"
        );
    //reduce() 함수를 통해서 words 중 가장 긴 단어를 반환 //컬렉션은 기본적으로 steam 클래스를 가지고 있다!
        String str = words.stream() //Optional <String > 옵셔널참조형은 제네릭으로 받아야합니다! 그외의 기초자료형 옵셔널은 따로 클래스가 이씀!
                .reduce(" ",(a,b)-> a.length()>b.length()?a:b);//get은 스트링!
        System.out.println(str);

        //banana watermelon apple
        String concateStr = words.stream()
                .reduce("",(str1,str2)->str1+ " "+str2);
        System.out.println(concateStr);

        //str1        str2
        //================
        // ""  + " " +banana => " banana" 기본값이 가장먼저 str1에 들어감
        //" banana"+ " " +"watermelon"=> " banana watermelon"




        //1.방법 1 //디폴트 형이 없는경우 Optional 클래스로 반환됨!
        System.out.println("[isPresent]");

        Optional<String> concateStr2 = words.stream()
                .reduce((str1,str2)->str1+ " "+str2);

        if (concateStr2.isPresent()){
            System.out.println(concateStr2.get());
        }
        else {
            System.out.println("요소들이 없슴다");
        }

        //방법 2  //디폴트 형이 있는 경우
        System.out.println("[orElse]");
        String concateStr3 = words.stream()
                .reduce((str1,str2)->str1+ " "+str2)
        .orElse("반환값이 없어요!");
        System.out.println(concateStr3);

        //방법 3 요소 소비형
        System.out.println("[ifPresent]");
         words.stream()
                .reduce((str1,str2)->str1+ " "+str2)
                .ifPresent(a -> System.out.println(a));




    }
}
