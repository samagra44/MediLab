<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary bg-warning">
    <div class="container-fluid">
         <a class="navbar-brand text-dark" href="index.jsp">  <i class="fa-regular fa-hospital text-dark"></i> MediLab</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link text-dark" href="doctor_index.jsp"><i class="fa-solid fa-house"></i> HOME</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="patient.jsp"> <i class="fa-solid fa-hospital-user"></i> PATIENT</a></li>
            </ul>


            <div class="dropdown">
                <button class="btn dropdown-toggle bg-warning" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle"></i> ${doctObj.fullName }
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="edit_profile.jsp">Edit
                            Profile</a></li>
                    <li><a class="dropdown-item" href="doctorLogout">Logout</a></li>
                </div>
            </div>

        </div>
    </div>
</nav>