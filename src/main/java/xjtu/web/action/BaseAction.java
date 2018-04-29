package xjtu.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by Json Wan on 2017/4/28.
 * Description:
 */
public class BaseAction extends ActionSupport implements SessionAware {

    private String username;

    Map<String,Object> map;
    //第二种获取Session的方式
    public void setSession(Map<String, Object> map) {
        this.map=map;
        if(map!=null) {
            Iterator<String> iterator=map.keySet().iterator();
            while(iterator.hasNext()){
                String key=iterator.next();
                showLog(key + "==>" + map.get(key));
            }
        }else{
            showLog("map is null!");
        }

    }

    /**
     * 获取从cas服务端返回的用户名
     * @return
     */
    protected String getUserName(){
        //第一种获取Session的方式
//        HttpSession session = ServletActionContext.getRequest().getSession();
//        Enumeration<Object> names=session.getAttributeNames();
//        while(names.hasMoreElements()){
//            String name=names.nextElement().toString();
//            System.out.println(name + "==>" + session.getAttribute(name));
//        }

        Object rawUserName=map.getOrDefault("org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY",null);
        if(rawUserName==null){
            return null;
        }
        int commaIndex=rawUserName.toString().indexOf(",");
        if(commaIndex<0)
            return null;
        String username=rawUserName.toString().substring(0,commaIndex);
        //showLog("from session :username="+username);
        ActionContext cxt = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest)cxt.get(ServletActionContext.HTTP_REQUEST);
        request.setAttribute("username",username);
        return username;
    }


    protected boolean isAnon(){
        if(getUsername().equals("anon")){
            return true;
        }
        return false;
    }

    public void showLog(String message) {
        System.out.println(this.getClass().getSimpleName()+":"+message);
    }

//getter  &&  setter
    public String getUsername() {
        return getUserName();
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
