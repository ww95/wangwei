package com.wangwei.bean;

/**
 create table books(
 #图书编号
 b_id int auto_increment primary key comment '图书编号',
 #图书名称
 b_name varchar(10) comment '图书名称',
 b_type int comment '图书类别',
 #图书读者
 b_creater varchar(10) comment '图书作者',
 #图书价格
 b_price double comment '图书价格',
 #图书描述
 b_info varchar(100) comment '图书描述',
 #图书图片路径
 b_img_path varchar(20) comment '图书图片路径'

 );
 */
public class Books {
    private Integer bId;
    private String bName;
    private Integer bType;
    private String bCreate;
    private Double bPrice;
    private Double jinhuo;
    private Double zhekou;
    private String bInfo;
    private String bPath;
    private Integer bNumber;
    private Catalog catalog;
    private Integer number;
    private Double totalJinhuo;

    @Override
    public String toString() {
        return "Books{" +
                "bId=" + bId +
                ", bName='" + bName + '\'' +
                ", bType=" + bType +
                ", bCreate='" + bCreate + '\'' +
                ", bPrice=" + bPrice +
                ", jinhuo=" + jinhuo +
                ", zhekou=" + zhekou +
                ", bInfo='" + bInfo + '\'' +
                ", bPath='" + bPath + '\'' +
                ", bNumber=" + bNumber +
                ", catalog=" + catalog +
                ", number=" + number +
                ", totalJinhuo=" + totalJinhuo +
                '}';
    }

    public Double getTotalJinhuo() {
        return totalJinhuo;
    }

    public void setTotalJinhuo(Double totalJinhuo) {
        this.totalJinhuo = totalJinhuo;
    }

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    public Integer getbType() {
        return bType;
    }

    public void setbType(Integer bType) {
        this.bType = bType;
    }

    public String getbCreate() {
        return bCreate;
    }

    public void setbCreate(String bCreate) {
        this.bCreate = bCreate;
    }

    public Double getbPrice() {
        return bPrice;
    }

    public void setbPrice(Double bPrice) {
        this.bPrice = bPrice;
    }

    public Double getJinhuo() {
        return jinhuo;
    }

    public void setJinhuo(Double jinhuo) {
        this.jinhuo = jinhuo;
    }

    public Double getZhekou() {
        return zhekou;
    }

    public void setZhekou(Double zhekou) {
        this.zhekou = zhekou;
    }

    public String getbInfo() {
        return bInfo;
    }

    public void setbInfo(String bInfo) {
        this.bInfo = bInfo;
    }

    public String getbPath() {
        return bPath;
    }

    public void setbPath(String bPath) {
        this.bPath = bPath;
    }

    public Integer getbNumber() {
        return bNumber;
    }

    public void setbNumber(Integer bNumber) {
        this.bNumber = bNumber;
    }

    public Catalog getCatalog() {
        return catalog;
    }

    public void setCatalog(Catalog catalog) {
        this.catalog = catalog;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

}
