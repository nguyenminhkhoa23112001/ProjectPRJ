<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
    </head>
    <body>
        <!--Main Navigation-->
        <header>
            <%@include file="Menu1.jsp" %>


            </header>
            <!--Main Navigation-->

            <!--Main layout-->
            <main>
                <div class="container pt-4">
                    <!--Section: Sales Performance KPIs-->
                    <section class="mb-4">
                    <c:if test="${error!=null }">
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    </c:if>
                    <c:if test="${mess!=null }">
                        <div class="alert alert-success" role="alert">
                            ${mess}
                        </div>
                    </c:if>

                    <div class="card">
                        <div class="card-header py-3 row">
                            <div class="col-sm-6">
                                <h5 class="mb-0 text-left" id="">
                                    <strong>Hóa Đơn</strong>
                                </h5>
                            </div>
                            <div class="col-sm-6">
                                <h5 class="mb-0 text-right" id="">
                                    <form action="xuatExcelControl" method="get"> 
                                        <input oninput="searchByDate(this)" type="date" id="dateHoaDon" name="dateHoaDon" class="form-control mb-0" style="width:30%">
                                        <button type="submit" class="mb-0 text-center btn btn-primary">Xuất file Excel</button> 
                                    </form> 
                                </h5>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col">Mã Hóa Đơn</th>
                                            <th scope="col">Account</th>
                                            
                                            <th scope="col">Nội Dung</th>
                                            <th scope="col">Số Điện Thoại</th>
                                            <th scope="col">Địa chỉ</th>
                                            <th scope="col">Tổng Giá($)</th>
                                            <th scope="col">Ngày Xuất</th>
                                        </tr>
                                    </thead>

                                    <tbody id="content">
                                        <c:forEach items="${listAllInvoice}" var="i">
                                            <tr>
                                                <th scope="row"></th>
                                                <td>${i.maHD }</td>
                                                <c:forEach items="${listAllAccount}" var="a">
                                                    <c:if test="${i.accountID==a.id }">
                                                        <td>${a.user }</td>
                                                    </c:if>
                                                </c:forEach>
                                                <td>${i.context}</td>
                                                <td>${i.phone}</td>
                                                <td>${i.delivery}</td>
                                                <td>${String.format("%.02f",i.tongGia) }</td>
                                                <td>${i.ngayXuat }</td> 
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> 
                            </div>
                        </div>
                    </div>
                </section>
                <!--Section: Sales Performance KPIs-->



            </div>
        </main>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!--Main layout-->
        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
        <!-- MDB Ecommerce JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
        <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>


        <script type="text/javascript" src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
        <script>
            function searchByDate(param) {
                var txtSearchDate = param.value;
                $.ajax({
                    url: "/Project/searchAjaxHoaDon",
                    type: "get", //send it through get method
                    data: {
                        ngayXuat: txtSearchDate
                    },
                    success: function (responseData) {
                        document.getElementById("content").innerHTML = responseData;
                    }

                });
            }
            
        </script>
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
    </body>
</html>