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
        <h1>Agendamendo de Consultas</h1>
                            <h1>Busca de Medico</h1> 
        <form action="buscarMedico.jsp" method="post">
            <input type="text" name="txtNome"><input type="submit" name="btnSalvar">
        </form>
        <br>
        <form action="" method="post" id="agendamento">
                    <h1>Lista de Medicos</h1>        
        <%  
            String especialidade = request.getParameter("txtEspecialidade");
                try{
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("Select m.codMedico, m.nomeMedico,e.especialidade from tblmedico m inner join tblespecialidade e on m.codEspecialidade = e.codespecialidade " );
                out.println("<table border=1><tr>");
                while(rs.next())
                {
                out.println("<td>" + rs.getString(1) + "</td>");
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3)+ "</td></tr>");  
                }
                 out.println("</table>");
                }
                catch(Exception e)
                {
                out.println(e);
                }  
            %>

            <label>Digite o nome do medico</label><br>
            <input type="number" name="numMedico"><br>
            <label>Escolha a data</label><br>
            <input type="date" name="data"><br>
            <label>Escolha a hora</label><br>
            <input type="time" name="hora">
            <input type="submit" name="btnSalvar">
        </form>
        <br>
        <a href="cadastro.jsp">Voltar</a>
    </body>
</html>

<%
            if(request.getParameter("btnSalvar")!=null){
                String medico = request.getParameter("numMedico");
                String data = request.getParameter("data");
                String hora = request.getParameter("hora");           
               try{
                        st = new Conexao().conectar().createStatement();

                        st.executeUpdate("insert into tblAgendamento(codMedico,codPaciente,dataAgendamento,horaAgendamento) values('"+medico+"'"
                        +",1, '"+data+"', '"+hora+"')");     
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


