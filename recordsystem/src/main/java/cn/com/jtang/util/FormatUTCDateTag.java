package cn.com.jtang.util;

import org.apache.taglibs.standard.tag.rt.fmt.FormatDateTag;

import javax.servlet.jsp.JspTagException;
import java.util.Date;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public class FormatUTCDateTag extends FormatDateTag {
    private static final long serialVersionUID = -2312310581852395045L;
    private long              valueUTC;

    /**
     * Method description getValueUTC
     *
     *
     * @return long 
     */
    public long getValueUTC() {
        return valueUTC;
    }

    /**
     * Method description setValueUTC
     *
     *
     * @param valueUTC
     *
     * @throws JspTagException
     */
    public void setValueUTC(long valueUTC) throws JspTagException {
        this.valueUTC = valueUTC;

        Date utc = new Date(valueUTC);

        this.setValue(utc);
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
