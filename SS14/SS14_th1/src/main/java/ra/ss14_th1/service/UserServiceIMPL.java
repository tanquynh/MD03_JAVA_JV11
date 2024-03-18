package ra.ss14_th1.service;

import ra.ss14_th1.Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class UserServiceIMPL implements IUserService {
    private String URL = "jdbc:mysql://localhost:3306/store_procedure";
    private String UserName = "root";
    private String PassWord = "Anhquynh12@";
    private static final String INSERT_USER_SQL = "INSERT INTO Users" +
            " (name, email, country) values" + "(?,?,?)";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "Select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?";
    private static final String UPDATE_USER_SQL = "update users set " +
            "name = ?, email = ? , country = ? where id = ?";

    public UserServiceIMPL() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, UserName, PassWord);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USER_SQL);
        try {
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
        try {
            Connection connection = getConnection();
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

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
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

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);
        preparedStatement.setInt(1, id);
        rowDeleted = preparedStatement.executeUpdate() > 0;
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }

    @Override
    public User getUserById(int id) {
        User user = null;
        String query = "{Call get_user_by_id(?)}";
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
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

    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{Call insert_user(?,?,?,?)}";
        Connection connection = getConnection();
        CallableStatement callableStatement = connection.prepareCall(query);
        callableStatement.setString(1, user.getName());
        callableStatement.setString(2, user.getEmail());
        callableStatement.setString(3, user.getCountry());
        System.out.println(callableStatement);
        callableStatement.executeUpdate();
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
