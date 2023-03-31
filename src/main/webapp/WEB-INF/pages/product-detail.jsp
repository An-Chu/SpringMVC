<%-- 
    Document   : product-details
    Created on : Mar 18, 2023, 1:16:53 PM
    Author     : AnChuPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container py-5">
    <div class="row">
    <div class="col-md-5 col-12">
        <img src="${product.image}" class="img-fluid" alt="alt"/>
    </div>
    <div class="col-md-7 col-12">
        <h1>Tên sản phẩm: ${product.name}</h1>
        <p>Giá: ${product.price} VNĐ</p>
        <p>Miêu tả: ${product.description}</p>
    </div>
</div>
    
</div>
