package model.repository;

import model.bean.User;

import java.util.List;

public interface IUserRepository {

    List<User> orderByName();

    List<User> findByCountry(String country);

    List<User> findAll();

    void save(User user);

    User findById(int id);

    void update(int id, User customer);

    void remove(int id);
}
