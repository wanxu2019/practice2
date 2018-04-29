package xjtu.util;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * Created by Json Wan on 2017/2/26.
 * Description:密码加密工具类
 */
public class PasswordHelper {

    @Autowired
    private RandomNumberGenerator randomNumberGenerator;
    private String algorithmName = "md5";
    private int hashIterations = 2;

    public void setRandomNumberGenerator(RandomNumberGenerator randomNumberGenerator) {
        this.randomNumberGenerator = randomNumberGenerator;
    }

    public void setAlgorithmName(String algorithmName) {
        this.algorithmName = algorithmName;
    }

    public void setHashIterations(int hashIterations) {
        this.hashIterations = hashIterations;
    }

}
