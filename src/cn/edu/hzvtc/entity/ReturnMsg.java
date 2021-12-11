package cn.edu.hzvtc.entity;


import java.util.HashMap;
import java.util.Map;

/**
 *用于标识异步请求操作
 */
public class ReturnMsg {
    private Integer code;       //状态码    100-操作成功  200-操作失败
    private String msg;         //提示消息

    private Map<String,Object> extend = new HashMap<>();

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public static ReturnMsg success(){
        ReturnMsg returnMsg = new ReturnMsg();
        returnMsg.setCode(100);
        returnMsg.setMsg("操作成功！");
        return returnMsg;
    }

    public static ReturnMsg fail(){
        ReturnMsg returnMsg = new ReturnMsg();
        returnMsg.setCode(200);
        returnMsg.setMsg("操作失败！");
        return returnMsg;
    }

    public static ReturnMsg except(){
        ReturnMsg returnMsg = new ReturnMsg();
        returnMsg.setCode(300);
        returnMsg.setMsg("出现异常！");
        return returnMsg;
    }

    public ReturnMsg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }


}
