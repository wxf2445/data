package cn.com.jtang.util;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import redis.clients.jedis.BinaryJedisCluster;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public final class CachePool {
    public final static int expireTime = 1800;
    static Map<String, Jedis> jediss = null;
    static BinaryJedisCluster pool;
    private static Properties p;

    static {
        JedisPoolConfig config = new JedisPoolConfig();

        config.setMaxIdle(100);
        config.setMaxWaitMillis(1000l);

        InputStream inputStream = CachePool.class.getClassLoader().getResourceAsStream("redis.properties");

        p = new Properties();

        try {
            p.load(inputStream);
        } catch (IOException e) {

            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private CachePool() {
    }

    /**
     * Method description getInstance
     *
     * @return BinaryJedisCluster
     */
    public static synchronized BinaryJedisCluster getInstance() {
        if (pool == null) {
            String serverInfo = p.getProperty("redis.server.info");
            Set<HostAndPort> set = new HashSet<HostAndPort>();
            String ipPort[] = serverInfo.split(",");
            int len = ipPort.length;

            for (int i = 0; i < len; i++) {
                String server[] = ipPort[i].split(":");

                set.add(new HostAndPort(server[0], Integer.parseInt(server[1])));
            }

            // Jedis Cluster will attempt to discover cluster nodes
            GenericObjectPoolConfig config = new GenericObjectPoolConfig();

            pool = new BinaryJedisCluster(set,
                    Integer.parseInt(p.getProperty("redis.timeout")),
                    Integer.valueOf(p.getProperty("redis.maxRedirections")),
                    config);
        }

        return pool;
    }

    /**
     * Method description getJedisMap
     *
     * @return Map<String,Jedis>
     */
    public static synchronized Map<String, Jedis> getJedisMap() {
        if (jediss == null) {
            jediss = new HashMap<String, Jedis>();

            String serverInfo = p.getProperty("redis.server.info");
            String ipPort[] = serverInfo.split(",");
            int len = ipPort.length;

            for (int i = 0; i < len; i++) {
                String server[] = ipPort[i].split(":");
                Jedis jedis = new Jedis(server[0], Integer.parseInt(server[1]));

                jediss.put(server[1], jedis);
            }
        }

        return jediss;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
