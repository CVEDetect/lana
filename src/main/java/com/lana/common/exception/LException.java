package com.lana.common.exception;

/**
 * @auther liuyulet
 * @date 2022/9/8 23:26
 */
public class LException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    private String msg;
    private int code = 500;

    public LException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public LException(String msg, Throwable e) {
        super(msg, e);
        this.msg = msg;
    }

    public LException(String msg, int code) {
        super(msg);
        this.msg = msg;
        this.code = code;
    }

    public LException(String msg, int code, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }


}
