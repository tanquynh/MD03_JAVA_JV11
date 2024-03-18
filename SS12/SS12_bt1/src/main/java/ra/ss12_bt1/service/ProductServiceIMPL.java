package ra.ss12_bt1.service;

import ra.ss12_bt1.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceIMPL implements IProductService {
    public static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Iphone13", "Apple", 100));
        products.put(2, new Product(2, "Iphone14", "Apple", 120));
        products.put(3, new Product(3, "Note10", "Samsung", 110));
        products.put(4, new Product(4, "Note 11", "Samsung", 120));
        products.put(5, new Product(5, "Nokia1280", "Nokia", 140));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }
}
