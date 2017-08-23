package cn.com.jtang.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public class ApplicationUtil implements ApplicationContextAware {
    private static ApplicationContext applicationContext;

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {

        // TODO Auto-generated method stub
        ApplicationUtil.applicationContext = applicationContext;
    }

    /**
     * Method description getBean
     *
     *
     * @param name
     *
     * @return Object 
     */
    public static Object getBean(String name) {
        return applicationContext.getBean(name);
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
