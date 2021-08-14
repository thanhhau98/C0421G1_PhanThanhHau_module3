package model.repository;

import model.bean.Service;

import java.util.List;

public interface IServiceRepository {

    List<Service> orderByName();

    List<Service> findByCountry(String country);

    List<Service> findAll();

    void save(Service service);

    Service findById(int id);

    void update(int id, Service service);

    void remove(int id);

}
