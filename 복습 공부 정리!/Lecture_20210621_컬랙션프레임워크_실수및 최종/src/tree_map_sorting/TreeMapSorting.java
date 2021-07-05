package tree_map_sorting;



import java.util.Map;
import java.util.NavigableMap;
import java.util.Set;
import java.util.TreeMap;

public class TreeMapSorting {
    public static void main(String[] args) {
        TreeMap<String,String> dictionary = new TreeMap<>();

        dictionary.put("s","sexy");
        dictionary.put("c","cute");
        dictionary.put("h","hansome");
        dictionary.put("ho","hope");
        dictionary.put("r","rest");

        System.out.println("[기본 출력]");
        System.out.println(dictionary);
        System.out.println();

        System.out.println("[NavigableMap 내림차순]");
        NavigableMap<String,String>decendingMap
                =dictionary.descendingMap(); // 다시할꺼면 또 .descendingMap 하면됨!
        Set<Map.Entry<String,String>> descendingEntrySet //출력을 하기 위해 Set 컬렉션에 담음!
                =decendingMap.entrySet();

        for(Map.Entry<String,String>entry:descendingEntrySet) //셑에 담아 키와 벨류를 향상된 포문을 통해 출력!
            System.out.print(entry.getKey() + " =" + entry.getValue()+" ");
        System.out.println();

























        //-------------------------------내가 한거----------------------------
        //1.내림차순 출력

        NavigableMap<String,String> descendingMap =dictionary.descendingMap();
        System.out.println("[내림차순 출력]");
        while(!descendingMap.isEmpty()){
            System.out.print(descendingMap.pollFirstEntry()+ " ");
        }
        System.out.println();
        //2.오름차순 출력

        dictionary.put("s","sexy");
        dictionary.put("c","cute");
        dictionary.put("h","hansome");
        dictionary.put("ho","hope");
        dictionary.put("r","rest");
        System.out.println();


        System.out.println("[다시 오름차순 출력]");
        NavigableMap<String,String> asscendingMap =dictionary.descendingMap().descendingMap();
        while(!descendingMap.isEmpty()){
            System.out.print(asscendingMap.pollFirstEntry()+" ");
        }
    }
}
