package Memo_Stream;

public class Memo {
}
/* 스트림 (Stream) ]
- 자바 8 소개
- 컬렉션이나 배열의 저장 요소를 하나씩 참조해서 처리할 수 있는 반복자


   ● 반복자 (Iterator)
   : 자바 7 이전까지는 Iterator 반복자 사용
   : 자바 8 이후로 Stream 사용
   : 컬렉션 (java.util.Collection)의
   1) stream() 메소드를 통해 스트림 객체를 얻음
   2) stream.forEach()를 통해 컬렉션 요소를 하나씩 출력

   ● 스트림 특징
   1) 내부 반복자를 이용
   : 컬렉션 내부에서 요소를 반복시킴
   : 개발자는 요소 처리 코드에만 집중
   : 병렬 작업을 수월하게 해줌
   (요소들을 잘 분배해서)
   => 병렬 처리 스트림
   => main 스레드 + 스레드풀 (ForkJoinPool)

   ※ 외부 반복자
   : 개발자가 직접 컬렉션 요소를 반복해서 가지고 오는 패턴
   (while, for문을 돌면서 외부 반복문을 이용)

   2) 람다식이랑 사용 (요소 처리 코드)
   3) 중간처리 부분 + 최종처리하는 부분
   : 중간처리: 필터링 (필요한 요소만 가지고 옴), 정렬
   : 최종처리: 평균, 총합, 카운팅 (집계 처리)

   ● 스트림 종류
   - java.util.stream 패키지는 스트림 API (라이브러리) 존재
   - BaseStream 인터페이스를 부모로해서 자식 인터페이스들 존재

   BaseStream > Stream
              > IntStream
              > DoubleStream
              > LongStream

   ● 스트림 파이프라인
   : 여러 개의 스트림이 연결된 구조
   : 중간처리: 필터링, 정렬, 매핑, 그룹핑 등
   : 최종처리: 합계, 평균, 카운팅, 최대/최소값

   - 스트림 소스: 컬렉션, 배열, 파일
   -> 원본 스트림
   -> 중간처리 스트림 (필터링, 정렬..)
   -> 최종처리 스트림 (합계, 평균..)
   -> 결과

   ex) 회원 (Member) 저장하는 컬렉션
   -> Member 필드로 gender (남 / 여) (원본 스트림)
   -> (filter())
   -> Member (남성) (남자 요소 Stream) (중간 처리)
   -> (mapToInt())
   -> age (나이 요소 IntStream) (중간 처리)
   -> (average())
   -> 집계 처리 (최종 처리) --> 평균 나이


   - 중간 처리
      1) 필터링: distinct() (중복 제거), filter(...) (필터링)

      2) 매핑 (객체변수 -> 객체의 필드, mapping)

      flatMapXXX(): 요소를 대체하는 복수 개의 요소 구성된 스트림 리턴
      mapToXXX():  요소를 대체하는 요소로 구성된 새로운 스트림 리턴
      asDoubleStream(): IntStream의 int나 LongStream의 long 요소
                  -> double 요소로 변환하는 DoubleStream 생성
      asLongStream(): IntStream의 int 요소
                  -> long 요소로 변환해서 LongStream 생성
      boxed(): int, long, double 요소를
            -> Integer, Long, Double 박싱해서 Stream 생성

      cf)
      API - Wrapper 클래스 (Integer, Double ...)
      boxing: 기초 자료형 -> 객체화
      unboxing: 객체화 -> 기초 자료형

      3) 정렬: 최종 처리되기 전에 중간 단계에서 요소를 정렬 (최종 처리 순서 변경)
      sorted(): Comparable 방법에 따라 정렬 (compareTo(o))
      sorted(Comparator<T>): Comparator 방법으로 정렬 (compare(o1, o2))

      ex) Stream<Student> (Student는 사용자 정의 클래스)
      Student 클래스 안에 Comparable 구현되어 있지 않으면 ..?
      Exception!!!! ClassCastException


      4) 루핑 (looping): 중간처리에서 전체 요소를 반복하는 것
      peek(): 중간 처리 단계에서 전체 요소 루핑하며 추가적인 작업을 하기 위해 사용

         ex) IntStream intStream = IntStream.rangeClosed(1, 5);
            intStream.filter(a -> a % 2 == 0) // 짝수만 필터링
            .peek(a -> sysout(a)) // 마지막에서 peek() 호출 => 스트림 동작 X

         ex) IntStream intStream = IntStream.rangeClosed(1, 5);
            intStream.filter(a -> a % 2 == 0) // 짝수만 필터링
            .peek(a -> sysout(a)) // 중간 처리 메소드
            .sum() // 정상 동작 (최종 처리 메소드)

         * peek(): 마지막으로 올 수가 없음 (뒤에 최종 처리 메소드 필요!)




   - 최종 처리
      1) 집계: count(), max(), min(), average(), sum()
      2) 매칭: allMatch(), anyMatch(), noneMatch() (boolean 반환)
      3) 루핑 (looping)
      : forEach()
      4) 수집: collect()

* */
