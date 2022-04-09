/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ndq.shoes;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import ndq.caterory.CategoryDAO;
import ndq.utils.DBHelper;

/**
 *
 * @author Minh Hoang
 */
public class ShoesDAO {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<ShoesDTO> getAllShoes() throws Exception {

        List<ShoesDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity FROM Shoes";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String shoesID = rs.getString("shoesID");
                    String shoesName = rs.getString("shoesName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(shoes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public List<ShoesDTO> getAllShoesUser() throws Exception {

        List<ShoesDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity FROM Shoes where status='Active' and quantity>0";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String shoesID = rs.getString("shoesID");
                    String shoesName = rs.getString("shoesName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(shoes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public List<ShoesDTO> getShoesASC() throws Exception {

        List<ShoesDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT \n"
                        + "shoesID,shoesName,image,description,categoryID,status,price,quantity\n"
                        + "FROM Shoes where status='Active' and quantity>0\n"
                        + "ORDER BY price ASC";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String shoesID = rs.getString("shoesID");
                    String shoesName = rs.getString("shoesName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(shoes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public List<ShoesDTO> getShoesDESC() throws Exception {

        List<ShoesDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT \n"
                        + "shoesID,shoesName,image,description,categoryID,status,price,quantity\n"
                        + "FROM Shoes where status='Active' and quantity>0\n"
                        + "ORDER BY price DESC ";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String shoesID = rs.getString("shoesID");
                    String shoesName = rs.getString("shoesName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(shoes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public List<ShoesDTO> getShoesByCateID(String cateID) throws Exception {

        List<ShoesDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity FROM Shoes WHERE categoryID=? and status='Active' and quantity>0";

                ps = con.prepareStatement(sql);
                ps.setString(1, cateID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String shoesID = rs.getString("shoesID");
                    String shoesName = rs.getString("shoesName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(shoes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public List<ShoesDTO> getShoesRelated(String shoesName1) throws Exception {

        List<ShoesDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT TOP(4)\n"
                        + "shoesID,shoesName,image,description,categoryID,status,price,quantity\n"
                        + "FROM Shoes\n"
                        + "WHERE shoesName like ?;";

                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + shoesName1 + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String shoesID = rs.getString("shoesID");
                    String shoesName = rs.getString("shoesName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(shoes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public ShoesDTO getShoesByID(String shoesID) throws Exception {

        ShoesDTO result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity FROM Shoes WHERE shoesID=? ";

                ps = con.prepareStatement(sql);
                ps.setString(1, shoesID);
                rs = ps.executeQuery();
                while (rs.next()) {

                    String shoesName = rs.getString("shoesName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    result = new ShoesDTO(shoesID, shoesName, description, status, image, categoryID, price, quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public int getQuantityByID(String shoesID) throws Exception {
        int quantity = 0;
        String sql = "select quantity from Shoes where shoesID=?";
        try {
            con = DBHelper.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, shoesID);
            rs = ps.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return quantity;
    }

    public boolean updateQuantity(String shoesID, int quantity) throws Exception {
        boolean check = false;
        try {
            con = new DBHelper().getConnection();
            if (con != null) {
                String sql = "update Shoes set quantity=? where shoesID=?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, quantity);
                ps.setString(2, shoesID);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public boolean deleteShoes(String shoesID) throws Exception {
        boolean check = false;
        try {
            con = new DBHelper().getConnection();
            if (con != null) {
                String sql = "update Shoes set status=? where shoesID=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, "Inactive");
                ps.setString(2, shoesID);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public boolean checkShoesID(String shoesID) throws Exception {
        boolean check = false;
        String sql = "select shoesName from Shoes where shoesID=?";
        try {
            con = DBHelper.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, shoesID);
            rs = ps.executeQuery();
            if (rs.next()) {
                check = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public boolean addNewShoes(ShoesDTO shoes) throws Exception {

        boolean check = false;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "insert into Shoes(shoesID,shoesName,image,description,categoryID,status,price,quantity) values(?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, shoes.getShoesID());
                ps.setString(2, shoes.getShoesName());
                ps.setString(3, shoes.getImage());
                ps.setString(4, shoes.getDescription());
                ps.setString(5, shoes.getCategoryID());
                ps.setString(6, shoes.getStatus());
                ps.setFloat(7, shoes.getPrice());

                ps.setInt(8, shoes.getQuantity());

                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public boolean updateBook(ShoesDTO shoes) throws Exception {
        boolean check = false;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "update Shoes set shoesName=?,image=?,description=?,categoryID=?,status=?,price=?,quantity=? where shoesID=? ";
                ps = con.prepareStatement(sql);

                ps.setString(1, shoes.getShoesName());
                ps.setString(2, shoes.getImage());
                ps.setString(3, shoes.getDescription());
                ps.setString(4, shoes.getCategoryID());
                ps.setString(5, shoes.getStatus());
                ps.setFloat(6, shoes.getPrice());
                ps.setInt(7, shoes.getQuantity());
                ps.setString(8, shoes.getShoesID());
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public List<ShoesDTO> pagingShoes(int index) throws Exception {
        List<ShoesDTO> list = new ArrayList<>();
        String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity from Shoes \n"
                + "WHERE status='Active' and quantity>0\n"
                + "ORDER BY shoesID\n"
                + "OFFSET ? rows FETCH next 9 rows only";
        try {
            con = new DBHelper().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                String shoesID = rs.getString("shoesID");
                String shoesName = rs.getString("shoesName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(shoes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return list;
    }

    public List<ShoesDTO> pagingShoesCate(int index, String cateID) throws Exception {
        List<ShoesDTO> list = new ArrayList<>();
        String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity from Shoes \n"
                + "WHERE status='Active' and quantity>0 and categoryID=?\n"
                + "ORDER BY shoesID\n"
                + "OFFSET ? rows FETCH next 9 rows only";
        try {
            con = new DBHelper().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(2, (index - 1) * 9);
            ps.setString(1, cateID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String shoesID = rs.getString("shoesID");
                String shoesName = rs.getString("shoesName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(shoes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return list;
    }

    public List<ShoesDTO> pagingShoesASC(int index) throws Exception {
        List<ShoesDTO> list = new ArrayList<>();
        String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity from Shoes \n"
                + "                WHERE status='Active' and quantity>0\n"
                + "                ORDER BY price ASC\n"
                + "                OFFSET ? rows FETCH next 9 rows only";
        try {
            con = new DBHelper().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                String shoesID = rs.getString("shoesID");
                String shoesName = rs.getString("shoesName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(shoes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return list;
    }

    public List<ShoesDTO> pagingShoesDESC(int index) throws Exception {
        List<ShoesDTO> list = new ArrayList<>();
        String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity from Shoes \n"
                + "                WHERE status='Active' and quantity>0\n"
                + "                ORDER BY price DESC\n"
                + "                OFFSET ? rows FETCH next 9 rows only";
        try {
            con = new DBHelper().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                String shoesID = rs.getString("shoesID");
                String shoesName = rs.getString("shoesName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(shoes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return list;
    }

    public List<ShoesDTO> pagingShoesAdmin(int index) throws Exception {
        List<ShoesDTO> list = new ArrayList<>();
        String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity from Shoes \n"
                + "ORDER BY shoesID\n"
                + "OFFSET ? rows FETCH next 9 rows only";
        try {
            con = new DBHelper().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                String shoesID = rs.getString("shoesID");
                String shoesName = rs.getString("shoesName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(shoes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return list;
    }

    public List<ShoesDTO> pagingShoesSearch(int index,String name) throws Exception {
        List<ShoesDTO> list = new ArrayList<>();
        String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity from Shoes WHERE shoesName like ? and status='Active' and quantity>0  \n"
                + "ORDER BY shoesID\n"
                + "OFFSET ? rows FETCH next 9 rows only";
        try {
            con = new DBHelper().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                String shoesID = rs.getString("shoesID");
                String shoesName = rs.getString("shoesName");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                String status = rs.getString("status");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");
                CategoryDAO categoryDAO = new CategoryDAO();
                ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(shoes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return list;
    }

    public List<ShoesDTO> getShoesByName(String name) throws Exception {

        List<ShoesDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT shoesID,shoesName,image,description,categoryID,status,price,quantity FROM Shoes where shoesName like ?";

                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + name + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String shoesID = rs.getString("shoesID");
                    String shoesName = rs.getString("shoesName");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    String status = rs.getString("status");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, status, image, categoryDAO.getNameByID(categoryID), price, quantity);
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(shoes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }
}
