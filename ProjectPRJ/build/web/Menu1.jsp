<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home">Digital</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test = "${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manageraccount">Manager Account</a>
                    </li>
                </c:if>

                <c:if test = "${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="managerproduct">Manager Product</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello ${sessionScope.acc.user}</a>
                    </li>
                </c:if>  
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="EditProfile.jsp">Edit Profile</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="invoice">Invoice</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc != null}">

                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <form action="Login.jsp" method="post">
                        <li class="nav-item">
                            <button style="background-color: #343a40!important;color: white"  type="submit">Login</button>
                        </li>
                    </form>
                </c:if>
            </ul>
            <form action="search" method="post" class="form-inline my-2 my-lg-0">              
                <a class="btn btn-success btn-sm ml-3" href="managerCart">
                    <i class="fa fa-shopping-cart"></i> <span style="font-size: 14px;">Cart</span>
                    <b><span id="amountCart" class="badge badge-light" style="color:black; font-size: 12px;"></span></b>  
                </a>
            </form>
        </div>
    </div>
</nav>

<!--end of menu-->
