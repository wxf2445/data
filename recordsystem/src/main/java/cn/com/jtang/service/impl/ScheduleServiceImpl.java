package cn.com.jtang.service.impl;

import cn.com.jtang.po.ScheduleJob;
import cn.com.jtang.quartz.QuartzJobFactoryImpl;
import cn.com.jtang.service.ScheduleService;
import org.quartz.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("scheduleService")
@Transactional
public class ScheduleServiceImpl implements ScheduleService {

    @Resource
    private Scheduler scheduler;

    @Override
    public void initial() {
        // TODO Auto-generated method stub
        try {
            List<String> groupnames = scheduler.getJobGroupNames();

            if (groupnames == null || groupnames.size() == 0) {
                //小于等于1分钟
                ScheduleJob scheduleJob1 = new ScheduleJob();
                scheduleJob1.setJobName("device_outdate");
                scheduleJob1.setJobGroup("checkdevicerunstats");
                scheduleJob1.setJobStatus("1");
                scheduleJob1.setSimpletime(10);
                scheduleJob1.setDesc("检测设备运行状态（运行还是脱机）");
                scheduleJob1.setStarttime(System.currentTimeMillis());

                addJob(scheduleJob1);
            }
        } catch (SchedulerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void addJob(String cronExpression, String name, String group) {
        ScheduleJob scheduleJob1 = new ScheduleJob();
        scheduleJob1.setJobName(name);
        scheduleJob1.setJobGroup(group);
        scheduleJob1.setJobStatus("1");
        scheduleJob1.setCronExpression(cronExpression);
        addJob(scheduleJob1);
    }

    @Override
    public void removeJob(String name, String group) throws SchedulerException {
        scheduler.deleteJob(JobKey.jobKey(name, group));
    }

    private void addJob(ScheduleJob job) {
        // TODO Auto-generated method stub
        TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());

        //获取trigger，即在spring配置文件中定义的 bean id="myTrigger"
        try {
            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
            Date at = new Date(System.currentTimeMillis() + 60 * 1000);
            int simpletime = new Long(job.getSimpletime()).intValue();
            //不存在，创建一个
            if (null == trigger) {
                JobDetail jobDetail = JobBuilder.newJob(QuartzJobFactoryImpl.class)
                        .withIdentity(job.getJobName(), job.getJobGroup()).build();
                jobDetail.getJobDataMap().put("scheduleJob", job);

                trigger = TriggerBuilder.newTrigger()
                        .withIdentity(job.getJobName(), job.getJobGroup())
                        //.startAt(at) // get the next even-hour (minutes and seconds zero ("00:00"))
                        .withSchedule(CronScheduleBuilder.cronSchedule(job.getCronExpression()).withMisfireHandlingInstructionFireAndProceed())
                        .build();
/*
                trigger = TriggerBuilder.newTrigger()
                        .withIdentity(job.getJobName(), job.getJobGroup())
                        .startAt(at) // get the next even-hour (minutes and seconds zero ("00:00"))
                        .withSchedule(SimpleScheduleBuilder.simpleSchedule()
                                .withIntervalInSeconds(simpletime)
                                .repeatForever())
                        .build();
*/

                scheduler.scheduleJob(jobDetail, trigger);
            } else {

                //按新的cronExpression表达式重新构建trigger
                trigger = TriggerBuilder.newTrigger()
                        .withIdentity(job.getJobName(), job.getJobGroup())
                        //.startAt(at) // get the next even-hour (minutes and seconds zero ("00:00"))
                        .withSchedule(CronScheduleBuilder.cronSchedule(job.getCronExpression()).withMisfireHandlingInstructionFireAndProceed())
                        .build();
/*
                trigger = trigger.getTriggerBuilder()
                        .withIdentity(job.getJobName(), job.getJobGroup())
                        .startAt(at) // get the next even-hour (minutes and seconds zero ("00:00"))
                        .withSchedule(SimpleScheduleBuilder.simpleSchedule()
                                .withIntervalInSeconds(simpletime)
                                .repeatForever())
                        .build();
*/

                //按新的trigger重新设置job执行
                scheduler.rescheduleJob(triggerKey, trigger);
            }
        } catch (SchedulerException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
