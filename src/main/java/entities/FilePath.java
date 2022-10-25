package entities;

public class FilePath {

        //private String initialPath="http://localhost:8081/OnlineEditorsExampleJava_war/test/"; //初始路径
        private String initialPath;
        //private String savePath="http://192.168.1.39:8084/OnlineEditorsExampleJava_war/test/"; //编辑后保存路径
        // private String savePath="D:\\apache-tomcat-8.5.30\\webapps\\OnlineEditorsExampleJava_war\\test\\"; //编辑后保存路径
        private String savePath; //编辑后保存路径

        private volatile static FilePath filePath;
        private FilePath(){};
        public static FilePath getFilePath(){
            if(filePath!=null){
                return filePath;
            }else {
                filePath = new FilePath();
            }
            return filePath;
        }

        public String getInitialPath() {
            return initialPath;
        }

        public void setInitialPath(String initialPath) {
            this.initialPath = initialPath;
        }

        public String getSavePath() {
            return savePath;
        }

        public void setSavePath(String savePath) {
            this.savePath = savePath;
        }

      /*public FilePath(String initialPath){
        this.initialPath=initialPath;       //"http://localhost:8082/OnlineEditorsExampleJava_war/test1/"
        this.savePath="C:\\Users\\Administrator\\Desktop\\version\\";
    }*/



}
