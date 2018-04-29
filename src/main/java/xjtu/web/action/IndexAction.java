package xjtu.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import xjtu.model.SIPOCRecord;
import xjtu.service.SIPOCRecordService;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class IndexAction extends BaseAction {
    private static final long serialVersionUID = 1L;

    @Autowired
    SIPOCRecordService sipocRecordService;

    List<SIPOCRecord> recordList;
    String name;
    String sMessage;
    String iMessage;
    String pMessage;
    String oMessage;
    String cMessage;

    public String index() {

        //测试添加
//        SIPOCRecord record = new SIPOCRecord();
//        record.setUserName(getUserName());
//        record.setName("test");
//        record.setsMessage("test");
//        record.setiMessage("test");
//        record.setpMessage("test");
//        record.setoMessage("test");
//        record.setcMessage("test");
//        sipocRecordService.add(record);

        recordList = sipocRecordService.getRecordsByUsername(getUserName());
        showLog("recordList.size=" + recordList.size());

        return SUCCESS;
    }

    public String addRecord() {
        SIPOCRecord record = new SIPOCRecord();
        record.setUserName(getUserName());
        record.setName(name);
        record.setsMessage(sMessage==null?"":sMessage);
        record.setiMessage(iMessage==null?"":iMessage);
        record.setpMessage(pMessage==null?"":pMessage);
        record.setoMessage(oMessage==null?"":oMessage);
        record.setcMessage(cMessage==null?"":cMessage);
        sipocRecordService.add(record);
        try {
            inputStream = new ByteArrayInputStream("已添加！".getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    int recordId;
    InputStream inputStream;

    public String deleteRecord() {
        sipocRecordService.deleteById(recordId);
        try {
            inputStream = new ByteArrayInputStream("删除成功！".getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    //setter and getter
    public List<SIPOCRecord> getRecordList() {
        return recordList;
    }

    public void setRecordList(List<SIPOCRecord> recordList) {
        this.recordList = recordList;
    }

    public SIPOCRecordService getSipocRecordService() {
        return sipocRecordService;
    }

    public void setSipocRecordService(SIPOCRecordService sipocRecordService) {
        this.sipocRecordService = sipocRecordService;
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

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
