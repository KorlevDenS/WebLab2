package com.example.weblab2s.bean;

import com.example.weblab2s.servlet.Point;

import java.io.Serializable;

public class Component implements Serializable {
    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    private String x;

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }

    private String y;

    public String getR() {
        return r;
    }

    public void setR(String r) {
        this.r = r;
    }

    private String r;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    private String result;

    public Point getPoint() {
        return point;
    }

    public void setPoint(Point point) {
        this.point = point;
    }

    private Point point;

    public Component(Point point) {
        this.x = String.valueOf(point.getX());
        this.y = String.valueOf(point.getY());
        this.r = String.valueOf(point.getR());
        this.result = point.getResult();
        this.point = point;
    }

}