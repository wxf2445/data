package cn.com.jtang.util;

/**
 * Created by ZJUXP on 2016-06-21.
 */
public class RecordUtil {

    //office formate
    public final static String[] OfficeFormat = {"doc", "docx", "xls", "xlsx", "ppt", "pptx"};
    public final static String[] ImageFormat = {"png", "jpg", "gif", "bmp", "jpeg","tif"};
    public final static String[] MusicFormat = {"mp3", "wav"};
    public final static String PdfFormat = "pdf";
    public final static String TifFormat = "tif";
    public final static String JpgFormat = "jpg";
    public final static String[] AVIORMOVFormat = {"avi", "mov"};;

    //schedule
    /*public final static String DailyBackPath = "/home/jtang/backup/dailyback.sh";
    public final static String FullBackPath = "/home/jtang/backup/fullbackup.sh";*/
    public final static String DailyBack = "dailyback";
    public final static String FullBack = "fullback";
    public final static String BackUPGroup = "BackUPGroup";
    public final static String FullBackUPGroup = "FullBackUPGroup";

    //accesscontrol
    public final static String ACCESS_CONTROL = "accesscontrol";
    public final static String FONDSID = "fondsid";
    public final static String ID = "id";
    public final static String SEQUENCNO = "sequencNo";

    public final static String YEAR = "year";
    public final static String DEADLINE = "deadline";
    public final static String DEPARTMENT = "department";
    public final static String PEOPLE = "people";
    public final static String SUBJECT = "subject";
    public final static String OPERATOR = "operator";
    
/*    public final static String CHINESE_YEAR = "年度";
    public final static String YEAR_LENGTH = "32";
    
    public final static String CHINESE_DEADLINE = "保管期限";
    public final static String DEADLINE_LENGTH = "32";
    
    public final static String CHINESE_DEPARTMENT = "部门";
    public final static String DEPARTMENT_LENGTH = "32";

    public final static String CHINESE_PEOPLE = "责任人";
    public final static String PEOPLE_LENGTH = "32";
    
    public final static String CHINESE_SUBJECT = "题名";
    public final static String SUBJECT_LENGTH = "32";*/

    public final static String DOCUMENT = "_document";
    public final static String RECORD = "_record";
    public final static String PIECE = "_piece";
    public final static String VOLUME = "_volume";
    public final static String RECORDCONTENT = "_recordcontent";
    public final static String PIECECONTENT = "_piececontent";
    public final static String PIECEDOCUMENT = "_piecedocument";

    //record mode
    public final static String MODE_VOLUMEPIECE = "0";
    public final static String MODE_PIECE = "1";

    //checkstatus
    public final static String NOT_CHECK = "-1";
    public final static String SUBMIT_CHECK = "0";
    public final static String CHECK_PASS = "1";
    public final static String CHECK_NOTPASS = "2";


    //templatecolumn
    public final static String COLUMN_SOURCEFILE = "sourcefile";
    public final static String COLUMN_SOURCEFILE_WIDTH = "255";
    public final static String COLUMN_PAGENUM = "pagenum";
    public final static String COLUMN_PAGENUM_WIDTH = "32";
    public final static String COLUMN_RECORDID = "recordId";
    public final static String COLUMN_RECORDID_WIDTH = "32";
    public final static String[] COLUMN_NOT_IN = {"recordId", "sourcefile", "pagenum"};


    public final static String ACCESSRECORD = "accessrecord";
    //danymic
    public final static String COL_PREFIX = "col";


    public final static String getChineseType (String englishName) {
        if (englishName.equals(PIECE))
            return "按件";
        else if (englishName.equals(VOLUME))
            return "案卷";
        else if (englishName.equals(RECORD))
            return "卷内";
        else
            return "";
    }

    public static boolean isOfficeType (String fileName) {
        boolean status = false;
        if ("docx".equals(fileName)||"doc".equals(fileName)||"xls".equals(fileName)||"xlsx".equals(fileName)||"ppt".equals(fileName)||"pptx".equals(fileName)) {
            status = true;
        }
        return status;
    }


}
