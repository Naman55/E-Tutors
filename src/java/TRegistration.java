/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author Naman
 */
public class TRegistration extends HttpServlet {

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
        String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="";
        byte b1[]=null,b2[]=null,b3[]=null;
        
        DiskFileItemFactory factory=new DiskFileItemFactory();
        ServletFileUpload upload=new ServletFileUpload(factory);
        try
        {
            //upload.parseRequest(request);
            List<FileItem> items=upload.parseRequest(new ServletRequestContext(request));
            
            for(int i=0; i<items.size();i++){
                FileItem item=items.get(i);
                String name=item.getFieldName();
                if(name.equals("uname")){
                    s1=item.getString();
                }else if(name.equals("email")){
                    s2=item.getString();
                }else if(name.equals("pwd")){
                    s3=item.getString();
                }else if(name.equals("address")){
                    s4=item.getString();
                }else if (name.equals("age")) {
                    s5 = item.getString();
                }else if (name.equals("gender")) {
                    s6 = item.getString();
                }else if (name.equals("contact")) {
                    s7 = item.getString();
                }else if (name.equals("hq")) {
                    s8 = item.getString();
                }else if (name.equals("id")) {
                    b1=item.get();
                }else if (name.equals("ms")){
                    b2=item.get();
                }else if (name.equals("photo")){
                    b3=item.get();
                }
            }
            
            Connection con=mypkg.Data.connect();
            String sql="insert into tutors values(?,?,?,?,?,?,?,?,?,?,?,?)";
            String sql1="insert into tutorregrequest values(?)";
            PreparedStatement ps=con.prepareStatement(sql);
            PreparedStatement ps1=con.prepareStatement(sql1);
            ps.setString(1,s1);
            ps.setString(2,s2);
            ps.setString(3,s3);
            ps.setString(4,s4);
            ps.setString(5,s5);
            ps.setString(6,s6);
            ps.setString(7,s7);
            ps.setString(8,s8);
            ps.setBytes(9,b1);
            ps.setBytes(10,b2);
            ps.setInt(11,0);
            ps.setBytes(12,b3);
            ps1.setString(1,s2);
            ps1.executeUpdate();
            ps.executeUpdate();
            con.close();
            out.println("<html>");
            out.println("<body>");
            out.println("<h3>Data Stored</h3>");
            //out.println("<h4><a href=entry.jsp>Add-More</a></h4>");
            out.println("<h4><a href=index.jsp>Home</a></h4>");
            
        }catch(Exception e){
            e.printStackTrace();;
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
