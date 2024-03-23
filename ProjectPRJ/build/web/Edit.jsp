

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit</title>
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
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post" onsubmit="return validateForm()">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="submit" class="close" data-dismiss="modal" aria-hidden="true"><a href="managerproduct"></a>&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <!--                          <label>ID</label> -->
                                    <input value="${detail.id}" name="id" type="hidden" class="form-control" readonly required>
                                </div> 
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${detail.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input value="${detail.image}" name="image" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Image 2</label>
                                    <input value="${detail.image2}" name="image2" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Image 3</label>
                                    <input value="${detail.image3}" name="image3" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Image 4</label>
                                    <input value="${detail.image4}" name="image4" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${detail.price}" name="price" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <textarea name="title" class="form-control" required>${detail.title}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Model</label>
                                    <textarea name="model" class="form-control" required>${detail.model}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Color</label>
                                    <textarea name="color" class="form-control" required>${detail.color}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Delivery</label>
                                    <textarea name="delivery" class="form-control" required>${detail.delivery}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" >${detail.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select id="category-select" name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCC}" var="o">
                                            <c:choose>
                                                <c:when test="${o.cid == detail.cateid}">
                                                    <option value="${o.cid}" selected>${o.cname}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${o.cid}">${o.cname}</option>
                                                </c:otherwise>
                                            </c:choose>
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
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


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