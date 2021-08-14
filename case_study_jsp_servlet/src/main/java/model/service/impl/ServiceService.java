package model.service.impl;

import model.bean.Service;
import model.repository.IServiceRepository;
import model.repository.impl.ServiceRepository;
import model.service.IServiceService;

import java.util.List;

public class ServiceService implements IServiceService {

    IServiceRepository serviceRepository = new ServiceRepository();

    @Override
    public List<Service> orderByName() {
        return null;
    }

    @Override
    public List<Service> findByCountry(String country) {
        return null;
    }

    @Override
    public List<Service> findAll() {
        return serviceRepository.findAll();
    }

    @Override
    public void save(Service service) {
        serviceRepository.save(service);
    }

    @Override
    public Service findById(int id) {
        return serviceRepository.findById(id);
    }

    @Override
    public void update(int id, Service service) {
        serviceRepository.update(id,service);
    }

    @Override
    public void remove(int id) {
        serviceRepository.remove(id);
    }
}
