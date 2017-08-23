package cn.com.jtang.service;

import cn.com.jtang.po.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-09-21.
 */
public interface BackupService {

    DailyBack selectByPrimaryKey(int week);

    int insert(DailyBack dailyBack);

    int updateByPrimaryKey(DailyBack dailyBack);

    List<DailyBack> selectAll();

    Map selectDailyMap();

    Map selectFullMap();

    int updateFullBackByPrimaryKey(FullBack fullBack);

    int insertFullBack(FullBack fullBack);

    void modifyDailyJob(List<Integer> hasWeeks, List<String> cronExpressions);

    void modifyFullJob(List<Integer> hasWeeks, List<String> cronExpressions);

    List<String> selectDailyWeeks();

    List<String> selectFullWeek();

    int deleteDailyByExample(DailyBackExample example);

    int deleteFullByExample(FullBackExample example);

    int deleteDaily(List<Integer> weeks);

    int deleteFull(List<Integer> weeks);

    void executeCommand(String commandPath, String param) throws IOException, InterruptedException;

    String exportDumpFile() throws IOException, InterruptedException;

    void backupNowAndSave(String description) throws IOException, InterruptedException;

    void deleteSql(String i);

    void revert(String i) throws IOException, InterruptedException;

    void excuteDaily() throws IOException, InterruptedException;

    void excuteFull() throws IOException, InterruptedException;

    List<BackupSave> selectAllBackupSave();

    Page selectByExample(BackupSaveExample example, Page page);

    PageView selectPage(Integer pageNum, Integer pageSize);

    BackupSave selectBackupSaveByPrimaryKey(String index);
}
