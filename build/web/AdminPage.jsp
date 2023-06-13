<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file='components/allCss.jsp' %>
        <style>
             .ele{
             background-color: #99DBF5;
        }
        </style>
    </head>
    <body class="ele">
        <%@include file="admin_navbar.jsp" %>
        <c:if test="${ empty adminObj }">
            <c:redirect url="admin_login.jsp"></c:redirect>
        </c:if>
        <h1 class="text-center container p-5">Admin Dashboard</h1>
        <c:if test="${not empty errorMsg}">
            <p class="fs-3 text-center text-danger">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session" />
        </c:if>
        <c:if test="${not empty succMsg}">
            <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
            <c:remove var="succMsg" scope="session" />
        </c:if>
        <%
            DoctorDao dao = new DoctorDao(DBConnect.getCon());
        %>
        <div class="row">
            <div class="col-md-4">
                <div class="card paint-card bg-info">
                    <div class="card-body text-center text-white">
                        <i class="fas fa-user-md fa-3x"></i><br>
                        <p class="fs-4 text-center">
                           Doctor<br><%=dao.countDoctor()%>
                        </p>
                    </div>
                </div>
            </div>



            <div class="col-md-4">
                <div class="card paint-card bg-info">
                    <div class="card-body text-center text-white">
                        <i class="fas fa-user-circle fa-3x"></i><br>
                        <p class="fs-4 text-center">
                            User<br><%=dao.countUSer()%>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card paint-card bg-info">
                    <div class="card-body text-center text-white">
                        <i class="far fa-calendar-check fa-3x"></i><br>
                        <p class="fs-4 text-center">
                            Total Appointment<br><%=dao.countAppointment()%>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mt-2">

                <div class="card paint-card bg-info">
                    <div class="card-body text-center text-white">
                        <i class="far fa-calendar-check fa-3x"></i><br>
                        <p class="fs-4 text-center">
                            Specialist<br><%=dao.countSpecialist()%>
                        </p>
                        <button class="btn btn-info btn-block" data-toggle="modal" data-target="#exampleModal">Click to add</button>
                    </div>
                </div>

            </div>



            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="addSpecialist" method="post">

                                <div class="form-group">
                                    <label>Enter Specialist Name</label> <input type="text"
                                                                                name="specName" class="form-control" placeholder="Enter Specialist here..">
                                </div>
                                <div class="text-center mt-3">
                                    <button type="submit" class="btn btn-success btn-block">Add</button>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                           
                        </div>
                    </div>
                </div>
            </div>


    </body>
</html>
