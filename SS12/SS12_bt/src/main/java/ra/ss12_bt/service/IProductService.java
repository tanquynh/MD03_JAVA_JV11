package ra.ss12_bt.service;

import ra.ss12_bt.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    Product findById(int id);
    void save(Product product);
    void remove(int id);
    void update(int id,Product product);
    List<Product> searchProductsByName(String name);
}
