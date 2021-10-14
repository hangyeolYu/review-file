package ex01;

import java.sql.Connection;

public class fileDAO {
    private DBConnectionMgr pool;

    // 파일 업로드에 사용하는 폴더 위치
    private static final String  SAVEFOLDER = "./files";
    private static final String ENCTYPE = "UTF-8";
    private static int MAXSIZE = 5*1024*1024;
    private Connection conn;

    public fileDAO () {
        try {
            // DBConnectionMgr 객체 가져옴
            pool = DBConnectionMgr.getInstance();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
