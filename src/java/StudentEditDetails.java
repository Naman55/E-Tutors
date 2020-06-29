/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Naman
 */
public class StudentEditDetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name=request.getParameter("name");
        String gname=request.getParameter("gname");
        String school=request.getParameter("school");
        String clas=request.getParameter("class");
        String board=request.getParameter("board");
        String contact=request.getParameter("contact");
        String address=request.getParameter("address");
        String dob=request.getParameter("dob");
        String email=request.getParameter("email");
        try{
            Connection con=mypkg.Data.connect();
            String sql="update students set name=?,gname=?,school=?,class=?,board=?,contact=?,address=?,dob=? where email=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, gname);
            ps.setString(3, school);
            ps.setString(4, clas);
            ps.setString(5, board);
            ps.setString(6, contact);
            ps.setString(7, address);
            ps.setString(8, dob);
            ps.setString(9, email);
            ps.executeUpdate();
            response.sendRedirect("studentHome.jsp");
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
