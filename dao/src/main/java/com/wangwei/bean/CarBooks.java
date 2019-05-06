package com.wangwei.bean;

import lombok.Data;

@Data
public class CarBooks {
    private int id;
    private int userid;
    private int booksid;
    private Account account;
    private Books books;
}
