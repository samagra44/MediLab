<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
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
        </style>
    </head>
    <body>
        <%@include file="admin_navbar.jsp" %>
        <div class="container-fluid p-3">
            <div class="row">

                <div class="col-md-4 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Edit Doctor Details</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <% 
                                int id = Integer.parseInt(request.getParameter("id"));
                                DoctorDao dao2 = new DoctorDao(DBConnect.getCon()); 
                                Doctor d = dao2.getDoctorById(id);
                             
                            %>   

                            <form action="updateDoctor" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label> <input type="text"
                                                                                       required  name="fullname" class="form-control" value="<%=d.getFullName()%>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">DOB</label> <input type="date"
                                                                                 required name="dob" class="form-control" value="<%=d.getDob()%>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Qualification</label> <input required
                                                                                           name="qualification" type="text" class="form-control" value="<%=d.getQualification()%>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Specialist</label> <select name="spec"
                                                                                         required class="form-control">
                                        <option><%=d.getSpecialist()%></option>

                                        <%
                                                                        SpecialistDao dao = new SpecialistDao(DBConnect.getCon());
                                                                        List<Specialist> list = dao.getAllSpecialist();
                                                                        for (Specialist s : list) {
                                        %>
                                        <option><%=s.getSpecialistName()%></option>
                                        <%
                                        }
                                        %>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label> <input type="text"
                                                                                   required name="email" class="form-control" value="<%=d.getEmail()%>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mob No</label> <input type="text"
                                                                                    required name="mobno" class="form-control" value="<%=d.getMobNo()%>">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password</label> <input required
                                                                                      name="password" type="password" class="form-control" value="<%=d.getPassword()%>">
                                </div>
                                <input type="hidden" name="id" value="<%=d.getId()%>">


                                <button type="submit" class="btn btn-primary col-md-12">UPDATE</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>