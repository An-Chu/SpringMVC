<%-- 
    Document   : products
    Created on : Mar 18, 2023, 1:56:04 PM
    Author     : AnChuPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<div class="container py-3" style="min-height: 100vh">

    <h1 class="text-center mb-3">Quản lý sản phẩm</h1>

    <c:url value="/admin/products/" var="admin"/>
    <form:form modelAttribute="product" method="POST" action="${admin}" enctype="multipart/form-data">
        <div class="form-floating mb-3 mt-3">
            <form:input path="name" class="form-control" placeholder="Enter name" name="name" id="name"/>
            <label for="email">Tên sản phẩm</label>

        </div>

        <div class="form-floating mb-3 mt-3">
            <form:input path="price" class="form-control" placeholder="Enter price" name="price" id="price" />
            <label for="price">Giá sản phẩm</label>
        </div>

        <div class="form-floating">

            <form:select path="categoryId" class="form-select" id="sel1" name="sellist">
                <c:forEach items="${categories}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </form:select>
            <label for="sel1" class="form-label">Select list (select one):</label>

        </div>

        <div class="form-floating mb-3 mt-3">
            <form:input type="file" path="file" class="form-control" name="file" id="file" />
            <label for="file">Thêm ảnh</label>
        </div>

        <button class="btn btn-danger mt-3">Thêm sản phẩm</button>
    </form:form>

</div>