/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Category;
import entity.Invoice;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mim
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
     public static void main(String[] args) {
        DAO dao = new DAO();

//        List<Category>list = dao.getAllCategory();
//        for(Category o : list){
//            System.out.println(o);
//        }
//         System.out.println(list.size()+1);
         Category x =dao.CategoryExist("ADIDddAS");
         if(x == null){
             System.out.println("khong x");
         
         }       
    }
     public List<Invoice> getAllInvoiceByID(int id) {
        List<Invoice> list = new ArrayList<>();
        String query = " Select * from Invoice where accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)                       
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

     public void insertInvoice(int accountID, double tongGia, String context, int phone, String delivery, String name, String typepay) {
        String query  = "INSERT INTO invoice(accountID, tongGia, ngayXuat, context, typepay, phone, delivery, [name]) "
             + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";  
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setDouble(2, tongGia);
            ps.setDate(3, getCurrentDate());
            ps.setString(4,context);
            ps.setString(5,typepay);
            ps.setInt(6,phone);
            ps.setString(7,delivery);
            ps.setString(8,name);       
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
         System.out.println("oke");
    }
     public List<Invoice> getAllInvoiceByid(int accountID) {
        String query = "select*from invoice \r\n"
                + "where accountid = ? ";
        List<Invoice>list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);          
            ps.setInt(1,accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)
                ));
            }

        } catch (Exception e) {

        }
        return list;
    }
    public List<Product> getAllproduct() {
        List<Product> list = new ArrayList<>();
        String query = "Select * from Product ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "Select * from Account ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "Select * from Category ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Cart checkCartExist(int accountID, int productID, String size) {

        String query = "select * from Cart\r\n"
                + "where [accountID] = ? and [productID] = ? and [size]= ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setString(3, size);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editAmountAndSizeCart(int accountID, int productID, int amount, String size) {
        String query = "update Cart set [amount]=?,\r\n"
                + "[size]=?\r\n"
                + "where [accountID]=? and [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setString(2, size);
            ps.setInt(3, accountID);
            ps.setInt(4, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertCart(int accountID, int productID, int amount, String size) {
        String query = "insert Cart(accountID, productID, amount,size)\r\n"
                + "values(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setInt(3, amount);
            ps.setString(4, size);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCart(int productID) {
        String query = "delete from Cart where productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
//
//    public int getIdAccount(String user) {
//        String query = "SELECT uid FROM Account \n"
//                + "where [user] = ? ";
//        String id = null;
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, user);
//            rs = ps.executeQuery();
//            id = rs.getString(1);
//        } catch (Exception e) {
//        }
//        return Integer.parseInt(id);
//    }

    public String getAmountCart(String user) {
        String count = "Oke"; // Giá trị mặc định nếu không tìm thấy dữ liệu
        String query = "SELECT COUNT(*) FROM Cart c "
                + "INNER JOIN Account a  ON a.uID = c.accountID "
                + "WHERE [user] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getString(1);
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu cần
        } finally {
            // Đóng kết nối và các tài nguyên (ps, rs) ở đây nếu cần
        }
        return count;
    }

    public void editAmountCart(int accountID, int productID, int amount) {
        String query = "update Cart set [amount]=?\r\n"
                + "where [accountID]=? and [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProfile(String username, String password, String email, int uID) {
        String query = "update Account set [user]=?,\r\n"
                + "[pass]=?,\r\n"
                + "[email]=?\r\n"
                + "where [uID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setInt(4, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Product getLast() {
        String query = "select top 1 * from product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getAllproductbyCid(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "Select * from Product  where cateID =? order by id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account getAccountId(String id) {

        String query = "Select * from Account  where [uid] =? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public Product getProductById(String id) {

        String query = "Select * from Product  where id =? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getAllproductbyTxt(String txt) {
        List<Product> list = new ArrayList<>();
        String query = "Select * from Product  where [name] like ? order by id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account Login(String user, String pass) {
        String query = " select * from account\n"
                + "where [user] = ? \n"
                + "and pass = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account CheckAccounExist(String user) {
        String query = "Select * from Account\n"
                + "where [user] = ?\n";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void CreateSignIn(String user, String pass) {
        String query = "insert into account\n"
                + "values(?,?,0,0,0)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countAllProduct() {
        String query = "select count(*) from Product ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Cart> getCartByAccountID(int accountID) {
        List<Cart> list = new ArrayList<>();
        String query = "select * from Cart where accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getListByPageAccount(List<Account> list,
            int start, int end) {
        ArrayList<Account> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getProductByIndex(int indexPage) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product \r\n"
                + "order by [id]\r\n"
                + "offset ? rows\r\n"
                + "fetch next 9 rows only";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, (indexPage - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductBySellIDAndIndex(int id, int indexPage) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product \r\n"
                + "where sell_ID = ?\r\n"
                + "order by [id]\r\n"
                + "offset ? rows\r\n"
                + "fetch next 5 rows only";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, (indexPage - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void insertCategory(int cid, String name){
        String query = "insert category(cid,cname)"+"values(?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cid);
            ps.setString(2, name);
            ps.executeUpdate();
        }catch(Exception e){
            
        }
    }
    public Category CategoryExistId(int id){
        Category c = null;
        String query = "select category where cid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            c = new Category(rs.getInt(1),rs.getString(2));
        }catch(Exception e){
            
        }       
        return c;
    }
    public Category CategoryExist(String name){
        Category c = null;
        String query = "select category where cname = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
            c = new Category(rs.getInt(1),rs.getString(2));
        }catch(Exception e){
            
        }       
        return c;
    }
    public void insertProduct(String name, String image, String price,
            String title, String description, String category, int sid, String model, String color, String delivery, String image2, String image3, String image4) {
        String query = " insert Product([name],[image],[price],[title],[description],[cateID],[sell_ID],[model],[color],[delivery],[image2],[image3],[image4])"
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {

            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sid);
            ps.setString(8, model);
            ps.setString(9, color);
            ps.setString(10, delivery);
            ps.setString(11, image2);
            ps.setString(12, image3);
            ps.setString(13, image4);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }
    public List<Product> getAllproductbySellID(int sellID) {

        List<Product> list = new ArrayList<>();
        String query = "Select * from Product  where [sell_ID] like ? order by id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + sellID + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteInvoiceByAccountId(String id) {
        String query = "delete from Invoice\n"
                + "where [accountID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteTongChiTieuBanHangByUserID(String id) {
        String query = "delete from TongChiTieuBanHang\n"
                + "where [userID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteReviewByAccountID(String id) {
        String query = "delete from Review where [accountID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProductBySellID(String id) {
        String query = "delete from Product\n"
                + "where [sell_ID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCartByAccountID(int id) {
        String query = "delete cart  where accountid = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteAccount(String id) {
        String query = "delete from Account where uID= ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(String id) {
        String sql = "Delete from Product where id=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCartByProductID(String productID) {
        String query = "delete from Cart where [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteSoLuongDaBanByProductID(String productID) {
        String query = "delete from SoLuongDaBan where [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertAccount(String user, String pass, String isSell,
            String isAdmin, String email) {
        String query = "insert Account([user], pass, isSell, isAdmin, email)\r\n"
                + "values(?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, isSell);
            ps.setString(4, isAdmin);
            ps.setString(5, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editAccount(String username, String password, int isSell, int isAdmin, String email, int uID) {
        String query = "update Account set [user]= ?,\n"
                + "              [pass]= ?,\n"
                + "              [isSell] = ?,\n"
                + "              [isAdmin] =   ?   ,        \n"
                + "              [email]= ?\n"
                + "               where uID= ?\n";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, isSell);
            ps.setInt(4, isAdmin);
            ps.setString(5, email);
            ps.setInt(6, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProduct(String pname, String pimage, String pprice, String ptitle, String pdescription, String pcategory,
            String pmodel, String pcolor,
            String pdelivery, String pimage2, String pimage3, String pimage4, String pid) {
        String query = "update Product\r\n"
                + "set [name] = ?,\r\n"
                + "[image] = ?,\r\n"
                + "price = ?,\r\n"
                + "title = ?,\r\n"
                + "[description] = ?,\r\n"
                + "cateID = ?,\r\n"
                + "model= ?,\r\n"
                + "color= ?,\r\n"
                + "delivery=?,\r\n"
                + "image2=?,\r\n"
                + "image3=?,\r\n"
                + "image4=?\r\n"
                + "where [id] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pname);
            ps.setString(2, pimage);
            ps.setString(3, pprice);
            ps.setString(4, ptitle);
            ps.setString(5, pdescription);
            ps.setString(6, pcategory);
            ps.setString(7, pmodel);
            ps.setString(8, pcolor);
            ps.setString(9, pdelivery);
            ps.setString(10, pimage2);
            ps.setString(11, pimage3);
            ps.setString(12, pimage4);
            ps.setString(13, pid);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void deleteReviewByProductID(String productID) {
        String query = "delete from Review where [productID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
   
    
}
