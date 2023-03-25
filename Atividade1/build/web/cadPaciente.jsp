<%-- 
    Document   : cadUsu
    Created on : 11 de mar. de 2023, 14:07:01
    Author     : Fatec 3D
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%  
    Statement st = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script><title>JSP Page</title>
    
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro de Paciente</h1>
        
        <form action="" method="post" id="cadastro">
            <label>Nome do Paciente</label><br>
            <input type="text" name="txtNome"><br>
            <label>Telefone Fixo</label><br>
            <input type="text" name="txtTel"><br>
            <label>Celular</label><br>
            <input type="text" name="txtCel"><br><!-- comment -->
            <br>
            <br><br>
            <input type="submit" name="btnSalvar">
        </form>
        <br>
        <a href="cadastro.jsp">Voltar</a>
    </body>
</html>

        <%
            if(request.getParameter("btnSalvar")!=null){
                String nome = request.getParameter("txtNome");
                String telefone = request.getParameter("txtTel");
                String celular = request.getParameter("txtCel");           
               try{
                        st = new Conexao().conectar().createStatement();

                        st.executeUpdate("insert into tbPaciente(nomePaciente,telPaciente,celPaciente) values('"+nome+"'"
                        +", '"+telefone+"', '"+celular+"')");     
                        out.println("<meta http-equiv='refresh' content='0;URL=cadastro.jsp'>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Cadastro realizado com sucesso');");
                        out.println("</script>");    
                        }
                catch(Exception e)
                        {
                        out.println(e);
                        }
  
            }
            %>

