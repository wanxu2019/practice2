package xjtu.service;

import org.springframework.beans.factory.annotation.Autowired;
import xjtu.dao.SIPOCRecordDao;
import xjtu.model.SIPOCRecord;

import java.util.List;

/**
 * Created by Json Wan on 2017/7/20.
 */
public class SIPOCRecordService {
    @Autowired
    SIPOCRecordDao dao;
    public List<SIPOCRecord> getRecordsByUsername(String userName){
        return dao.getRecordsByUsername(userName);
    }
    public void add(SIPOCRecord record){
        dao.add(record);
    }
    public void delete(SIPOCRecord record){
        dao.delete(record);
    }
    public void deleteById(int id){
        dao.deleteById(SIPOCRecord.class,id);
    }
    public void update(SIPOCRecord record){
        dao.update(record);
    }


    public SIPOCRecordDao getDao() {
        return dao;
    }

    public void setDao(SIPOCRecordDao dao) {
        this.dao = dao;
    }
}
