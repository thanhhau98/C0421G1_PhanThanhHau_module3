package model.service;

import model.bean.User;

import java.util.List;

public interface IUserService {

    String addUserTransaction(User user, int[] permisions);

    void saveBySP( User user);

    User findByIdSP(int id);

    List<User> orderByName();

    List<User> findByCountry(String country);

    List<User> findAll();

    void save(User user);

    User findById(int id);

    void update(int id, User user);

    void remove(int id);
}
