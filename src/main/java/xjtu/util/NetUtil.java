package xjtu.util;

import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

/**
 * Created by Json Wan on 2017/6/1.
 * Description:
 */
public class NetUtil {
    public static final String KEY_STATUS="status";
    public static final String KEY_MESSAGE="message";
    public static final String KEY_DATA="data";
    public static String getMsg(int status,String message,String data){
        JSONObject object=new JSONObject();
        object.put(KEY_STATUS, status);
        object.put(KEY_MESSAGE, message);
        object.put(KEY_DATA, data);
        return object.toString();
    }
    public static byte[] getBytesMsg(int status,String message,String data) throws UnsupportedEncodingException {
        JSONObject object=new JSONObject();
        object.put(KEY_STATUS, status);
        object.put(KEY_MESSAGE, message);
        object.put(KEY_DATA, data);
        return object.toString().getBytes("UTF-8");
    }
}
