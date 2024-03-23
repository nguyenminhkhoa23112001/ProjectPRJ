

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
                            <h2>Edit Account</h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editaccount" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Account</h4>
                                <button type="submit" class="close" data-dismiss="modal" aria-hidden="true"><a href="manageraccount"></a>&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <!--                          <label>ID</label> -->
                                </div> 
                                <div class="form-group">
                                    <label>id =  ${detail.id}</label>
                                    <input value="${detail.id}" name="id" type="hidden" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>User</label>
                                    <input value="${detail.user}" name="user" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Pass</label>
                                    <input value="${detail.pass}" name="pass" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Seller</label>
                                    <input type="checkbox" name="isSellCheckbox" class="form-check-input" ${detail.isSell == 1 ? 'checked' : ''}>
                                    <input type="hidden" name="isSell" value="${detail.isSell}">
                                </div>
                                <div class="form-group">
                                    <label>Admin</label>
                                    <input type="checkbox" name="isAdminCheckbox" class="form-check-input" ${detail.isAdmin == 1 ? 'checked' : ''}>
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
                                    <input  name="email" type="text" class="form-control" value="${detail.email}" readonly>
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
    </body>
</html>