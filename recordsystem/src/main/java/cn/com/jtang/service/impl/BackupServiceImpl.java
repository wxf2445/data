package cn.com.jtang.service.impl;

import cn.com.jtang.dao.BackupSaveMapper;
import cn.com.jtang.dao.DailyBackMapper;
import cn.com.jtang.dao.FullBackMapper;
import cn.com.jtang.po.*;
import cn.com.jtang.resulthandler.MapResultHandler;
import cn.com.jtang.service.BackupService;
import cn.com.jtang.service.FileService;
import cn.com.jtang.service.ScheduleService;
import cn.com.jtang.util.*;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-09-21.
 */
@Transactional
@Service("backupService")
public class BackupServiceImpl implements BackupService {

    @Value("${fileserverpath}")
    private String fileServerPath;
    @Value("${jdbc.username}")
    private String username;
    @Value("${jdbc.password}")
    private String password;
    @Resource
    private BackupSaveMapper backupSaveMapper;
    @Resource
    private DailyBackMapper dailyBackMapper;
    @Resource
    private FullBackMapper fullBackMapper;
    @Resource
    private ScheduleService scheduleService;
    @Resource
    private FileService fileService;

    @Override
    public DailyBack selectByPrimaryKey(int week) {
        return dailyBackMapper.selectByPrimaryKey(week);
    }

    @Override
    public int insert(DailyBack dailyBack) {
        return dailyBackMapper.insert(dailyBack);
    }

    @Override
    public int updateByPrimaryKey(DailyBack dailyBack) {
        return dailyBackMapper.updateByPrimaryKeySelective(dailyBack);
    }

    @Override
    public List<DailyBack> selectAll() {
        DailyBackExample dailyBackExample = new DailyBackExample();
        dailyBackExample.setOrderByClause("week asc");
        return dailyBackMapper.selectByExample(dailyBackExample);
    }

    @Override
    public Map selectDailyMap() {
        MapResultHandler mapResultHandler = new MapResultHandler();
        dailyBackMapper.selectDailyMap(mapResultHandler);
        return mapResultHandler.getMappedResults();
    }

    @Override
    public Map selectFullMap() {
        MapResultHandler mapResultHandler = new MapResultHandler();
        fullBackMapper.selectFullMap(mapResultHandler);
        return mapResultHandler.getMappedResults();
    }

    @Override
    public int updateFullBackByPrimaryKey(FullBack fullBack) {
        return fullBackMapper.updateByPrimaryKeySelective(fullBack);
    }

    @Override
    public int insertFullBack(FullBack fullBack) {
        return fullBackMapper.insertSelective(fullBack);
    }

    @Override
    public void modifyDailyJob(List<Integer> hasWeeks, List<String> cronExpressions) {
        for (String cronExpression : cronExpressions) {
            int week = Integer.valueOf(cronExpression.substring(cronExpression.length() - 1));
            scheduleService.addJob(cronExpression, RecordUtil.DailyBack + week, RecordUtil.BackUPGroup);
            DailyBack dailyBack = new DailyBack();
            dailyBack.setWeek(week);
            dailyBack.setCronexpression(cronExpression);
            if (hasWeeks.contains(week)) {
                hasWeeks.remove(Integer.valueOf(week));
                updateByPrimaryKey(dailyBack);
            } else {
                insert(dailyBack);
            }
        }
        if (!hasWeeks.isEmpty()) {
            for (Integer week : hasWeeks) {
                try {
                    scheduleService.removeJob(RecordUtil.DailyBack + week, RecordUtil.BackUPGroup);
                } catch (SchedulerException e) {
                    e.printStackTrace();
                }
            }
            deleteDaily(hasWeeks);
        }
    }

    @Override
    public void modifyFullJob(List<Integer> hasWeeks, List<String> cronExpressions) {
        for (String cronExpression : cronExpressions) {
            int week = Integer.valueOf(cronExpression.substring(cronExpression.length() - 1));
            scheduleService.addJob(cronExpression, RecordUtil.FullBack + week, RecordUtil.FullBackUPGroup);
            FullBack fullBack = new FullBack();
            fullBack.setWeek(Integer.valueOf(week));
            fullBack.setCronexpression(cronExpression);
            if (hasWeeks.contains(week)) {
                updateFullBackByPrimaryKey(fullBack);
            } else {
                insertFullBack(fullBack);
            }

        }
        if (!hasWeeks.isEmpty()) {
            for (Integer week : hasWeeks) {
                try {
                    scheduleService.removeJob(RecordUtil.FullBack + week, RecordUtil.FullBackUPGroup);
                } catch (SchedulerException e) {
                    e.printStackTrace();
                }
            }
            deleteFull(hasWeeks);
        }
    }

    @Override
    public List<String> selectDailyWeeks() {
        return dailyBackMapper.selectDailyWeek();
    }

    @Override
    public List<String> selectFullWeek() {
        return fullBackMapper.selectFullWeek();
    }

    @Override
    public int deleteDailyByExample(DailyBackExample example) {
        return dailyBackMapper.deleteByExample(example);
    }

    @Override
    public int deleteFullByExample(FullBackExample example) {
        return fullBackMapper.deleteByExample(example);
    }

    @Override
    public int deleteDaily(List<Integer> weeks) {
        DailyBackExample example = new DailyBackExample();
        DailyBackExample.Criteria criteria = example.createCriteria();
        criteria.andWeekIn(weeks);
        return deleteDailyByExample(example);
    }

    @Override
    public int deleteFull(List<Integer> weeks) {
        FullBackExample example = new FullBackExample();
        FullBackExample.Criteria criteria = example.createCriteria();
        criteria.andWeekIn(weeks);
        return deleteFullByExample(example);
    }

    @Override
    public void executeCommand(String command, String param) throws IOException, InterruptedException {
        StringBuffer sb = new StringBuffer();
        //work directory
        String dir = this.getClass().getResource("/").getPath();
        System.out.println("rootPath:" + dir);
        /*File file = new File(dir + "/" + appid);
        if (file.exists()) {
            file.mkdirs();
        }*/
        //String commandPath = this.getClass().getResource("/script/backupnow.sh").getPath();
        //String sqlpath = dir + "/sql/recordms_" + System.currentTimeMillis() + ".sql";
        System.out.println("command:" + command);
        Process p = RuntimeUtils.exec(command, "", dir);
        p.waitFor();
        System.out.println("Waiting over.");
    }

    @Override
    public String exportDumpFile() throws IOException, InterruptedException {
        //work directory
        System.out.println("rootPath:" + fileServerPath);
        String sqlPrefix = fileServerPath.endsWith("/")?fileServerPath+ "sql":fileServerPath+"/sql";
        String sqlpath = sqlPrefix + "/recordms_" + System.currentTimeMillis() + ".sql";
        System.out.println("sqlpath:" + sqlpath);
        File file = new File(sqlPrefix);
        if (!file.exists()) {
            file.mkdirs();
        }
        StringBuffer sb = new StringBuffer();
        if("/".equals(File.separator)){
            String commandPath = this.getClass().getResource("/script/backupnow.sh").getPath();
            sb.append("sh ").append(commandPath).append(" -a ").append(username).append(" ").append(password).append(" ").append(sqlpath);
        }else{
            String commandPath = this.getClass().getResource("/script/backupnow.bat").getPath();
            sb.append(commandPath).append(" ").append(username).append(" ").append(password).append(" ").append(sqlpath);
        }
        executeCommand(sb.toString(),"");
        return sqlpath;
    }

    @Override
    public void backupNowAndSave(String description) throws IOException, InterruptedException {
        BackupSave backupSave = new BackupSave();
        backupSave.setId(IDGenerator.generator());
        backupSave.setSqlpath(exportDumpFile());
        backupSave.setCreatetime(new Date());
        backupSave.setDescription(description);
        backupSaveMapper.insertSelective(backupSave);
    }

    @Override
    public void deleteSql(String i) {
        BackupSave backupSave = backupSaveMapper.selectByPrimaryKey(i);
        fileService.removeFile(backupSave.getSqlpath());
        backupSaveMapper.deleteByPrimaryKey(i);
    }

    @Override
    public void revert(String sqlPath) throws IOException, InterruptedException {
        StringBuffer sb = new StringBuffer();
        if("/".equals(File.separator)){
            String commandPath = this.getClass().getResource("/script/revert.sh").getPath();
            sb.append("sh ").append(commandPath).append(" -a ").append(username).append(" ").append(password).append(" ").append(sqlPath);
        }else{
            String commandPath = this.getClass().getResource("/script/revert.bat").getPath();
            sb.append(commandPath).append(" ").append(username).append(" ").append(password).append(" ").append(sqlPath);
        }
        executeCommand(sb.toString(),"");
    }

    @Override
    public void excuteDaily() throws IOException, InterruptedException {
        StringBuffer sb = new StringBuffer();
        if("/".equals(File.separator)){
            String commandPath = this.getClass().getResource("/script/dailyback.sh").getPath();
            sb.append("sh ").append(commandPath).append(" -a ").append(username).append(" ").append(password);
        }else{
            String commandPath = this.getClass().getResource("/script/dailyback.bat").getPath();
            sb.append(commandPath).append(" ").append(username).append(" ").append(password);
        }
        executeCommand(sb.toString(),"");
    }

    @Override
    public void excuteFull() throws IOException, InterruptedException {
        StringBuffer sb = new StringBuffer();
        if("/".equals(File.separator)){
            String commandPath = this.getClass().getResource("/script/fullbackup.sh").getPath();
            sb.append("sh ").append(commandPath).append(" ").append(username).append(" ").append(password);
        }else{
            String commandPath = this.getClass().getResource("/script/fullbackup.bat").getPath();
            sb.append(commandPath).append(" ").append(username).append(" ").append(password);;
        }
        executeCommand(sb.toString(),"");
    }

    @Override
    public List<BackupSave> selectAllBackupSave() {
        return backupSaveMapper.selectByExample(new BackupSaveExample());
    }

    @Override
    public Page selectByExample(BackupSaveExample example, Page page) {
        page.retrievePage(backupSaveMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(backupSaveMapper.selectByExample(example));

        return page;
    }

    @Override
    public PageView selectPage(Integer pageNum, Integer pageSize) {
        BackupSaveExample example = new BackupSaveExample();
        example.setOrderByClause("createtime desc");
        Page pageObject = new Page(null, 0, (pageNum != null) ? pageNum : 1, (pageSize != null) ? pageSize : 10);
        return new PageView(selectByExample(example, pageObject));
    }

    @Override
    public BackupSave selectBackupSaveByPrimaryKey(String index) {
        return backupSaveMapper.selectByPrimaryKey(index);
    }
}
