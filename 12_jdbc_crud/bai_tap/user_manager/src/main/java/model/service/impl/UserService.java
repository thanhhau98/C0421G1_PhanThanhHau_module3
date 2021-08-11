package model.service.impl;

import model.bean.User;
import model.repository.IUserRepository;
import model.repository.impl.UserRepository;
import model.service.IUserService;

import java.util.List;

public class UserService implements IUserService {

    IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> orderByName() {
        return userRepository.orderByName();
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepository.findByCountry(country);
    }

    @Override
    public List<User> findAll() {
        return this.userRepository.findAll();
    }

    @Override
    public void save(User user) {
        this.userRepository.save(user);
    }

    @Override
    public User findById(int id) {
        return this.userRepository.findById(id);
    }

    @Override
    public void update(int id, User user) {
        userRepository.update(id,user);
    }

    @Override
    public void remove(int id) {
        userRepository.remove(id);
    }
}
