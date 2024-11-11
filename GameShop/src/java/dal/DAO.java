package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;

public class DAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPublisher(rs.getString("publisher"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setReleaseDate(rs.getDate("releaseDate"));
                product.setImg(rs.getString("img"));
                product.setCategory(rs.getString("category")); // Add this line
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category ct = new Category();
                ct.setCid(rs.getInt("id"));
                ct.setCname(rs.getString("name"));
                categories.add(ct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid); // Set the parameter value
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPublisher(rs.getString("publisher"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setReleaseDate(rs.getDate("releaseDate"));
                product.setImg(rs.getString("img"));
                product.setCategory(rs.getString("category"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product getProductById(int id) {
        Product product = null;
        try {
            String query = "SELECT * FROM products WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPublisher(rs.getString("publisher"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setReleaseDate(rs.getDate("releaseDate"));
                product.setImg(rs.getString("img"));
                product.setCategory(rs.getString("category"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Product> getProductsByCategory(String category) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE category = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category); // Set the parameter value
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPublisher(rs.getString("publisher"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setReleaseDate(rs.getDate("releaseDate"));
                product.setImg(rs.getString("img"));
                product.setCategory(rs.getString("category"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from products\n"
                + "where [name] like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%"); // Set the parameter value
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPublisher(rs.getString("publisher"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setReleaseDate(rs.getDate("releaseDate"));
                product.setImg(rs.getString("img"));
                product.setCategory(rs.getString("category"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Account login(String user, String pass) {
        Account acc = null;
        String sql = "SELECT * FROM Account WHERE username = ? AND [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                acc = new Account();
                acc.setId(rs.getInt("id"));
                acc.setUser(rs.getString("username"));
                acc.setPass(rs.getString("password"));
                acc.setRole(rs.getInt("role_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return acc;
    }

    public Account checkAccountExist(String user) {
        Account acc = null;
        String sql = "SELECT * FROM Account WHERE username = ? AND [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                acc = new Account();
                acc.setId(rs.getInt("id"));
                acc.setUser(rs.getString("username"));
                acc.setPass(rs.getString("password"));
                acc.setRole(rs.getInt("role_id"));
                return acc;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void signup(String user, String pass) {
        String sql = "INSERT INTO account (username, password, role_id)\n"
                + "VALUES (?, ?, 1);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(String id) {
        String sql = "delete from products\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getProductByCID("1");
        for (Product o : list) {
            System.out.println(o);
        }
    }
}
