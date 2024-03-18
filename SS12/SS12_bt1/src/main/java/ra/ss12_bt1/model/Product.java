package ra.ss12_bt1.model;

public class Product {
    private int id;
    private String productName;
    private String catalog;
    private int stock;

    public Product() {
    }

    public Product(int id, String productName, String catalog, int stock) {
        this.id = id;
        this.productName = productName;
        this.catalog = catalog;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
