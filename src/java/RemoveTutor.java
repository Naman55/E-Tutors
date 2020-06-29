/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Naman
 */
public class RemoveTutor extends HttpServlet {

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
        String email=request.getParameter("email");
        PrintWriter out=response.getWriter();
        //out.print(email);
        Connection con=mypkg.Data.connect();
        String sql="delete from description where email=?";
        String sql1="delete from studentrequest where temail=?";
        String sql2="delete from tschedule where temail=?";
        String sql3="delete from tutors where email=?";
        String sql4="delete from tutorsubjects where email=?";
        String sql5="delete from tutortime where email=?";
        try{
            PreparedStatement ps=con.prepareStatement(sql);
            PreparedStatement ps1=con.prepareStatement(sql1);
            PreparedStatement ps2=con.prepareStatement(sql2);
            PreparedStatement ps3=con.prepareStatement(sql3);
            PreparedStatement ps4=con.prepareStatement(sql4);
            PreparedStatement ps5=con.prepareStatement(sql5);
            ps.setString(1, email);
            ps1.setString(1, email);
            ps2.setString(1, email);
            ps3.setString(1, email);
            ps4.setString(1, email);
            ps5.setString(1, email);
            ps.executeUpdate();
            ps1.executeUpdate();
            ps2.executeUpdate();
            ps3.executeUpdate();
            ps4.executeUpdate();
            ps5.executeUpdate();
            response.sendRedirect("AdminHome.jsp");
        }catch(Exception e){
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
