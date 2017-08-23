package cn.com.jtang.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;

import cn.com.jtang.po.ArchivesAudit;
import cn.com.jtang.po.ArchivesAuditExample;

public interface ArchivesAuditMapper {



	int countByExample(ArchivesAuditExample example);


	List<ArchivesAudit> selectByExample(ArchivesAuditExample example);


	List<ArchivesAudit> getMyApplication(Map map);


	int insertArchivesAudit(@Param("recordtypeid")String recordtypeid, @Param("type")String type,@Param("recordid")String recordid,
			@Param("reason")String reason,@Param("subject")String subject, @Param("accesspermission")String accesspermission,@Param("userId")String userId);
	
	int checkArchivesAudit(@Param("recordtypeid")String recordtypeid, @Param("type")String type,@Param("recordid")String recordid,
			@Param("accesspermission")String accesspermission,@Param("userId")String userId);

	int passArchives(@Param("id")String id,@Param("status")String status,@Param("deadline")@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date deadline);


	int changeStausById(@Param("id")String id,@Param("status")String status);
	
	
	int isRead(@Param("id")String id);
	


	List<String> getArchivesCode(@Param("recordtypeid")String recordtypeid, @Param("type")String type,@Param("recordid")String recordid,
			@Param("userId")String userId);
	

    
    ArchivesAudit getOneArchivesAudit(@Param("id")String id);

	List<String> getRecordTypeOrder(@Param("recordtypeid")String recordtypeid,@Param("userId")String userId);
}