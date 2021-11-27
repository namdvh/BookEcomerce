/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.Dao;

import Nam.user.BookDTO;
import Nam.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MSI
 */
public class BookDAO {

    public static List<BookDTO> selectBook() throws SQLException {
        // Book view from Admin Login when no book is borrowed;
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select * from tblProduct "
                        + " where Quantity>0 and Status='Active' ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String BookID = rs.getString("ProductID");
                    String BookName = rs.getString("Name");
                    int Price = rs.getInt("Price");
                    String BookImage = rs.getString("Image");
                    int Quantity = rs.getInt("Quantity");
                    int CategoryID = rs.getInt("CategoryID");
                    String Status=rs.getString("Status");
                    list.add(new BookDTO(BookID, BookName, Price, BookImage, Quantity, CategoryID,Status));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public static List<BookDTO> searchBookList1(String search) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select ProductID, Name, Price, Image, Quantity, CategoryID "
                        + " from tblProduct "
                        + " where Name like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String BookID = rs.getString("ProductID");
                    String BookName = rs.getString("Name");
                    int Price = rs.getInt("Price");
                    String BookImage = rs.getString("Image");
                    int Quantity = rs.getInt("Quantity");
                    int CategoryID = rs.getInt("CategoryID");
                     String Status = rs.getString("Status");
                    list.add(new BookDTO(BookID, BookName, Price, BookImage, Quantity, CategoryID,Status));

                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public static boolean updateBooks(BookDTO book) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Update tblProduct "
                        + " SET Quantity=? "
                        + " where ProductID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, book.getQuantity());
                stm.setString(2, book.getBookID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public static boolean insertBook(BookDTO book) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " insert into tblProduct(ProductID, Name, Price, Image, Quantity, CategoryID)"
                        + " values(?,?,?,?,?)";
                stm.setString(1, book.getBookID());
                stm.setString(2, book.getBookName());
                stm.setInt(3, book.getPrice());
                stm.setString(4, book.getBookImage());
                stm.setInt(5, book.getQuantity());
                stm.setInt(6, book.getCategoryID());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public static BookDTO selectBookByID(String BookID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Select Name, Price, Quantity, CategoryID from tblProduct where ProductID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, BookID);
                rs = stm.executeQuery();
                BookDTO book = null;
                while (rs.next()) {
                    book = new BookDTO();
                    book.setBookID(BookID);
                }
                return book;
            }
        } catch (Exception e) {
            System.out.println(e);

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;

    }

    public static List<BookDTO> getProductByCatID(String search) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select ProductID, Name, Price, Image, Quantity, CategoryID "
                        + " from tblProduct "
                        + " where CategoryID like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String BookID = rs.getString("ProductID");
                    String BookName = rs.getString("Name");
                    int Price = rs.getInt("Price");
                    String BookImage = rs.getString("Image");
                    int Quantity = rs.getInt("Quantity");
                    int CategoryID = rs.getInt("CategoryID");
                    String Status=rs.getString("Status");
                    list.add(new BookDTO(BookID, BookName, Price, BookImage, Quantity, CategoryID,Status));

                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public static int selectQuantity(String BookID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Select Quantity from tblProduct where ProductID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, BookID);
                rs = stm.executeQuery();
                BookDTO book = null;
                while (rs.next()) {
                    result = Integer.parseInt(rs.getString("Quantity"));
                }

            }
        } catch (Exception e) {
            System.out.println(e);

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;

    }
}
