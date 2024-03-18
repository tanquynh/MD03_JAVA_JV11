package org.example.ss11.database;

import model.Employees;

import java.util.ArrayList;
import java.util.List;

public class DBUtils {
    private static final List<Employees> EMPLOYEES = new ArrayList<>();
    static {
        innitData();
    }

    private static void innitData() {
        Employees e1 = new Employees(1,"Tuan","16/05/1994","Ha Noi","https://images.pexels.com/photos/18866500/pexels-photo-18866500/free-photo-of-nh-ng-ng-i-dan-ba-th-gian-mua-he.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
        Employees e2 = new Employees(2,"Manh","11/06/1992","TP HCM","https://images.pexels.com/photos/413885/pexels-photo-413885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
        Employees e3 = new Employees(3,"Hai","06/07/1999","Hai Phong","https://images.pexels.com/photos/1396538/pexels-photo-1396538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
        Employees e4 = new Employees(4,"hung","13/04/1996","Da Nang","https://images.pexels.com/photos/3582102/pexels-photo-3582102.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
   EMPLOYEES.add(e1);
   EMPLOYEES.add(e2);
   EMPLOYEES.add(e3);
   EMPLOYEES.add(e4);
    }
    public static List<Employees> queryEmployees(){
        return EMPLOYEES;
    }

}
