package file_writer;

import java.io.*;
import java.nio.file.FileVisitResult;

public class FileWriterExample {
    public static void main(String[] args) throws FileNotFoundException {

        File file = new File("/Users/yuhangyeol/Desktop/은밀한 PDF,IMG모음/memos");//memos2 라는 파일이 없는걸 넣으면
        //자동으로 파일을 생성함!
        try {
            FileWriter fw = new FileWriter(file, true);
            //기존것을 유지하고 추가만함!
            fw.write("맛점하세요!");
            fw.flush();
            fw.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
//        FileWriter (File file ,boolean append);
//        FileWriter (File file );
//        FileWriter (String str ,boolean append);


        //파일 복사
        //파일을 하나 만들어서 파일(input.txt)에 있는 데이터를 읽고  (FileReader)
        //그 데이터를 다른 파일 (output.txt)에 출력하는 프로그램 (FileWriter)

        File file1 = new File("/Users/yuhangyeol/Desktop/은밀한 PDF,IMG모음/input.txt");
        FileReader fR = new FileReader(file1);
        //얘는 경로가 없으면 오류남!
        //주소를 가져옴!

        try {
            FileWriter fw2 = new FileWriter("/Users/yuhangyeol/Desktop/은밀한 PDF,IMG모음/input34.txt",true);
            //기존에 있던 데이터가 사라지지않고 업헨드됨(덮붙이다 )
            //반환을함! 근데 해당 파일이없으면 해당 파일 위치에 새로만들고 주소 형식이 정해지지않으면 지금 사용중인 프로젝트 파일안에 같이 생성이됨!
            // "..//..//"
            //~앞에, ~앞에 파일 위치를 가르침!

            int c ;
            while ((c = fR.read())!=-1){
                fw2.write(c);
            }
            fw2.write("했지롱~~~~~\n");
            fw2.write("했지롱~~~~~\n"); //복사하고 추가로 내가 입력한거임
            fw2.write("했지롱~~~~~\n");
            fw2.flush();
            fw2.close();
            fR.close();
        } catch (Exception e){
        System.out.println(e.getMessage());
    }

    }
}
