package hash_map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class HashMapExample {
    public static void main(String[] args) {

        //Map 컬렉션 생성
        Map<String, String> map = new HashMap<>();

        //객체 저장\
        //1.
        //본인이 좋아하는 단어 5개 저장

        map.put("s", "sexy");
        map.put("c", "cute");
        map.put("t", "Tatto");
        map.put("p", "pretty");
        map.put("w", "왐마");

        //2.
        //객체 수 출력
        System.out.println(map.size());

        //3. 하나의 단어 지정 후 ,검색
        System.out.println(map.containsKey("c"));
        //존재여부
        System.out.println(map.get("s"));
        //그걸 가져와라


        //4.하나의 단어 지정 후 ,삭제
        System.out.println(map.remove("w"));//키로 키-값 쌍(map.Entry)를 제거
        System.out.println(map.containsKey("w"));
        //존재여부
        System.out.println(map.get("w"));
        //가져와라

        //객체 출력
        //1.entrySet()
        //2.keySet()

        Set<Map.Entry<String,String>> entrySet
                = map.entrySet();//Map.Entry Set 얻음
        Iterator<Map.Entry<String,String>> entryIterator =
                entrySet.iterator();

        while (entryIterator.hasNext()) {
            Map.Entry<String,String> entry = entryIterator.next();
            String key = entry.getKey();
            String value = entry.getValue();
            System.out.println(key+" : "+ value);//맵은 순서가 유지가 안됨!
                                                 //셑도 마찬가지
                                                //index를 가진 list만 순서유지가 가능!
        }
        System.out.println();

        //2.keySet()
        Set<String> keySet = map.keySet();//key 는 set 을  얻음
        Iterator<String> keyIterator = keySet.iterator();
        while(keyIterator.hasNext()){//너뒤에 뭐있냐 ㅋ있어?  그러면 가져와  ㅋ
            String key = keyIterator.next();
            String value = map.get(key);
            System.out.println(key + " : "+ value);
        }
        System.out.println();

        map.clear();
        System.out.println("객체 수 : "+ map.size());







        }



    }

