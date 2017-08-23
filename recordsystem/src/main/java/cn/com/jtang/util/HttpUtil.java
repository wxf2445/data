package cn.com.jtang.util;

import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public class HttpUtil {

    // private static HttpClient httpClient = new DefaultHttpClient(new
    // ThreadSafeClientConnManager());

    /**
     * Method description post
     *
     *
     * @param url
     * @param httpEntity
     * @param json
     *
     * @return String 
     */
    public static String post(String url, HttpEntity httpEntity, boolean json) {

        // ����Ĭ�ϵ� HttpClient ʵ��
        HttpPost httpPost = new HttpPost(url);

        if (json) {
            httpPost.setHeader("Content-Type", "application/json");
        }

        /*
         * List<NameValuePair> formParams = new ArrayList<NameValuePair>();
         * formParams.add(new BasicNameValuePair("username", "admin"));
         * formParams.add(new BasicNameValuePair("password", "123456"));
         */
        HttpClient           httpClient = new DefaultHttpClient();
        UrlEncodedFormEntity urlEncodedFormEntity;

        try {

            // urlEncodedFormEntity = new UrlEncodedFormEntity(formParams,
            // "UTF-8");
            httpPost.setEntity(httpEntity);

            HttpResponse response = httpClient.execute(httpPost);
            int          code     = response.getStatusLine().getStatusCode();

            System.out.println("code" + code);

            if (code == 200) {
                String entity = EntityUtils.toString(response.getEntity(), "UTF-8");

                System.out.println("entity" + entity);

                return entity;
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

            // �ر����ӣ��ͷ���Դ
            httpClient.getConnectionManager().shutdown();
        }

        return "";
    }

    /*
     */

    /**
     * Method description get
     *
     *
     * @param url
     *
     * @return JSONObject 
     */
    public static JSONObject get(String url) {
        JSONObject content    = null;
        HttpClient httpClient = new DefaultHttpClient();

        try {
            HttpGet      httpget  = new HttpGet(url);
            HttpResponse response = httpClient.execute(httpget);
            int          code     = response.getStatusLine().getStatusCode();

            if (code == 200) {
                String entity = EntityUtils.toString(response.getEntity(), "UTF-8");

                content = JSONObject.parseObject(entity);
            }

            httpget.abort();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            httpClient.getConnectionManager().shutdown();
        }

        System.out.println("content:" + content);

        return content;
    }

    /**
     * Method description getString
     *
     *
     * @param url
     *
     * @return String 
     */
    public static String getString(String url) {
        String     content    = "";
        HttpClient httpClient = new DefaultHttpClient();

        try {
            HttpGet      httpget  = new HttpGet(url);
            HttpResponse response = httpClient.execute(httpget);
            int          code     = response.getStatusLine().getStatusCode();

            if (code == 200) {
                content = EntityUtils.toString(response.getEntity(), "UTF-8");
            }

            httpget.abort();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            httpClient.getConnectionManager().shutdown();
        }

        System.out.println("content:" + content);

        return content;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
