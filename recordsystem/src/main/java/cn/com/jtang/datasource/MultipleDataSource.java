package cn.com.jtang.datasource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * Created by ZJUXP on 2016-03-18.
 */
public class MultipleDataSource extends AbstractRoutingDataSource {
    private static final ThreadLocal<String> dataSourceKey = new InheritableThreadLocal<String>();

    public static Object getDataSourceKey() {
        return dataSourceKey.get();
    }

    /**
     * Method description setDataSourceKey
     *
     * @param dataSource
     */
    public static void setDataSourceKey(String dataSource) {
        dataSourceKey.set(dataSource);
    }

    @Override
    protected Object determineCurrentLookupKey() {
        return dataSourceKey.get();
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
