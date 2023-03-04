<%-- 
    Document   : index
    Created on : Mar 4, 2023, 1:25:43 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SpringMVC</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Bán hàng</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <c:forEach items="${categories}" var="c">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="#">${c.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <section class="container">

            <div class="row">
                <c:forEach items="${products}" var="p">
                    <div class="card col-md-4 col-xs-12 m-2" style="width:400px">
                        <img class="card-img-top" src="${p.image}" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">${p.name}</h4>
                            <p class="card-text">${p.price} VND</p>
                            <a href="#" class="btn btn-danger">Đặt hàng</a>
                            <a href="#" class="btn btn-primary">Xem chi tiết</a>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </section>

        <footer>
            <div class="mt-4 p-5 bg-dark text-white rounded">
                <h1>Footer</h1>
                <p>Lorem ipsum...</p>
            </div>
        </footer>
    </body>
</html>
