package cn.com.jtang.service;


import org.quartz.SchedulerException;

public interface ScheduleService {

	public void initial();

	public void addJob(String cronExpression,String name,String group);

	public void removeJob(String name,String group) throws SchedulerException;
	
}
