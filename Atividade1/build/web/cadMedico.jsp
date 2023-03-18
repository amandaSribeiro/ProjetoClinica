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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro de Medico</h1>
        
        <form action="" method="post" id="cadastro">
            <label>Nome do Medico</label><br>
            <input type="text" name="txtNome"><br>
            <label>Telefone</label><br>
            <input type="text" name="txtTel"><br>
            <label>Celular</label><br>
            <input type="text" name="txtCel"><br><!-- comment -->
            <br>
            <select name="txtEspecialidade">
                <option>Escolha uma opção</option>
                <option value="1">Clinico</option>
                <option value="2">Cardiologista</option>
                <option value="3">Pediatra</option>
            </select>
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
                String especialidade = request.getParameter("txtEspecialidade");            
               try{
                        st = new Conexao().conectar().createStatement();

                        st.executeUpdate("insert into tblMedico(nomeMedico,telMedico,celMedico,codEspecialidade) values('"+nome+"'"
                        +", '"+telefone+"', '"+celular+"', '"+especialidade+"')");     
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

