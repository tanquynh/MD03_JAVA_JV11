package ra.ss13.service;

import jdk.javadoc.internal.doclets.toolkit.PropertyWriter;
import ra.ss13.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServiceIMPL implements IUserService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo_ss13";
    private String jdbcUSerName = "root";
    private String jdbcPassWord = "Anhquynh12@";
    private static final String INSERT_USER_SQL = "INSERT INTO User" + "(name,email,country)VALUES" + "(?,?,?)";
    private static final String SELECT_USER_BY_ID = "SELECT  name,email, country from user where id = ?";
    private static final String SELECT_ALL_USER = "SELECT * FROM user";
    private static final String DELETE_USER_SQL = "DELETE FROM USER WHERE id = ?";
    private static final String UPDATE_USER_SQL = " UPDATE USER SET name=?, email=?, country = ? where id = ?";
    private static final String SELECT_COUNTRY_BY_NAME = "select  * from user order by country like ?;";

    public UserServiceIMPL() {
    }

    public List<User> searchUserByCountry(String name) throws SQLException {
        System.out.println(SELECT_COUNTRY_BY_NAME);
        List<User> users = null;
        Connection connection = getConnection();
        String seartString = "%".concat(name).concat("%");
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COUNTRY_BY_NAME);
        preparedStatement.setString(1, seartString);
        ResultSet rs = preparedStatement.executeQuery();

        while (rs.next()) {
            int idUser = Integer.parseInt(rs.getString("id"));
            String nameUser = rs.getString("name");
            String email = rs.getString("email");
            String country = rs.getString("country");
            User user = new User(idUser, nameUser, email, country);
            users.add(user);
        }

        return users;
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUSerName, jdbcPassWord);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertUser(User user) throws SQLException {
        try {
            System.out.println(INSERT_USER_SQL);
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }


    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }


    public boolean deleteUser(int id) throws SQLException {
        boolean rowDelete;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SQL);
        preparedStatement.setInt(1, id);
        rowDelete = preparedStatement.executeUpdate() > 0;
        return rowDelete;
    }


    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(UPDATE_USER_SQL);
        statement.setString(1, user.getName());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getCountry());
        statement.setInt(4, user.getId());
        rowUpdate = statement.executeUpdate() > 0;
        return rowUpdate;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.out.println("SQLState : " + ((SQLException) e).getSQLState());
                System.out.println("Error Code :" + ((SQLException) e).getErrorCode());
                System.out.println("Message :" + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause : " + t);
                    t.getCause();
                }

            }
        }
    }
}
