<%-- 
    Document   : index
    Created on : Jul 13, 2024, 1:15:52 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">e-Commerce Admin</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Trang chủ</a>
                        </li>
                        <c:forEach items="${cates}" var="c">
                            <c:url value="/" var="cateUrl">
                                <c:param name="cateId" value="${c.id}" />
                            </c:url>
                            <li class="nav-item">
                                <a class="nav-link" href="${cateUrl}">${c.name}</a>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
            </div>
        </nav>

        <section class="container">
            <div class="row">
                <div class="col-md-3 col-12 bg-secondary">
                    <c:url value="/" var="action" />
                    <form action="${action}">
                        <div class="mb-3 mt-3">
                            <label for="q" class="form-label">Từ khóa:</label>
                            <input type="search" class="form-control" id="q" placeholder="Từ khóa..." name="q">
                        </div>
                        <div class="mb-3 mt-3">
                            <label for="fromPrice" class="form-label">Từ giá:</label>
                            <input type="number" class="form-control" id="fromPrice" placeholder="Từ giá..." name="fromPrice">
                        </div>
                        <div class="mb-3 mt-3">
                            <label for="toPrice" class="form-label">Đến giá:</label>
                            <input type="number" class="form-control" id="toPrice" placeholder="Đến giá..." name="toPrice">
                        </div>
                        <div class="mb-3 mt-3">
                            <input type="submit" class="btn btn-success" value="Tìm SP" />
                        </div>
                    </form>
                </div>
                <div class="col-md-9 col-12">
                    <table class="table table-striped">
                        <tr>
                            <th></th>
                            <th>Id</th>
                            <th>Tên sản phẩm</th>
                            <th>Gía bán</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${products}" var="p">
                            <tr>
                                <td>
                                    <img width="120" src="${p.image}" alt="${p.name}" />
                                </td>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>${String.format("%,d", p.price)} VND</td>
                                <td>
                                    <a href="#" class="btn btn-info">&#128394;</a>
                                    <button class="btn btn-danger">&times;</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

        </section>
    </body>
</html>
