package com.example.weblab2s.servlet;

public enum ParamBorders {
    MIN_X (-3),
    MAX_X (5),
    MIN_Y (-3),
    MAX_Y (5),
    MIN_R (1),
    MAX_R (3);

    private final double border;

    ParamBorders(double border) {
        this.border = border;
    }

    public double getBorder() {
        return border;
    }
}
