package cn.com.jtang.util;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

import java.util.HashSet;
import java.util.Set;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public class RedisClusterClient {
    private String serverInfo =
        "172.30.129.145:7379,172.30.129.145:7380,172.30.129.146:7379,172.30.129.146:7380,172.30.129.147:7379,172.30.129.147:7380";

    /**
     * Method description test
     *
     */
    public void test() {
        Set<HostAndPort> jedisClusterNodes = getClusterInfo(serverInfo);

        // Jedis Cluster will attempt to discover cluster nodes automatically
        JedisCluster jc = new JedisCluster(jedisClusterNodes);

        jc.set("foo", "bar");

        String value = jc.get("foo");

        System.out.println(value);
    }

    /**
     * Method description getClusterInfo
     *
     *
     * @param serverInfo
     *
     * @return Set<HostAndPort> 
     */
    private Set<HostAndPort> getClusterInfo(String serverInfo) {
        Set<HostAndPort> set = new HashSet<HostAndPort>();

        if ((serverInfo == null) || (serverInfo.length() == 0)) {
            throw new RuntimeException("The serverInfo can not be empty");
        }

        String ipPort[] = serverInfo.split(",");
        int    len      = ipPort.length;

        for (int i = 0; i < len; i++) {
            String server[] = ipPort[i].split(":");

            set.add(new HostAndPort(server[0], Integer.parseInt(server[1])));
        }

        return set;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
