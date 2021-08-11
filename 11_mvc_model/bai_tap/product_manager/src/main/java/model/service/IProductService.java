package model.service;

import model.bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product customer);

    Product findById(int id);

    List<Product> findByName(String name);

    void update(int id, Product product);

    void remove(int id);
}
