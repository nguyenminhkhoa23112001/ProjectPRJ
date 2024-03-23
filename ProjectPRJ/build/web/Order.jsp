<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Invoice</title>
    </head>
    <body onload="loadTotalMoney()" >
        <jsp:include page="Menu1.jsp"></jsp:include>
            <div id="logreg-forms">
                <form class="form" action="addorder" method="post">
                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Invoice</h1>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
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
                        <tr>
                            <th scope="col" class="border-0 bg-light">
                                <div class="p-2 px-3 text-uppercase">Product</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase">Price</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase">Color</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase">Delivery</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase">Size</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase">Quantity</div>
                            </th>
                            <th scope="col" class="border-0 bg-light">
                                <div class="py-2 text-uppercase">Delete</div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listCart}" var="o">
                                <c:forEach items="${listProduct}" var="p">
                                    <c:if test="${o.productID == p.id}">
                                        <tr>
                                            <th scope="row">
                                                <div class="p-2">

                                                    <img src="${p.image}" alt="" width="70" class="img-fluid rounded shadow-sm">

                                                    <div class="ml-3 d-inline-block align-middle">
                                                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${p.name}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                    </div>
                                                </div>
                                            </th>
                                            <td class="align-middle"><strong>${p.price}$</strong></td>
                                            <td class="align-middle"><strong>${p.color}</strong></td>
                                            <td class="align-middle"><strong>${p.delivery}</strong></td>

                                            <td class="align-middle">
                                                <strong>${o.size}</strong>
                                            </td>

                                            <td class="align-middle">
                                                <strong>${o.amount}</strong>                                               
                                            </td>
                                        </tr> 
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <label for="name">Name</label>
                <input name="name" type="text" id="name" class="form-control" placeholder="Name" required="" autofocus="">
                <label for="phoneNumber">Phone number</label>
                <input name="phoneNumber" type="text" id="phoneNumber" class="form-control" placeholder="Phone number" required="" autofocus="">           
                <label for="deliveryAddress">Delivery Address</label>
                <input name="deliveryAddress" type="text" id="deliveryAddress" class="form-control" placeholder="Delivery Address" required="" autofocus="">
                <label for="typepay">Payment methods</label>
                <select name="typepay" id="typepay">
                    <option value="onbank">Bank card</option>
                    <option value="ondelivery">Payment on delivery</option>            
                </select>
                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total amount you have to pay</strong><strong>${totalmoney} </strong></li>
                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Transport fee</strong><strong>Free ship</strong></li>
                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT</strong><strong>10 %</strong></li>
                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total payment</strong>
                    <h5 class="font-weight-bold">${totalmoneyvat} </h5>
                </li>
                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-american-sign-language-interpreting"></i>Dat Hang</button>
            </form>


            <br>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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