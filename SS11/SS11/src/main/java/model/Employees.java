package model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Employees {
    private int id;
    private String name;
    private LocalDate birthday;
    private String address;
    private String url;
    private static final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    public Employees() {
    }

    public Employees(int id, String name, String birthday, String address, String url) {
        this.id = id;
        this.name = name;
        this.birthday = LocalDate.parse(birthday,dtf);
        this.address = address;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
