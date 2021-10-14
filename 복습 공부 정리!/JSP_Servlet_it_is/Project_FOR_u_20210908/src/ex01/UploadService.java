package ex01;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/UploadService")
public class UploadService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("file");
        System.out.println(fileName);



        ServletContext context = getServletContext(); //어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨.
        String saveDir = context.getRealPath("Upload"); //절대경로를 가져옴
        System.out.println("절대경로 >> " + saveDir);

        //절대경로 >> /Users/yuhangyeol/Desktop/JSP_Servlet_it_is/Project_FOR_u_20210908/out/artifacts/Project_FOR_u_20210908_war_exploded/Upload

        int maxSize = 3*1024*1024; // 3MB

        String encoding ="UTF-8";

        MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
    }
}
