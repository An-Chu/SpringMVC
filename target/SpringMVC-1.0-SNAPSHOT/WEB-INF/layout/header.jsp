<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Bán hàng</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <c:forEach items="${categories}" var="c">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">${c.name}</a>
                    </li>
                </c:forEach>
            </ul>
            <c:url value="action" var="/"></c:url>
            <form class="d-flex" action="${action}">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="kw">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<!--<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="#">Trang ch?</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Danh m?c</a>
        </li>
    </ul>
</nav>-->