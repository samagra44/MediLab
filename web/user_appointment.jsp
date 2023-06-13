<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>User Appointment</title>
        <%@include file='components/allCss.jsp' %>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            }
            .ele{
                background-color: #99DBF5;
            }

            .backImg {
                background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                    url("images/keith-misner-h0Vxgz5tyXA-unsplash.jpg");
                height: 20vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body class="ele">
        <%@include file='navbar.jsp' %>

        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 p-5">
                    <img alt="" src="images/Doctors.JPG" class="img-fluid img-thumbnail" style="width: 450px; height: 500px; float: left;">
                </div>

                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-3">Book your Appointment</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-4 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <p class=" fs-4 text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                            <form class="row g-3" action="appAppointment" method="post">

                                <input type="hidden" name="userid" value="${userObj.id }">

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Full Name</label> <input
                                        required type="text" class="form-control" name="fullname">
                                </div>

                                <div class="col-md-6">
                                    <label>Gender</label> <select class="form-control" name="gender"
                                                                  required>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Age</label> <input
                                        required type="number" class="form-control" name="age">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Appointment
                                        Date</label> <input type="date" class="form-control" required
                                                        name="appoint_date">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Email</label> <input
                                        required type="email" class="form-control" name="email">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Phone No</label> <input
                                        maxlength="10" required type="number" class="form-control"
                                        name="phno">
                                </div>


                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Diseases</label> <input
                                        required type="text" class="form-control" name="diseases">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Doctor</label> <select
                                        required class="form-control" name="doct">
                                        <option value="">--select--</option>

                                        <%
                                        DoctorDao dao = new DoctorDao(DBConnect.getCon());
                                        List<Doctor> list = dao.getAllDoctor();
                                        for (Doctor d : list) {
                                        %>
                                        <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
                                        </option>
                                        <%
                                        }
                                        %>




                                    </select>
                                </div>

                                <div class="col-md-12">
                                    <label>Full Address</label>
                                    <textarea required name="address" class="form-control" rows="3"
                                              cols=""></textarea>
                                    <br>
                                </div>

                                <c:if test="${empty userObj }">
                                    <a href="user_login.jsp" class="btn btn-block btn-success btn-block">Submit</a>
                                </c:if>

                                <c:if test="${not empty userObj }">
                                    <button class="btn-block btn btn-success btn-block">Submit</button>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </body>
</html>