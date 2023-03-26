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

    <c:if test="${errMsg != null}">
        <p class="txt-error">${errMsg}</p>
    </c:if>

    <c:url value="/admin/products/" var="admin"/>
    <c:url var="url" value="/"/>

    <form:form modelAttribute="product" method="POST" action="${admin}" enctype="multipart/form-data">

        <form:errors path="*" element="div" cssClass="alert alert-danger" />

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
                    <c:choose>
                        <c:when test="${c.id == product.categoryId.id}">
                            <option value="${c.id}" selected>${c.name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${c.id}">${c.name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </form:select>
            <label for="sel1" class="form-label">Select list (select one):</label>

        </div>
        <c:if test="${product.image != null && product.image != ''}">
            <img width="120" src="${product.image}"/>
        </c:if> 
        <div class="form-floating mb-3 mt-3">
            <form:input type="file" path="file" class="form-control" name="file" id="file" />
            <label for="file">Thêm ảnh</label>
        </div>

        <button class="btn btn-danger mt-3">Thêm sản phẩm</button>
    </form:form>



    <table class="table table-bordered mt-5">
        <thead>
            <tr>
                <th>id</th>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${products}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td><img width="120" src="${p.image}" /></td>
                    <td>${p.name}</td>
                    <td>${p.price}</td>
                    <td>
                        <div id="loader-${p.id}" class="spinner-border" role="status" style="display: none;">
                        </div>
                        <a href="${url}admin/products/${p.id}" class="btn btn-primary">Update</a>
                        <button id="btn-delete-${p.id}" class="btn btn-danger" onclick="deleteProduct('${url}api/product/${p.id}', ${p.id})">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>
<script src="${url}js/product.js"></script>
