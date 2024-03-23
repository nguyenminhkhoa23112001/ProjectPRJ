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

                            <h2>Manage Product</h2>

                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
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
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td>
                                    <!--                                    <span class="custom-checkbox">
                                                    <input type="checkbox" class="checkbox" name="options[]" value="${o.id}" onchange="updateSelectedIds()">
                                                    <label for="checkbox${o.id}"></label>
                                                                        </span>-->
                                </td>
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>
                                    <img src="${o.image}">
                                </td>
                                <td>${o.price} $</td>
                                <td>
                                    <a href="loadProduct?pid=${o.id}"><button type="button" class="btn btn-warning"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button></a>
                                    <a href="delete?pid=${o.id}"><button type="button" class="btn btn-danger"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:set var="page" value="${requestScope.page}"/>                    
                <div class="clearfix">
                    <div class="hint-text">Showing <b>${page}</b> out of <b>${requestScope.num}</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item"><a href="managerproduct?page=${page-1==0?(1):(page-1)}" class="page-link">Previous</a></li>
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">                                                     
                            <li class="page-item"><a href="managerproduct?page=${i}" class="page-link">${i}</a></li>                          
                            </c:forEach>
                        <li class="page-item"><a href="managerproduct?page=${page+1>num?(num):(page+1)}" class="page-link">Next</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post" onsubmit="return validateForm()">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	

                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Image 2</label>
                                <input name="image2" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Image 3</label>
                                <input name="image3" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Image 4</label>
                                <input name="image4" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" ">
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Model</label>
                                <input name="model" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <input name="color" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Delivery</label>
                                <input name="delivery" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" ></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select id="category-select" name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                    <option value="other">Other</option>
                                </select>
                            </div>

                            <div class="form-group" id="category-input-group" style="display: none;">
                                <label>Enter Category</label>
                                <input type="text" id="category-input" class="form-control" name="customCategory" placeholder="Enter custom category">
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
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->

        <script src="js/manager.js" type="text/javascript"></script>
        <script>
                        var selectBox = document.getElementById("category-select");
                        var inputBox = document.getElementById("category-input");
                        var inputGroup = document.getElementById("category-input-group");

                        selectBox.addEventListener("change", function () {
                            if (selectBox.value === "other") {
                                inputGroup.style.display = "block";
                                inputBox.disabled = false;
                            } else {
                                inputGroup.style.display = "none";
                                inputBox.disabled = true;
                            }
                        });
                        var form = document.getElementById("your-form-id");

                        form.addEventListener("submit", function (event) {
                            // Kiểm tra nếu người dùng đã chọn "Other"
                            if (selectBox.value === "other") {
                                // Lấy giá trị từ ô input và gán cho tham số customCategory
                                var customCategoryValue = inputBox.value;
                                // Thêm tham số customCategory vào URL của biểu mẫu
                                form.action = form.action + "?customCategory=" + customCategoryValue;
                            }
                        });
                        function validateForm() {
                            var price = parseFloat(document.getElementsByName("price")[0].value);
                            if (price < 0) {
                                var confirmation = confirm("Bạn có chắc chắn muốn để price là: " + price + " không?");
                                if (confirmation) {
                                    // Nếu người dùng nhấn OK, cho phép gửi form
                                    return true;
                                } else {
                                    // Nếu người dùng nhấn Cancel, ngăn chặn gửi form
                                    return false;
                                }
                            }
                            // Cho phép gửi form nếu giá trị không là số âm
                            return true;
                        }
        </script>
    </body>
</html>