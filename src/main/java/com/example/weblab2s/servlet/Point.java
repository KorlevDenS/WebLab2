package com.example.weblab2s.servlet;

import java.io.Serializable;
import java.util.Map;

public class Point implements Serializable {

    public static final Map<Double, String> colorMap = Map.of(1.0, "rgb(85,13,13)", 1.5, "rgb(85,67,13)",
            2.0, "rgb(13,85,16)", 2.5, "rgb(13,78,85)", 3.0, "rgb(13,18,85)");
    public static final Map<Double, String> colorAMap = Map.of(1.0, "rgba(85,13,13,0.2)", 1.5, "rgba(85,67,13,0.2)",
            2.0, "rgba(13,85,16,0.2)", 2.5, "rgba(13,78,85,0.2)", 3.0, "rgba(13,18,85,0.2)");

    private double x;
    private double y;
    private double r;
    private String result;
    private boolean valid;
    private String currentTime;
    private double executingTime;
    private boolean isInit;

    public Point(String strX, String strY, String strR) {
        validateAndFill(strX, strY, strR);
    }

    private void validateAndFill(String strX, String strY, String strR) {
        try {
            this.x = Double.parseDouble(strX.replace(",", "."));
            this.y = Double.parseDouble(strY.replace(",", "."));
            this.r = Double.parseDouble(strR.replace(",", "."));
            this.isInit = true;
        } catch (NumberFormatException ex) {
            this.result = "Данные некорректны";
            this.isInit = false;
            this.x = 0.0;
            this.y = 0.0;
            this.r = 0.0;
        }
    }

    public void validateAndCheckArea(boolean form) {
        if (!isInit) {
            valid = false;
            return;
        }
        if (form) {
            validateForm();
        } else {
            validateGraphic();
        }
        checkArea();
    }

    private void validateForm() {
        valid = (x >= ParamBorders.MIN_X.getBorder() && x <= ParamBorders.MAX_X.getBorder() &&
                y >= ParamBorders.MIN_Y.getBorder() && y <= ParamBorders.MAX_Y.getBorder() &&
                r >= ParamBorders.MIN_R.getBorder() && r <= ParamBorders.MAX_R.getBorder());
    }

    private void validateGraphic() {
        valid = r >= ParamBorders.MIN_R.getBorder() && r <= ParamBorders.MAX_R.getBorder();

    }

    private void checkArea() {
        if (!valid) {
            result = "Координаты не входят в область определения";
            return;
        }
        if (x >= 0 && y >= 0 && x*x + y*y <= r*r) {
            result = "Точка попала в четверть круга";
        }
        else if (x < 0 && y <= 0 && x >= -r && y >= -r/2) {
            result = "Точка попала в прямоугольник";
        }
        else if (x >= 0 && y < 0 && y >= 2*x - r) {
            result = "Точка попала в треугольник";
        } else
        result = "Точка не попала в область";
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    public double getExecutingTime() {
        return executingTime;
    }

    public void setExecutingTime(double executingTime) {
        this.executingTime = executingTime;
    }

}
