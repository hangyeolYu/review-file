package file_test;

import java.io.*;

public class FileExample {
    public static void main(String[] args) throws IOException {

        File dir1 = new File(".");
        File dir2 = new File("./src");
        File dir3 = new File(dir2.toString()
                + "/file_test/newFolder");
        File file1 = new File(dir3.toString()+ "/file1.txt");
        File file2 = new File(dir3.toString()+ "/file2.txt");
        File file3 = new File(dir3.toString()+ "/file3.txt");

      // /Users/yuhangyeol/IdeaProjects/Lecture_0709_In_and_Out/src/aa_memo/Memo.java
        if(!(dir1.exists())){dir1.mkdir();
            //만약 dir.3 존재가 트루가 아니라면
            //make dir
            dir3.mkdir();
        }
        if(!(dir2.exists())){
            //만약 dir.3 존재가 트루가 아니라면
            dir3.mkdir();
        }
        if(!(dir3.exists())){
            //만약 dir.3 존재가 트루가 아니라면
            dir3.mkdir();
        }

        if(!(file1.exists())) file1.createNewFile();
        if(!(file2.exists())) file2.createNewFile();
        if(!(file3.exists())) file3.createNewFile();

        File [] content = dir3.listFiles();
        for (File file : content){
            System.out.println(file.toString());
        }

    }
}
