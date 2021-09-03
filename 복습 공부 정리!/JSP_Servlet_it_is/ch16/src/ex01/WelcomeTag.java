package ex01;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class WelcomeTag extends SimpleTagSupport {
    @Override
   public void doTag () throws JspException, IOException {
        getJspContext().getOut().println("Custom Tag");
        //jsp 파일에서 -- out 객체를 통해 가지고 와서 --출력하다

    }
    }

