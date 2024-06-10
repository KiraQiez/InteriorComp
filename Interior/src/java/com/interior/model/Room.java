package com.interior.model;

public class Room {

    private String roomNumber;
    private double price;
    private String type;
    private int capacity;
    private String desc;

    public Room() {
        this.roomNumber = "";
        this.price = 0;
        this.type = "";
        this.capacity = 0;
        this.desc = "";
    }

    public Room(String roomNumber, double price, String type, int capacity, String desc) {
        this.roomNumber = roomNumber;
        this.price = price;
        this.type = type;
        this.capacity = capacity;
        this.desc = desc;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public double getPrice() {
        return price;
    }

    public String getType() {
        return type;
    }

    public int getCapacity() {
        return capacity;
    }

    public String getDesc() {
        return desc;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Override
    public String toString() {
        return "Room{" + "roomNumber=" + roomNumber + ", price=" + price + ", type=" + type + ", capacity=" + capacity
                + ", desc=" + desc + '}';
    }
}
