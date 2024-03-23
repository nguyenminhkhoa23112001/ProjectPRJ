<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">

                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">

                    <!--            Xử lý category-->
                <jsp:include page="Left.jsp"></jsp:include> 

                    <div class="col-sm-9">
                        <div class="row">
                        <c:forEach items="${list}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                        <p class="card-text show_txt">${o.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.price} $</p>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <c:set var="page" value="${requestScope.page}"/>                    
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                        <ul class="pagination">
                            <li class="page-item"><a href="home?page=${page-1==0?(1):(page-1)}" class="page-link">Previous</a></li>
                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">                                                     
                                <li class="page-item"><a href="home?page=${i}" class="page-link">${i}</a></li>                          
                                </c:forEach>
                            <li class="page-item"><a href="home?page=${page+1>num?(num):(page+1)}" class="page-link">Next</a></li>

                        </ul>
                    </div>
                </div>

            </div>

        </div>

        <style>
            .card-img-top {
                object-fit: cover;
                width: 100%;
                height: 200px; /* Đặt chiều cao cố định cho ảnh */
            }
        </style>
        <script>
           window.addEventListener("load", function loadAmountCart() {
            $.ajax({
                url: "/ProjectSE1762_HE170538/loadAllAmountCart",
                type: "get", //send it through get method
                data: {

                },
                success: function (responseData) {
                    document.getElementById("amountCart").innerHTML = responseData;
                }
            });
        }, false);
        </script>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

