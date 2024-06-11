package com.interior.model;

public class Receipt {

    private String receiptNo;
    private String date;
    private String desc;

    public Receipt() {
        this.receiptNo = "";
        this.date = "";
        this.desc = "";
    }

    public Receipt(String receiptNo, String date, String desc) {
        this.receiptNo = receiptNo;
        this.date = date;
        this.desc = desc;
    }

    public String getReceiptNo() {
        return receiptNo;
    }

    public String getDate() {
        return date;
    }

    public String getDesc() {
        return desc;
    }

    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String toString() {
        return "Receipt{" + "receiptNo=" + receiptNo + ", date=" + date + ", desc=" + desc + '}';
    }
}
