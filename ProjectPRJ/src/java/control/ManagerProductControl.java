/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.DAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author mim
 */
@WebServlet(name="ManagerProductControl", urlPatterns={"/managerproduct"})
public class ManagerProductControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        DAO dao = new DAO();
        int id = a.getId();  
        
        List<Category> listC = dao.getAllCategory();
        request.setAttribute("listC", listC);
        List<Product> list1 = dao.getAllproductbySellID(id);
        int page;
        int size = list1.size();
        int numberpage = 6;
        int num = (size%numberpage==0?(size/numberpage):((size/numberpage)+1));
        String xpage = request.getParameter("page");
        if(xpage == null){
            page = 1;
        }else{
            page = Integer.parseInt(xpage);
        }
        
        int start;
        int end;
        start=(page-1)*numberpage;
        end = Math.min(page*numberpage,size);
        //b2: set data to jsp
        List<Product> list = dao.getListByPage(list1, start, end);
        request.setAttribute("page", page);
        request.setAttribute("num", num);

        request.setAttribute("listP", list);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);       
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
