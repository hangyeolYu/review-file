package stacktest;

import java.util.*;
public class StackTest {
    public static void main(String[] args) {
        Stack<Book> book = new Stack<>();
        book.push(new Book("눈먼 자들의 도시"));
        book.push(new Book("위대한 개츠비"));
        book.push(new Book("해리포터"));

        System.out.println(book.peek().getTitle());//귀찮으니 걍 타이틀 가져오셈 ㅋ

        while(!book.isEmpty()){
            Book popBook = book.pop();
            System.out.println("꺼낸 책 이름 : "+popBook.getTitle());

        }
        System.out.println(book.peek().getTitle());//안에 비어있으므로 Empty상태임!

    }
}
