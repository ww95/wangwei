package com.wangwei.bean;

import java.util.ArrayList;
import java.util.List;

public class Catalog {
    private int id;
    private String title;
    private Integer pid;
    private String info;

    private List<Catalog> children = new ArrayList<Catalog>();

    public List<Catalog> getChildren() {
        return children;
    }

    public void setChildren(List<Catalog> children) {
        this.children = children;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Catalog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", pid=" + pid +
                ", info='" + info + '\'' +
                ", children=" + children +
                '}';
    }
}
