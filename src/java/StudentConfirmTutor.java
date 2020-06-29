/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Naman
 */
public class StudentConfirmTutor extends HttpServlet {

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
        PrintWriter out=response.getWriter();
        HttpSession session =request.getSession();
        String semail=(String)session.getAttribute("semail");
        String temail=(String)session.getAttribute("temail");
        String time=request.getParameter("time");
        String clas=request.getParameter("class");
        String subject=request.getParameter("subject");
        try{
            Connection con=mypkg.Data.connect();
            String sql1="select uname from tutors where email=?";
            PreparedStatement ps1=con.prepareStatement(sql1);
            ps1.setString(1,temail);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
            String tname=rs1.getString(1);
            String sql="insert into sschedule values(?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, temail);
            ps.setString(2, tname);
            ps.setString(3, time);
            ps.setString(4, subject);
            ps.setString(5,semail);
            ps.setString(6, clas);
            ps.executeUpdate();
            String sql2="select name,address from students where email=?";
            PreparedStatement ps2=con.prepareStatement(sql2);
            ps2.setString(1, semail);
            ResultSet rs2=ps2.executeQuery();
            rs2.next();
            String sname=rs2.getString(1);
            String saddress=rs2.getString(2);
            String sql3="insert into tschedule values(?,?,?,?,?,?,?)";
            PreparedStatement ps3=con.prepareStatement(sql3);
            ps3.setString(1, semail);
            ps3.setString(2, sname);
            ps3.setString(3, time);
            ps3.setString(4, saddress);
            ps3.setString(5, subject);
            ps3.setString(6, clas);
            ps3.setString(7, temail);
            ps3.executeUpdate();
            String sql4="delete from studentrequest where semail=? and temail=?";
            PreparedStatement ps4=con.prepareStatement(sql4);
            ps4.setString(1, semail);
            ps4.setString(2, temail);
            ps4.executeUpdate();
            String sql5="delete from tutortime where email=? and time=?";
            PreparedStatement ps5=con.prepareStatement(sql5);
            ps5.setString(1, temail);
            ps5.setString(2, time);
            ps5.executeUpdate();
            response.sendRedirect("StudentConfirmTutor.jsp");
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
