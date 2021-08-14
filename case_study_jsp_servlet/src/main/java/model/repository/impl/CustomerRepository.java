package model.repository.impl;

import model.bean.Customer;
import model.repository.BaseRepository;
import model.repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Customer> orderByName() {
        return null;
    }

    @Override
    public List<Customer> findByCountry(String country) {
        return null;
    }

    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "select * \n" +
                            "from customer;"
            );

            ResultSet resultSet = preparedStatement.executeQuery();

            Customer customer ;

            while (resultSet.next()){
                customer = new Customer();
                customer.setCustomerId(resultSet.getInt("customer_id"));
                customer.setCustomerTypeId(resultSet.getInt("customer_type_id"));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setCustomerBirthday(resultSet.getString("customer_birthday"));
                customer.setCustomerGender(resultSet.getInt("customer_gender"));
                customer.setCustomerIdCard(resultSet.getString("customer_id_card"));
                customer.setCustomerPhone(resultSet.getString("customer_phone"));
                customer.setCustomerEmail(resultSet.getString("customer_email"));
                customer.setCustomerAddress(resultSet.getString("customer_address"));

                customers.add(customer);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return customers;
    }

    @Override
    public void save(Customer customer) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
              "insert into customer\n" +
                      "values (?,?,?,?,?,?,?,?,?);"
            );
            preparedStatement.setInt(1 , customer.getCustomerId());
            preparedStatement.setInt(2 , customer.getCustomerTypeId());
            preparedStatement.setString(3 , customer.getCustomerName());
            preparedStatement.setString(4 , customer.getCustomerBirthday());
            preparedStatement.setInt(5 , customer.getCustomerGender());
            preparedStatement.setString(6 , customer.getCustomerIdCard());
            preparedStatement.setString(7 , customer.getCustomerPhone());
            preparedStatement.setString(8 , customer.getCustomerEmail());
            preparedStatement.setString(9 , customer.getCustomerAddress());

            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                        "select * \n" +
                                "from customer\n" +
                                "where customer_id = ? ;");
            preparedStatement.setString(1,id+"");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                customer = new Customer();
                customer.setCustomerId(resultSet.getInt("customer_id"));
                customer.setCustomerTypeId(resultSet.getInt("customer_type_id"));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setCustomerBirthday(resultSet.getString("customer_birthday"));
                customer.setCustomerGender(resultSet.getInt("customer_gender"));
                customer.setCustomerIdCard(resultSet.getString("customer_id_card"));
                customer.setCustomerPhone(resultSet.getString("customer_phone"));
                customer.setCustomerEmail(resultSet.getString("customer_email"));
                customer.setCustomerAddress(resultSet.getString("customer_address"));
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return customer;
    }

    @Override
    public void update(int id, Customer customer) {
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "update customer\n" +
                            "set customer_type_id=?,customer_name=?,customer_birthday=?,customer_gender=?,customer_id_card=?,customer_phone=?,customer_email=?,customer_address=?\n" +
                            "where customer_id = ?;"
            );

            preparedStatement.setInt(1 , customer.getCustomerTypeId());
            preparedStatement.setString(2 , customer.getCustomerName());
            preparedStatement.setString(3 , customer.getCustomerBirthday());
            preparedStatement.setInt(4 , customer.getCustomerGender());
            preparedStatement.setString(5 , customer.getCustomerIdCard());
            preparedStatement.setString(6 , customer.getCustomerPhone());
            preparedStatement.setString(7 , customer.getCustomerEmail());
            preparedStatement.setString(8 , customer.getCustomerAddress());
            preparedStatement.setInt(9 , customer.getCustomerId());

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
                            "from customer\n" +
                            "where customer_id = ?;"
            );
            preparedStatement.setString(1,id+"");
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

    }
}
