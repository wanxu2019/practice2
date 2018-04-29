package xjtu.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Json Wan on 2017/7/20.
 */
@Entity
@Table(name="SIPOC_S_Data")
public class SIPOCRecord {
    int id;
    String name;
    String userName;
    String sMessage;
    String iMessage;
    String pMessage;
    String oMessage;
    String cMessage;

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getsMessage() {
        return sMessage;
    }

    public void setsMessage(String sMessage) {
        this.sMessage = sMessage;
    }

    public String getiMessage() {
        return iMessage;
    }

    public void setiMessage(String iMessage) {
        this.iMessage = iMessage;
    }

    public String getpMessage() {
        return pMessage;
    }

    public void setpMessage(String pMessage) {
        this.pMessage = pMessage;
    }

    public String getoMessage() {
        return oMessage;
    }

    public void setoMessage(String oMessage) {
        this.oMessage = oMessage;
    }

    public String getcMessage() {
        return cMessage;
    }

    public void setcMessage(String cMessage) {
        this.cMessage = cMessage;
    }
}
