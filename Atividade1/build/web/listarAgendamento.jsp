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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script><title>JSP Page</title>
   
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de Agendamentos</h1> 
        
        <form action="buscarAgendamento.jsp" method="post">
        <%  
                try{
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("Select m.nomeMedico, a.dataAgendamento, a.horaAgendamento, p.nomePaciente from tblAgendamento a "
                + "inner join tblMedico m on a.codMedico = m.codMedico "
                + "inner join tbPaciente p on a.codPaciente = p.codPaciente" );
                out.println("<table class='table' border=1><thead><tr><th scope='col'>Medico</th><th scope='col'>Data</th><th scope='col'>Hora</th><th scope='col'>Paciente</th></tr></thead>");
                while(rs.next())
                {
                out.println("<tbody><td value='Medico'>" + rs.getString(1) + "</td>");
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3) + "</td>");
                out.println("<td>" + rs.getString(4)+ "</td></tr></tbody>");  
                }
                 out.println("</table>");
                }
                catch(Exception e)
                {
                out.println(e);
                }  
            %>
        </form>
        <br>
    </body>
</html>
