package ex01;

public class fileDTO {
    String ID;
    String fileName;
    String fileRealName;

    public fileDTO (String id,String fileName, String fileRealName) {
         this.ID = id;
         this.fileName = fileName;
         this.fileRealName = fileRealName;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileRealName() {
        return fileRealName;
    }

    public void setFileRealName(String fileRealName) {
        this.fileRealName = fileRealName;
    }

}
