package com.posp.ui.entity;

public class MutableInteger {
    int value;

    public MutableInteger(int val) {
        this.value = val;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}