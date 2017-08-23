package cn.com.jtang.service;

import java.util.List;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import cn.com.jtang.po.ArchivesAudit;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.ArchivesForm;
import cn.com.jtang.web.controller.form.ArchivesSearchForm;
import cn.com.jtang.web.controller.form.LogSearchForm;


/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface ArchivesService {
	/**
	* 插入日志
	* @param event 时间。username自动读取
	* @return
	* @throws Exception
	*/
    int insert(ArchivesForm archives);

    
    Page getAllArchives(ArchivesSearchForm archivesSearchForm);

    
    Page getApplication(int pagenum,int status);

    
    Page getMyApplication(int pagenum);
    
    
    Page getArchivesRecord(ArchivesSearchForm archivesSearchForm);
    
    
    int returnArchives(String id,String returnPerson);
    
    
    int sendApplication(String recordtypeid,String type,String recordid,String reason,String accesspermission);
    

    int passArchives(String id,@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date deadline);

    
    int refuseArchives(String id);
    
    
    int cancelAuthority(String id);
    
    
    int isAduitRead(String id);
    
    
    int isRead(String id);
    
    
    List<String> getArchivesOrder(String recordtypeid,String type,String recordid);
    
    
    List<ArchivesAudit> getArchivesAudit();
    
    
    List<ArchivesForm> getArchives();
    
    
    ArchivesForm getOneArchives(String id);
    
    
    ArchivesAudit getOneArchivesAudit(String id);
    

    List<String> getRecordTypeOrder(String recordtypeid);

}


//~ Formatted by Jindent --- http://www.jindent.com
