package model.service.impl;

import model.bean.Product;
import model.service.IProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Laptop",100 ));
        products.put(2, new Product(2, "TV", 200));
        products.put(3, new Product(3, "Table", 300));
        products.put(4, new Product(4, "Chair", 400));
        products.put(5, new Product(5, "Lamp", 500));
        products.put(6, new Product(6, "Book", 600));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>();
        for (Product product : products.values()) {
            if (product.getName().equals(name)) {
                productList.add(product);
            }
        }
        return productList;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id , product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
