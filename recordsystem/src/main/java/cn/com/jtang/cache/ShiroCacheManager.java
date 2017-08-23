package cn.com.jtang.cache;

import cn.com.jtang.cache.redis.RedisCache;
import org.apache.shiro.cache.AbstractCacheManager;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;

/**
 * Created by ZJUXP on 2016-05-12.
 */
public class ShiroCacheManager extends AbstractCacheManager {


    @Override
    protected Cache createCache(String name) throws CacheException {
        return new RedisCache("recordms_" + name);
    }
}
