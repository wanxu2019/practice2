package xjtu.dao;

import org.hibernate.Query;
import xjtu.model.SIPOCRecord;

import java.util.List;

/**
 * Created by Json Wan on 2017/7/20.
 */
public class SIPOCRecordDao extends GenericDao<SIPOCRecord> {

    public List<SIPOCRecord> getRecordsByUsername(String username){
        List<SIPOCRecord> list;
        Query query=getSession().createQuery("from SIPOCRecord record where record.userName=?");
        query.setString(0,username);
        list=query.list();
        return list;
    }

}
