package model.repository.impl;

import model.bean.Customer;
import model.bean.Service;
import model.repository.BaseRepository;
import model.repository.IServiceRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {

    BaseRepository baseRepository = new BaseRepository();

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
        List<Service> services = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "select * \n" +
                            "from service;"
            );

            ResultSet resultSet = preparedStatement.executeQuery();

            Service service ;

            while (resultSet.next()){
                service = new Service();
                service.setServiceId(resultSet.getInt("service_id"));
                service.setServiceName(resultSet.getString("service_name"));
                service.setServiceArea(resultSet.getDouble("service_area"));
                service.setServiceCost(resultSet.getDouble("service_cost"));
                service.setServiceMaxPeople(resultSet.getInt("service_max_people"));
                service.setRentTypeId(resultSet.getInt("rent_type_id"));
                service.setServiceTypeId(resultSet.getInt("service_type_id"));
                service.setStandardRoom(resultSet.getString("standard_room"));
                service.setDescriptionOtherConvenience(resultSet.getString("description_other_convenience"));
                service.setPollArea(resultSet.getDouble("poll_area"));
                service.setNumberOfFloors(resultSet.getInt("number_of_floors"));

                services.add(service);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return services;
    }

    @Override
    public void save(Service service) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "insert into service\n" +
                            "values (?,?,?,?,?,?,?,?,?,?,?);"
            );
            preparedStatement.setInt(1 , service.getServiceId());
            preparedStatement.setString(2 , service.getServiceName());
            preparedStatement.setDouble(3 , service.getServiceArea());
            preparedStatement.setDouble(4 , service.getServiceCost());
            preparedStatement.setInt(5 , service.getServiceMaxPeople());
            preparedStatement.setInt(6 , service.getRentTypeId());
            preparedStatement.setInt(7 , service.getServiceTypeId());
            preparedStatement.setString(8 , service.getStandardRoom());
            preparedStatement.setString(9 , service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(10 , service.getPollArea());
            preparedStatement.setInt(11 , service.getNumberOfFloors());

            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public Service findById(int id) {
        Service service = null;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "select * \n" +
                            "from service\n" +
                            "where service_id = ? ;");
            preparedStatement.setString(1,id+"");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                service = new Service();
                service.setServiceId(resultSet.getInt("service_id"));
                service.setServiceName(resultSet.getString("service_name"));
                service.setServiceArea(resultSet.getDouble("service_area"));
                service.setServiceCost(resultSet.getDouble("service_cost"));
                service.setServiceMaxPeople(resultSet.getInt("service_max_people"));
                service.setRentTypeId(resultSet.getInt("rent_type_id"));
                service.setServiceTypeId(resultSet.getInt("service_type_id"));
                service.setStandardRoom(resultSet.getString("standard_room"));
                service.setDescriptionOtherConvenience(resultSet.getString("description_other_convenience"));
                service.setPollArea(resultSet.getDouble("poll_area"));
                service.setNumberOfFloors(resultSet.getInt("number_of_floors"));
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return service;
    }

    @Override
    public void update(int id, Service service) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "update service\n" +
                            "set service_name=?,service_area=?,service_cost=?,service_max_people=?,rent_type_id=?,service_type_id=?,standard_room=?,description_other_convenience=?,poll_area=?,number_of_floors=?\n" +
                            "where service_id = ?;"
            );

            preparedStatement.setString(1 , service.getServiceName());
            preparedStatement.setDouble(2 , service.getServiceArea());
            preparedStatement.setDouble(3 , service.getServiceCost());
            preparedStatement.setInt(4 , service.getServiceMaxPeople());
            preparedStatement.setInt(5 , service.getRentTypeId());
            preparedStatement.setInt(6 , service.getServiceTypeId());
            preparedStatement.setString(7 , service.getStandardRoom());
            preparedStatement.setString(8 , service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9 , service.getPollArea());
            preparedStatement.setInt(10 , service.getNumberOfFloors());
            preparedStatement.setInt(11 , id);

            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public void remove(int id) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "delete\n" +
                            "from service\n" +
                            "where service_id = ?;"
            );
            preparedStatement.setString(1,id+"");
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }
}
