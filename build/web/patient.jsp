<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <%@include file='components/allCss.jsp' %>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
            .ele{
             background-color: #99DBF5;
             }
        </style>
    </head>
    <body class="ele">
      


        <%@include file="doctor_navbar.jsp"%>
        <hr>
        <div class="col-md-12">
            <div class="card paint-card bg-info text-white">
                <div class="card-body">
                    <p class="fs-3 text-center">Patient Details</p>
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty succMsg}">
                        <p class=" fs-4 text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Age</th>
                                <th scope="col">Appointment</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mob No</th>
                                <th scope="col">Diseases</th>
                                <th scope="col">Doctor Name</th>
                                <th scope="col">Address</th>
                                <th scope="col">Status</th>
                                 <th scope="col">Comment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            Doctor d = (Doctor) session.getAttribute("doctObj");
                            AppointmentDao dao = new AppointmentDao(DBConnect.getCon());
                            DoctorDao dao2 = new DoctorDao(DBConnect.getCon());
                            List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                            for (Appointment ap : list) {
                                  
                            %>
                            <tr>
                                <th><%=ap.getFullName()%></th>
                                <td><%=ap.getGender()%></td>
                                <td><%=ap.getAge()%></td>
                                <td><%=ap.getAppoinDate()%></td>
                                <td><%=ap.getEmail()%></td>
                                <td><%=ap.getPhNo()%></td>
                                <td><%=ap.getDiseases()%></td>
                                <td><%=d.getFullName()%>
                                <td><%=ap.getAddress()%></td>
                                <td><%=ap.getStatus()%></td>
                                <td>
                                    <%
                                    if("Pending".equals(ap.getStatus()))
                                    {%>
                                    <a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm">Comment</a>
                                    <%}else{%>
                                    <a href="#" class="btn btn-success btn-sm disabled">Comment</a>
                                    <%}
                                    %>
                                    
                                </td>
                            </tr>
                            <%
                            }
                            %>


                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>