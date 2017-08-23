package com.softkey;

import java.io.File;
import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import cn.com.jtang.util.SoftKeyUtil;


@Component("SoftKeyService")
public class SoftKeyService implements ApplicationListener<ContextRefreshedEvent> {

    @Value("${fileserverpath}")
    private String ROOT_PATH;
    public boolean keyright;
	/**
	* 当一个ApplicationContext被初始化或刷新触发
	*/
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		keyright = false;
		if(new SoftKeyUtil().checkKey(ROOT_PATH+"softkey/jsyunew3.dll")){
			keyright = true;
		}
		System.out.println("spring容易初始化完毕================================================");
		MyThread myThread = new MyThread(this);
		Thread thread = new Thread(myThread);  
		thread.start();
	}
	public class MyThread  implements Runnable { 
		SoftKeyService softKeyService;
		public MyThread(SoftKeyService softKeyService){
			this.softKeyService = softKeyService;
		}
		public void run() {  
			Timer timer = new Timer();
			TimerTask task = new TimerTask() {
    			@Override
    			public void run() {
    				if(softKeyService.keyright){
    					if(new SoftKeyUtil().excistKey(ROOT_PATH+"softkey/jsyunew3.dll")){
    						createLock();
    					}else{
        					softKeyService.keyright = false;
    						deleteLock();
    					}
    				}else{
        				if(new SoftKeyUtil().checkKey(ROOT_PATH+"softkey/jsyunew3.dll")){
        					softKeyService.keyright = true;
        					createLock();
        				}else{
        					deleteLock();
        				};
    				}
    			}
    		};
    		timer.schedule(task, 2000, 2000);
		}  
	}  
	public void createLock(){
		File file = new File(ROOT_PATH+"softkey/lock.key");
		if(!file.exists())
			try {
				file.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public void deleteLock(){
		File file = new File(ROOT_PATH+"softkey/lock.key");
		if(file.exists())
			file.delete();
	}

}
