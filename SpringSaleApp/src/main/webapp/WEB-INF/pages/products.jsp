<%-- 
    Document   : products
    Created on : Jul 20, 2024, 1:17:08 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-primary mt-1">QUẢN TRỊ SẢN PHẨM</h1>

<c:url value="/products" var="action" />
<form:form method="post" action="${action}" modelAttribute="product" enctype="multipart/form-data">
    
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    
    <div class="mb-3 mt-3">
        <label for="name" class="form-label">Tên sản phẩm</label>
        <form:input path="name" type="text" class="form-control" id="name" placeholder="Tên sản phẩm" name="name" />
       
    </div>
    <div class="mb-3 mt-3">
        <label for="price" class="form-label">Gía sản phẩm</label>
        <form:input path="price" type="number" class="form-control" id="price" placeholder="Gía sản phẩm" name="price" />
    </div>
    <div class="mb-3 mt-3">
        <label for="cate" class="form-label">Danh mục sản phẩm</label>
        <form:select path="categoryId" id="cate" class="form-select">
            <c:forEach items="${cates}" var="c">
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
    </div>
    <div class="mb-3 mt-3">
        <label for="file" class="form-label">Ảnh sản phẩm</label>
        <form:input path="file" accept=".png,.jpg" type="file" class="form-control" id="file" name="file" />
        <c:if test="${product.id != null}">
            <img src="${product.image}" alt="${product.name}" width="120" />
        </c:if>
    </div>

    <div class="mb-3 mt-3">
        <form:hidden path="id" />
        <form:hidden path="image" />
        <button type="submit" class="btn btn-success">
            <c:choose>
                <c:when test="${product.id != null}">Cập nhật sản phẩm</c:when>
                <c:otherwise> Thêm sản phẩm</c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>

