package com.wangwei.bean;

import lombok.Data;

/**
 * create table buy_books(
 *     bbId int primary key auto_increment,
 *     bookId int ,
 *     bstatus int,
 *     bbnumber int default 1,
 *     binfo varchar(100)
 * );
 */
@Data
public class BuyBook {
    private Integer id;
    private Integer BId;
    private String bbOrder;
    private Integer user;
    private Integer status;
    private Integer number;
    private String info;
    private Books books;
    private Account account;
    private Integer isPay;
    private Double totial;
    private Integer sumTotail;
    private Integer sumNumber;
}
