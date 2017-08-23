package cn.com.jtang.service.impl;

import cn.com.jtang.dao.ArchivesAuditMapper;
import cn.com.jtang.dao.ArchivesMapper;
import cn.com.jtang.po.ArchivesAudit;
import cn.com.jtang.po.ArchivesAuditExample;
import cn.com.jtang.po.ArchivesExample;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.service.ArchivesService;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.RecordService;
import cn.com.jtang.service.RecordTypeService;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.ArchivesForm;
import cn.com.jtang.web.controller.form.ArchivesSearchForm;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("archivesService")
public class ArchivesServiceImpl implements ArchivesService {

    @Resource
    private ArchivesMapper archivesMapper;
    @Resource
    private RecordService recordService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private ArchivesAuditMapper archivesAuditMapper;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private LogService logService;
    @Resource
    private UserService userService;
    

	@Override
	public int insert(ArchivesForm archives) {
		return archivesMapper.insertSelective(archives);
	}

	@Override
	public Page getAllArchives(ArchivesSearchForm archivesSearchForm) {

        String key = archivesSearchForm.getKey();
        Date start = archivesSearchForm.getStarttime();
        Date end = archivesSearchForm.getEndtime();
        Date current = new Date(System.currentTimeMillis());
		ArchivesExample example = new ArchivesExample();
		ArchivesExample.Criteria criteria = example.createCriteria();
	   	criteria.and("status = 0");
        if (start != null) {
            if (end == null) {
                end = current;
            } else if (end.after(current)) {
                end = current;
            }

            if (start.before(end)) {
                criteria.andborrowtimeBetween(start, end);
            } else if (start.equals(end)) {
                criteria.andborrowtimeEqualTo(start);
            }

            archivesSearchForm.setStarttime(start);
            archivesSearchForm.setEndtime(end);
        }
        if ((key != null) && !"".equals(key)) {
    	   	criteria.and("borrowNo like '%"+key+"%'");
        }
        Page page = new Page(null, 0, archivesSearchForm.getPage(), archivesSearchForm.getSize());
        page.retrievePage(archivesMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        example.setOrderByClause("borrowtime desc");
        page.setItems(archivesMapper.selectByExample(example));
		return page;
	}

	@Override
	public Page getArchivesRecord(ArchivesSearchForm archivesSearchForm) {

        String key = archivesSearchForm.getKey();
        Date start = archivesSearchForm.getStarttime();
        Date end = archivesSearchForm.getEndtime();
        Date current = new Date(System.currentTimeMillis());
		ArchivesExample example = new ArchivesExample();
		ArchivesExample.Criteria criteria = example.createCriteria();

        if (start != null) {
            if (end == null) {
                end = current;
            } else if (end.after(current)) {
                end = current;
            }

            if (start.before(end)) {
                criteria.andborrowtimeBetween(start, end);
            } else if (start.equals(end)) {
                criteria.andborrowtimeEqualTo(start);
            }

            archivesSearchForm.setStarttime(start);
            archivesSearchForm.setEndtime(end);
        }
        if ((key != null) && !"".equals(key)) {
    	   	criteria.and("borrowNo like '%"+key+"%'");
        }
        Page page = new Page(null, 0, archivesSearchForm.getPage(), archivesSearchForm.getSize());
        page.retrievePage(archivesMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        example.setOrderByClause("updatetime desc");
        page.setItems(archivesMapper.selectByExample(example));
		return page;
	}

	@Override
	public int returnArchives(String id,String returnPerson) {
		return archivesMapper.returnArchives(id,returnPerson);
	}

	@Override
	public Page getMyApplication(int pagenum) {
		int size = 10;
        Page page = new Page(null, 0, pagenum,size);
        Map map = new HashMap<>();
        String userId = shiroUserService.getLoginUser().getUserid();
        
		ArchivesAuditExample example = new ArchivesAuditExample();
		ArchivesAuditExample.Criteria criteria = example.createCriteria();
        page.retrievePage(archivesAuditMapper.countByExample(example));

        example.setOrderByClause("applytime desc");
        map.put("userId", userId);
        map.put("start", (page.getPageNum() - Page.ONE) * page.getPageSize());
        map.put("end", page.getPageSize());
        page.setItems(archivesAuditMapper.getMyApplication(map));
		return page;
	}


	@Override
	public Page getApplication(int pagenum, int status) {
		int size = 10;
        Page page = new Page(null, 0, pagenum,size);
		ArchivesAuditExample example = new ArchivesAuditExample();
		ArchivesAuditExample.Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(status);
        page.retrievePage(archivesAuditMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        example.setOrderByClause("applytime asc");
        page.setItems(archivesAuditMapper.selectByExample(example));
		return page;
	}


	@Override
	public int sendApplication(String recordtypeid, String type, String recordid, String reason, String accesspermission) {
		String userId = shiroUserService.getLoginUser().getUserid();
        RecordType recordType = recordTypeService.selectByPrimaryKey(recordtypeid);
        String tableName = recordType.getRecordtable().replace(RecordUtil.RECORD, type);
		String subject = recordService.selectSubjectByRecordOrVolumeId(tableName, recordid);
		if(archivesAuditMapper.checkArchivesAudit(recordtypeid, type, recordid, accesspermission, userId)==0)
			return archivesAuditMapper.insertArchivesAudit(recordtypeid, type, recordid, reason,subject, accesspermission, userId);
		else
			return -1;
	}

	@Override
	public int passArchives(String id,@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date deadline) {
		ArchivesAudit archivesAudit = getOneArchivesAudit(id);
        logService.insert("通过了"+userService.selectByPrimaryKey(archivesAudit.getUserId()).getUsername()+"的电子借阅申请--"+archivesAudit.getSubject());
		return archivesAuditMapper.passArchives(id, "1",deadline);
	}

	@Override
	public int refuseArchives(String id) {
		ArchivesAudit archivesAudit = getOneArchivesAudit(id);
        logService.insert("拒绝了"+userService.selectByPrimaryKey(archivesAudit.getUserId()).getUsername()+"的电子借阅申请--"+archivesAudit.getSubject());
		return archivesAuditMapper.changeStausById(id, "-1");
	}

	@Override
	public int cancelAuthority(String id) {
		ArchivesAudit archivesAudit = getOneArchivesAudit(id);
        logService.insert("取消了"+userService.selectByPrimaryKey(archivesAudit.getUserId()).getUsername()+"的电子借阅申请--"+archivesAudit.getSubject()+"的权限");
		return archivesAuditMapper.changeStausById(id, "-2");
	}

	@Override
	public List<String> getArchivesOrder(String recordtypeid, String type,
			String recordid) {
		String userId = shiroUserService.getLoginUser().getUserid();
		
		/*if(type.equals(RecordUtil.RECORD)){
			String tableName = recordTypeService.selectByPrimaryKey(recordtypeid).getRecordtable();
			recordid = recordService.selectByPrimaryKey(recordid, tableName.replace(RecordUtil.RECORD, type)).getVolumeid();
			type = RecordUtil.VOLUME;
		}*/
		return archivesAuditMapper.getArchivesCode(recordtypeid, type, recordid, userId);
	}
	

	@Override
	public List<ArchivesAudit> getArchivesAudit() {
		ArchivesAuditExample example = new ArchivesAuditExample();
		ArchivesAuditExample.Criteria criteria = example.createCriteria();
		if((shiroUserService.getLoginUser().getRoleid()+"").equals("1"))
			criteria.and("(A.userId = '"+shiroUserService.getLoginUser().getUserid()+"' and A.isread = 1 and status<>0) or (status=0)");
		else
			criteria.and("A.userId = '"+shiroUserService.getLoginUser().getUserid()+"' and A.isread = 1 and status<>0");
        example.setOrderByClause("applytime desc");
        
		return archivesAuditMapper.selectByExample(example);
	}

	@Override
	public int isAduitRead(String id) {
		return archivesAuditMapper.isRead(id);
	}
	@Override
	public int isRead(String id) {
		return archivesMapper.isRead(id);
	}

	@Override
	public List<ArchivesForm> getArchives() {
		return archivesMapper.getArchives();
	}

	@Override
	public ArchivesForm getOneArchives(String id) {
		return archivesMapper.getOneArchives(id);
	}
	@Override
	public ArchivesAudit getOneArchivesAudit(String id) {
		return archivesAuditMapper.getOneArchivesAudit(id);
	}

	@Override
	public List<String> getRecordTypeOrder(String recordtypeid) {
		return archivesAuditMapper.getRecordTypeOrder(recordtypeid,shiroUserService.getLoginUser().getUserid() );
	}

}
