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
    </head>
    <body>
        <h1>Agendamendo de Consultas</h1>
        <form action="agendamento.jsp" method="post">
            <label class="form-label">Selecionar Paciente</label>
                <%
                try{
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("Select * from tbPaciente");
                out.println("<select class='form-select' name='txtPaciente'>");
                out.println("<option value='' disabled selected hidden>Paciente</option>");
                while (rs.next()) {
                    out.println("<option value="+rs.getString(1)+">" + rs.getString(2) + "</option>");
                }
                out.println("</select>");
                }catch(Exception e){
                    out.println(e);
                }
            %>
            <label class="form-label">Selecionar o medico</label>
            <%
                try{
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("Select * from tblMedico");
                
                out.println("<select class='form-select' name='txtMedico'>");
                out.println("<option value='' disabled selected hidden>Medico</option>");
                while (rs.next()) {
                    out.println("<option value="+rs.getString(1)+">" + rs.getString(2) + "</option>");
                }
                out.println("</select>");
                }catch(Exception e){
                    out.println(e);
                }
            %>
            
            <input class="form-control" type="date" name="data"><br>
            <input class="form-control" type="time" name="hora"><br>
            <input class="btn btn-info" type="submit" value="Agendar" name="btnAgendar">
                     
        </form>
    </body>
</html>
<%
    if (request.getParameter("btnAgendar") != null) {
        String paciente = request.getParameter("txtPaciente");
        String medico = request.getParameter("txtMedico");
        String data = request.getParameter("data");
        String hora = request.getParameter("hora");
        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("insert into tblAgendamento(dataAgendamento,horaAgendamento,codPaciente,codMedico) values('" + data + "'"
                    + ", '" + hora + "', '" + paciente + "', '" + medico + "')");
            out.println("<meta http-equiv='refresh' content='0;URL=cadastro.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro realizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }

    }
%>



