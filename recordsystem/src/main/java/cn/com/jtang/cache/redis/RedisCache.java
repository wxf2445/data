package cn.com.jtang.cache.redis;

import cn.com.jtang.util.CachePool;
import cn.com.jtang.util.SerializeUtil;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import redis.clients.jedis.BinaryJedisCluster;

import java.util.*;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public class RedisCache implements Cache {

    /**
     * The ReadWriteLock.
     */
    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
    private BinaryJedisCluster redisClient = CachePool.getInstance();
    private Set<String> keys = new HashSet<String>();
    private String id;
    private Map<String, String> dd = new HashMap<>();

    /**
     * Constructs ...
     *
     * @param id
     */
    public RedisCache(final String id) {
        if (id == null) {
            throw new IllegalArgumentException("���봫��ID");
        }

        System.out.println("RedisCache:id=" + id);
        this.id = id;

    }

    public String getCommonKey(Object oldKey) {
        return id + "_" + oldKey;
    }

    @Override
    public Object get(Object key) throws CacheException {
        String k = getCommonKey(key);
        Object value = SerializeUtil.unserialize(redisClient.get(k.toString().getBytes()));


        return value;
    }

    @Override
    public Object put(Object key, Object value) throws CacheException {

        String k = getCommonKey(key);
        Object previousValue = get(key);
        if (!keys.contains(k.toString())) {
            keys.add(k.toString());
        }
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>putObject:" + key + "=" + value);
        redisClient.set(k.toString().getBytes(), SerializeUtil.serialize(value));
        redisClient.expire(k.toString().getBytes(), CachePool.expireTime);
        return previousValue;
    }

    @Override
    public Object remove(Object key) throws CacheException {
        String k = getCommonKey(key);
        keys.remove(k.toString().getBytes());

        return redisClient.del(k.toString().getBytes());
    }

    @Override
    public void clear() {

        // TODO Auto-generated method stub
        for (String key : keys) {
            String k = getCommonKey(key);
            redisClient.del(k.getBytes());
        }

        keys.clear();
    }

    @Override
    public int size() {
        return keys.size();
    }

    @Override
    public Set keys() {
        return keys;
    }

    @Override
    public Collection values() {
        return null;
    }

}


//~ Formatted by Jindent --- http://www.jindent.com
