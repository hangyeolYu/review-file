package tree_map_sorting;



import java.util.NavigableMap;
import java.util.TreeMap;

public class TreeMapSorting {
    public static void main(String[] args) {
        TreeMap<String,String> dictionary = new TreeMap<>();

        dictionary.put("s","sexy");
        dictionary.put("c","cute");
        dictionary.put("h","hansome");
        dictionary.put("ho","hope");
        dictionary.put("r","rest");

        //1.내림차순 출력

        NavigableMap<String,String> descendingMap =dictionary.descendingMap();
        
        while(!descendingMap.isEmpty()){

        }
        //2.오름차순 출력
    }
}
