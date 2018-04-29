package xjtu.model;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Json Wan on 2017/2/26.
 * Description:BaseModel
 */
@MappedSuperclass
public class BaseModel {
    protected boolean maintenance;
    protected boolean delete;
    protected Timestamp version;
    protected String createId;
    protected Date createDate;
    protected String updateId;
    protected Date updateDate;

    public BaseModel(){

    }
    public BaseModel(String createId){
        this.createId=createId;
        maintenance=true;
        delete =false;
        version=new Timestamp(System.currentTimeMillis());
        createDate=new Date(System.currentTimeMillis());
    }
    public boolean isMaintenance() {
        return maintenance;
    }

    @Column(name = "ndelete")
    public boolean isDelete() {
        return delete;
    }

    public Timestamp getVersion() {
        return version;
    }

    public String getCreateId() {
        return createId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public String getUpdateId() {
        return updateId;
    }

    public Date getUpdateDate() {
        return updateDate;
    }
    public void setMaintenance(boolean maintenance) {
        this.maintenance = maintenance;
    }

    public void setDelete(boolean delete) {
        this.delete = delete;
    }

    public void setVersion(Timestamp version) {
        this.version = version;
    }

    public void setCreateId(String createId) {
        this.createId = createId;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setUpdateId(String updateId) {
        this.updateId = updateId;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
