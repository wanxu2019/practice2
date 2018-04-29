package xjtu.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import xjtu.model.SIPOCRecord;
import xjtu.service.SIPOCRecordService;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class DetailAction extends BaseAction {
    private static final long serialVersionUID = 1L;

    @Autowired
    SIPOCRecordService sipocRecordService;

    List<SIPOCRecord> recordList;
    String name="anon";
    String sMessage="";
    String iMessage="";
    String pMessage="";
    String oMessage="";
    String cMessage="";

    SIPOCRecord record;

    List<String> sMessageList;
    List<String> iMessageList;
    List<String> pMessageList;
    List<String> oMessageList;
    List<String> cMessageList;
    int id=-1;


    public String index() {
        record=sipocRecordService.getDao().get(SIPOCRecord.class,id);
        if(record!=null) {
            showLog("record=" + record.getName());
            sMessageList = splitMessage(record.getsMessage());
            iMessageList = splitMessage(record.getiMessage());
            pMessageList = splitMessage(record.getpMessage());
            oMessageList = splitMessage(record.getoMessage());
            cMessageList = splitMessage(record.getcMessage());
        }
        return SUCCESS;
    }

    public List<String> splitMessage(String rawMessage){
        List<String> messageList=new ArrayList<String>();
        String[] messages=rawMessage.split("\\|\\|\\|");
        for(int i=0;i<messages.length;i++){
            messageList.add(messages[i]);
        }
        return messageList;
    }

    public String add() {
        SIPOCRecord record = new SIPOCRecord();
        record.setUserName(getUserName());
        record.setName(name);
        record.setsMessage(sMessage);
        record.setiMessage(iMessage);
        record.setpMessage(pMessage);
        record.setoMessage(oMessage);
        record.setcMessage(cMessage);
        sipocRecordService.add(record);
        return SUCCESS;
    }

    public String modify() {
        SIPOCRecord record =sipocRecordService.getDao().get(SIPOCRecord.class,id);
        record.setUserName(getUserName());
        record.setName(name);
        record.setsMessage(sMessage);
        record.setiMessage(iMessage);
        record.setpMessage(pMessage);
        record.setoMessage(oMessage);
        record.setcMessage(cMessage);
        sipocRecordService.update(record);
        try {
            inputStream = new ByteArrayInputStream("已保存！".getBytes("UTF-8"));
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getsMessage() {
        return sMessage;
    }

    public void setSMessage(String sMessage) {
        this.sMessage = sMessage;
    }

    public String getIMessage() {
        return iMessage;
    }

    public void setIMessage(String iMessage) {
        this.iMessage = iMessage;
    }

    public String getPMessage() {
        return pMessage;
    }

    public void setPMessage(String pMessage) {
        this.pMessage = pMessage;
    }

    public String getOMessage() {
        return oMessage;
    }

    public void setOMessage(String oMessage) {
        this.oMessage = oMessage;
    }

    public String getCMessage() {
        return cMessage;
    }

    public void setCMessage(String cMessage) {
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SIPOCRecord getRecord() {
        return record;
    }

    public void setRecord(SIPOCRecord record) {
        this.record = record;
    }

    public List<String> getSMessageList() {
        return sMessageList;
    }

    public void setSMessageList(List<String> sMessageList) {
        this.sMessageList = sMessageList;
    }

    public List<String> getIMessageList() {
        return iMessageList;
    }

    public void setIMessageList(List<String> iMessageList) {
        this.iMessageList = iMessageList;
    }

    public List<String> getPMessageList() {
        return pMessageList;
    }

    public void setPMessageList(List<String> pMessageList) {
        this.pMessageList = pMessageList;
    }

    public List<String> getOMessageList() {
        return oMessageList;
    }

    public void setOMessageList(List<String> oMessageList) {
        this.oMessageList = oMessageList;
    }

    public List<String> getCMessageList() {
        return cMessageList;
    }

    public void setCMessageList(List<String> cMessageList) {
        this.cMessageList = cMessageList;
    }
}
