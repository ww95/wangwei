package com.wangwei.bean;

import lombok.Data;

@Data
public class CollectionBook {
    private int id;
    private int booksId;
    private int userId;
    private Books books;
    private Account account;
}
