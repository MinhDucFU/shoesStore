/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ndq.order;

import ndq.utils.DBHelper;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minh Hoang
 */
public class OrderDAO {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int insertOrder(OrderDTO dto) throws SQLException, Exception {

        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "insert into Orders(DateOrder,total,userName,phone,address,userID) values(?,?,?,?,?,?)";

                ps = con.prepareStatement(sql);
                ps.setTimestamp(1, new Timestamp(dto.getDateOrder().getTime()));
                ps.setFloat(2, dto.getTotal());
                ps.setString(3, dto.getUserName());
                ps.setString(4, dto.getPhone());
                ps.setString(5, dto.getAddress());
                ps.setString(6, dto.getUserID());
                return ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }

        return -1;
    }

    public int getOrderID() throws SQLException, Exception {
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select top 1 OrderID\n"
                        + "from Orders\n"
                        + "order by OrderID desc";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("OrderID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }

        return -1;
    }

    public List<OrderDTO> getOrderbyUserID(String userID) throws Exception {

        List<OrderDTO> result = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT OrderID,DateOrder,total,userName,phone,address FROM Orders WHERE userID=?";

                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    Date dateOrder = rs.getDate("DateOrder");
                    float total = rs.getFloat("total");
                    String userName=rs.getString("userName");
                    String phone=rs.getString("phone");
                    String address=rs.getString("address");
                    OrderDTO order = new OrderDTO(orderID, userName, phone, address, dateOrder, total);

                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    
    public boolean checkOderID(String oderID) throws Exception {
        boolean check = false;
        String sql = "select total from Orders where OrderID=?";
        try {
            con = DBHelper.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, oderID);
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
}
