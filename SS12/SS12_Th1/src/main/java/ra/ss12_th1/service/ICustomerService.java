package ra.ss12_th1.service;

import ra.ss12_th1.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    Customer findById(int id);
    void save(Customer customer);
    void delete(int id);
    void update(int id, Customer customer);
}
