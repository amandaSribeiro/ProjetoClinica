<%-- 
    Document   : buscarUsu
    Created on : 11 de mar. de 2023, 14:07:23
    Author     : Fatec 3D
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<!DOCTYPE html>

<%  
    Statement st = null;
    ResultSet rs = null;
    %>

<html>
    <head>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Busca de Medico</h1> 
        <form action="buscarMedico.jsp" method="post">
            <input type="text" name="txtNome"><input type="submit" name="btnSalvar">
        </form>
        <br>
    </body>
</html>
<%  
            if(request.getParameter("btnSalvar")!=null){
                String busca = "%" + request.getParameter("txtNome") + "%";
            try{
            st = new Conexao().conectar().createStatement();
           rs = st.executeQuery("Select * from tblmedico where nomeMedico like'"+busca+"'");
            out.println("<table border=1><tr>");
            out.println("<td>Nome</td>");
            out.println("<td>Usuário</td></tr><tr>");
            while(rs.next())
            {    
            out.println("<td>" + rs.getString(2) + "</td>");
            out.println("<td>" + rs.getString(3)+ "</td></tr>");  
        }
            out.println("</table>");
            out.println("<br><a href='cadastro.jsp'>Voltar</a>");
                    
            }
            catch(Exception e)
            {
            out.println(e);
            }
        }
                
            %>

