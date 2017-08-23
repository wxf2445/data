package cn.com.jtang.quartz;

import cn.com.jtang.po.ScheduleJob;
import cn.com.jtang.service.BackupService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import javax.annotation.Resource;
import java.io.IOException;

public class QuartzJobFactoryImpl implements Job {

    @Resource
    private BackupService backupService;

    @Override
    public void execute(JobExecutionContext context)
            throws JobExecutionException {
        // TODO Auto-generated method stub

        System.out.println("任务开始运行");
        ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
        String jobname = scheduleJob.getJobName();
        if (jobname.startsWith("daily")) {
            try {
                backupService.excuteDaily();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } else if (jobname.startsWith("full")) {
            try {
                backupService.excuteFull();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        /*List<DeviceSensor> deviceSensors = null;
        DeviceSensorExample deviceSensorExample = new DeviceSensorExample();
        DeviceSensorExample.Criteria criteria = deviceSensorExample.createCriteria();
        if ("device_lessthan1min".equals(jobname)) {
            criteria.andRegulatetimeLessThanOrEqualTo(60L);
        } else if ("device_greaterthan1minlessthan1hour".equals(jobname)) {
            criteria.andRegulatetimeLessThanOrEqualTo(3600L);
            criteria.andRegulatetimeGreaterThan(60L);
        } else if ("device_greaterthan1hourlessthan1day".equals(jobname)) {
            criteria.andRegulatetimeLessThanOrEqualTo(24 * 3600L);
            criteria.andRegulatetimeGreaterThan(3600L);
        }

        deviceSensors = deviceSensorService.selectDeviceByExample(deviceSensorExample);
        for (DeviceSensor deviceSensor : deviceSensors) {
            long regulartime = scheduleJob.getSimpletime() * 1000;
            long starttime = scheduleJob.getStarttime();

            int status = deviceSensor.getStatus();
            String deviceid = deviceSensor.getDeviceid();
            List<SensorView> sensorViews = deviceSensor.getSensors();
            long now = System.currentTimeMillis();

            Device device = new Device();
            device.setDeviceid(deviceid);
            for (SensorView sensorView : sensorViews) {
                Date date = sensorView.getGathertime();
                if (date == null) {
                    long interval = now - starttime;
                    if (regulartime < interval) {
                        device.setStatus(0);
                        deviceService.updateByPrimaryKeySelective(device);
                        break;
                    } else if (status == 0) {
                        device.setStatus(1);
                        deviceService.updateByPrimaryKeySelective(device);
                    }
                } else {
                    long interval = now - date.getTime();
                    if (regulartime < interval) {
                        device.setStatus(0);
                        deviceService.updateByPrimaryKeySelective(device);
                        break;
                    } else if (status == 0) {
                        device.setStatus(1);
                        deviceService.updateByPrimaryKeySelective(device);
                    }
                }
            }
        }*/

        System.out.println("任务名称 = [" + scheduleJob.getJobName() + "]");

    }

}