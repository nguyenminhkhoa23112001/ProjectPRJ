<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><a href="home">Back</a></h2>

                            <h2>Manage Account</h2>

                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Account</span></a>
                            <!--                            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						-->
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <!--                                <span class="custom-checkbox">
                                                                    <input type="checkbox" id="selectAll">
                                                                    <label for="selectAll"></label>
                                                                </span>-->
                            </th>
                            <c:if test="${mess ne null}">
                        <p class="alert alert-danger" role="alert">
                            ${mess}
                        </p>
                    </c:if>
                    <th>ID</th>
                    <th>User</th>
                    <th>Pass</th>
                    <th>Seller</th>
                    <th>Admin</th>
                    <th>Email</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listA}" var="o">
                            <tr>
                                <td>
                                    <!--                                    <span class="custom-checkbox">
                                                    <input type="checkbox" class="checkbox" name="options[]" value="${o.id}" onchange="updateSelectedIds()">
                                                    <label for="checkbox${o.id}"></label>
                                                                        </span>-->
                                </td>                                
                                <td>${o.id}</td>
                                <c:if test="${o.id!=1}">
                                    <td>${o.user}</td> 
                                </c:if>
                                <c:if test="${o.id==1}">
                                    <td></td> 
                                </c:if>
                                <td></td>


                                <c:if test="${o.isSell==1}">
                                    <td>   &#10004</td>
                                </c:if>
                                <c:if test="${o.isSell!=1}">
                                    <td>   &#10006</td>
                                </c:if>
                                <c:if test="${o.isAdmin==1}">
                                    <td>   &#10004</td>
                                </c:if>
                                <c:if test="${o.isAdmin!=1}">
                                    <td>   &#10006</td>
                                </c:if>


                                <td></td>

                                <td>
                                    <a href="#" onclick="checkAdminPassword1('${o.id}')">
                                        <button type="button" class="btn btn-warning">
                                            <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                        </button>
                                    </a>

                                    <script>
                                        function checkAdminPassword1(accountId) {
                                            var adminPassword = prompt("Please enter admin password:");
                                            // Kiểm tra mật khẩu của admin ở đây
                                            if (adminPassword === "24102003") {
                                                // Nếu mật khẩu đúng, chuyển hướng đến trang loadaccount
                                                window.location.href = "loadaccount?aid=" + accountId;
                                            } else {
                                                // Nếu mật khẩu sai, hiển thị thông báo hoặc xử lý khác tùy ý
                                                alert("Incorrect admin password. Please try again.");
                                            }
                                        }
                                    </script>
<!--                                    <a href="loadaccount?aid=${o.id}"><button type="button" class="btn btn-warning"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button></a>-->
                                    <c:if test="${o.id !=1}">    
                                        <a href="#" onclick="checkAdminPassword('${o.id}')">
                                            <button type="button" class="btn btn-danger">
                                                <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                            </button>
                                        </a>

<!--                                        <a href="delete?pid=${o.id}"><button type="button" class="btn btn-danger"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button></a>-->
                                    </c:if> 
                                    <script>
                                        function checkAdminPassword(accountId) {
                                            var adminPassword = prompt("Please enter admin password:");
                                            // Kiểm tra mật khẩu của admin ở đây
                                            if (adminPassword === "24102003") {
                                                // Nếu mật khẩu đúng, chuyển hướng đến trang loadaccount
                                                window.location.href = "deleteaccount?aid=" + accountId;
                                            } else {
                                                // Nếu mật khẩu sai, hiển thị thông báo hoặc xử lý khác tùy ý
                                                alert("Incorrect admin password. Please try again.");
                                            }
                                        }
                                    </script>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:set var="page" value="${requestScope.page}"/>                    
                <div class="clearfix">
                    <div class="hint-text">Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item"><a href="manageraccount?page=${page-1==0?(1):(page-1)}" class="page-link">Previous</a></li>
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">                                                     
                            <li class="page-item"><a href="manageraccount?page=${i}" class="page-link">${i}</a></li>                          
                            </c:forEach>
                        <li class="page-item"><a href="manageraccount?page=${page+1>num?(num):(page+1)}" class="page-link">Next</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addaccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	

                            <div class="form-group">
                                <label>User</label>
                                <input name="user" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>PassWord</label>
                                <input name="pass" type="text" class="form-control" >
                            </div>

                            <div class="form-group">
                                <label>Is Sell</label>
                                <input type="checkbox" name="isSellCheckbox" class="form-check-input" >
                                <input type="hidden" name="isSell" value="${detail.isSell}">
                            </div>
                            <div class="form-group">
                                <label>Is Admin</label>
                                <input type="checkbox" name="isAdminCheckbox" class="form-check-input" >
                                <input type="hidden" name="isAdmin" value="${detail.isAdmin}">
                            </div>

                            <script>
                                const isSellCheckbox = document.querySelector('input[name="isSellCheckbox"]');
                                const isAdminCheckbox = document.querySelector('input[name="isAdminCheckbox"]');
                                const isSellHiddenInput = document.querySelector('input[name="isSell"]');
                                const isAdminHiddenInput = document.querySelector('input[name="isAdmin"]');

                                isSellCheckbox.addEventListener('change', function () {
                                    isSellHiddenInput.value = this.checked ? 1 : 0;
                                });

                                isAdminCheckbox.addEventListener('change', function () {
                                    isAdminHiddenInput.value = this.checked ? 1 : 0;
                                });
                            </script>

                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="text" class="form-control" >
                            </div>                          


                        </div>
                        <div class="modal-footer">  
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <script>

        </script>
    </body>
</html>