package com.example.weblab2s.bean;

import java.io.Serializable;
import java.util.concurrent.CopyOnWriteArrayList;

public class ComponentStorage implements Serializable {
    public void setStorage(CopyOnWriteArrayList<Component> storage) {
        this.storage = storage;
    }

    private CopyOnWriteArrayList<Component> storage;

    public ComponentStorage() {
        this.storage = new CopyOnWriteArrayList<>();
    }

    public ComponentStorage(CopyOnWriteArrayList<Component> storage) {
        this.storage = storage;
    }

    public void addComponent(Component comp) {
        storage.add(comp);
    }

    public CopyOnWriteArrayList<Component> getStorage() {
        return this.storage;
    }

    public int getSize() {
        return storage.size();
    }
}
