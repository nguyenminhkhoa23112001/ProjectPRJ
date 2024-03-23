package entity;

import java.util.Date;

public class Invoice {

    private int maHD;
    private int accountID;
    private double tongGia;
    private Date ngayXuat;
    private String context;
    private String typepay;
    private int phone;
    private String delivery;
    private String name;

    public Invoice() {
    }

    public Invoice(int maHD, int accountID, double tongGia, Date ngayXuat, String context, String typepay, int phone, String delivery, String name) {
        this.maHD = maHD;
        this.accountID = accountID;
        this.tongGia = tongGia;
        this.ngayXuat = ngayXuat;
        this.context = context;
        this.typepay = typepay;
        this.phone = phone;
        this.delivery = delivery;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Invoice{" + "maHD=" + maHD + ", accountID=" + accountID + ", tongGia=" + tongGia + ", ngayXuat=" + ngayXuat + ", context=" + context + ", typepay=" + typepay + ", phone=" + phone + ", delivery=" + delivery + ", name=" + name + '}';
    }

    public int getMaHD() {
        return maHD;
    }

    public void setMaHD(int maHD) {
        this.maHD = maHD;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public double getTongGia() {
        return tongGia;
    }

    public void setTongGia(double tongGia) {
        this.tongGia = tongGia;
    }

    public Date getNgayXuat() {
        return ngayXuat;
    }

    public void setNgayXuat(Date ngayXuat) {
        this.ngayXuat = ngayXuat;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getTypepay() {
        return typepay;
    }

    public void setTypepay(String typepay) {
        this.typepay = typepay;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
