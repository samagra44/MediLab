<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@include file='components/allCss.jsp' %>
<nav class="navbar navbar-expand-lg navbar-light bg-warning"> 
 

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <a class="navbar-brand" href="index.jsp">  <i class="fa-regular fa-hospital"></i> MediLab</a>
            <c:if test="${empty userObj}">
             
                <li class="nav-item active">
                    <a class="nav-link" href="admin_login.jsp"> <i class="fa-solid fa-right-from-bracket"></i> Admin <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="doctor_login.jsp"><i class="fa-sharp fa-solid fa-stethoscope"></i> Doctor <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="user_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> Appointment <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="user_login.jsp"><i class="fa-solid fa-user"></i> User <span class="sr-only">(current)</span></a>
                </li>
            </c:if>


            <c:if test="${not empty userObj}">
                <li class="nav-item active">
                    <a class="nav-link" href="user_appointment.jsp"><i class="fa-solid fa-handshake"></i> Book Appointment <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="view_appointment.jsp"><i class="fa-solid fa-eye"></i> View Appointment <span class="sr-only">(current)</span></a>
                </li>
                  <li class="nav-item dropdown">
                 <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                         ${userObj.fullName}
                    </a>
                  <div class="dropdown-menu">
                      <a class="dropdown-item" href="change_password.jsp">Change Password</a>
                      <a class="dropdown-item" href="userLogout">Logout</a>
                     

                    </div>
                  </li>
            
            </c:if>
        </ul>
    </div>
</nav>