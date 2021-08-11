package model.repository.impl;

import model.bean.User;
import model.repository.BaseRepository;
import model.repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public String addUserTransaction(User user, int[] permisions) {
        String smg = "OK, transaction successfully" ;
        Connection connection = this.baseRepository.getConnection();
        try {
            connection.setAutoCommit(false);
            PreparedStatement pSInsertUser =
             connection.prepareStatement(
                    "insert into users(`name`, email, country)\\n\" +\n" +
                            "                            \"values(?,?,?);" , Statement.RETURN_GENERATED_KEYS);
            pSInsertUser.setString(1, user.getName());

            pSInsertUser.setString(2, user.getEmail());

            pSInsertUser.setString(3, user.getCountry());

            int rowAffected = pSInsertUser.executeUpdate();

            ResultSet resultSet = pSInsertUser.getGeneratedKeys();

            int userId = 0 ;

            if (resultSet.next()){
                userId = resultSet.getInt(1);
            }

            if (rowAffected == 1) {

                // assign permision to user

                String sqlPivot = "INSERT INTO user_permision(user_id,permision_id) "

                        + "VALUES(?,?)";

                pstmtAssignment = conn.prepareStatement(sqlPivot);

                for (int permisionId : permisions) {

                    pstmtAssignment.setInt(1, userId);

                    pstmtAssignment.setInt(2, permisionId);

                    pstmtAssignment.executeUpdate();

                }

                conn.commit();

        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return null;
    }

    @Override
    public void saveBySP(User user) {
        try {
            CallableStatement callableStatement = this.baseRepository.getConnection().prepareCall(
                    "CALL insert_user(?,?,?);");

            callableStatement.setString(1,user.getName() );
            callableStatement.setString(2,user.getEmail() );
            callableStatement.setString(3,user.getCountry() );
            callableStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public User findByIdSP(int id) {
        User user = new User();

        try {
            CallableStatement callableStatement = this.baseRepository.getConnection().prepareCall(
                    "CALL get_user_by_id(?);");

            callableStatement.setString(1,id + "");
            ResultSet resultSet = callableStatement.executeQuery();

            if (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return user;
    }

    @Override
    public List<User> orderByName() {
        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select * \n" +
                            "from users\n" +
                            "order by `name`;"
            );
            ResultSet resultSet = preparedStatement.executeQuery();

            User user ;

            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                userList.add(user);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return userList;
    }

    @Override
    public List<User> findByCountry(String country) {

        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select *\n" +
                            "from users\n" +
                            "where country = ?; ");
            preparedStatement.setString(1,country);

            ResultSet resultSet = preparedStatement.executeQuery();

            User user ;

            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                userList.add(user);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return userList;
    }

    @Override
    public List<User> findAll() {

        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select id,`name`,email,country \n" +
                            "from users ; "
            );
            ResultSet resultSet = preparedStatement.executeQuery();

            User user ;

            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                userList.add(user);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return userList;
    }

    @Override
    public void save(User user) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "insert into users(`name`, email, country)\n" +
                            "values(?,?,?);");

            preparedStatement.setString(1,user.getName() );
            preparedStatement.setString(2,user.getEmail() );
            preparedStatement.setString(3,user.getCountry() );
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public User findById(int id) {

        User user = new User();

        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                            "select id,`name`,email,country \n" +
                                    "from users\n" +
                                    "where id = ?");

            preparedStatement.setString(1,id + "");
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return user;
    }

    @Override
    public void update(int id, User user) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "update users\n" +
                            "set `name` = ? , email = ? , country = ?\n" +
                            "where id = ? ;");

            preparedStatement.setString(1,user.getName() );
            preparedStatement.setString(2,user.getEmail() );
            preparedStatement.setString(3,user.getCountry() );
            preparedStatement.setString(4,id +"");
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public void remove(int id) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "delete\n" +
                            "from users\n" +
                            "where id = ?;");

            preparedStatement.setString(1,id +"");
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }
}
