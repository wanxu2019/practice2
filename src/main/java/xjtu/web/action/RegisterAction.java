package xjtu.web.action;

/**
 * Created by Json Wan on 2017/2/26.
 * Description:注册操作
 */

public class RegisterAction extends BaseAction  {
    private static final long serialVersionUID = 1L;


    private String username;
    private String password;

    public String register() {
        showLog("username="+getUserName());
        return SUCCESS;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
