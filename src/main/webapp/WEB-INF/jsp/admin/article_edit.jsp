
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/bootstrap4.0.min.css" >
    <script src="/js/jquery.slim.min.js" ></script>
    <script src="/js/popper.min.js" ></script>
    <script src="/js/bootstrap4.0.min.js"></script>
    <script type="text/javascript" src="/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/js/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript"  src="/js/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<div style="position: relative;top: 10%">
    <c:if test="${!empty succ}">
        <div class="alert alert-success" role="alert">
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>
</div>
<div class="container">
    <form action="/admin/article/edit/do" method="post">
        <input type="hidden" value="${article.id}" name="id">
        <div class="form-group">
            <label for="title">文章标题</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="文章标题" value="${article.title}">
        </div>
        <div class="form-group">
            <label for="catalogId">分类</label>
            <select class="form-control" id="catalogId" name="catalogId">
                <option value="1" <c:if test="${catalog.id==1}">selected="selected"</c:if>>学习</option>
                <option value="2" <c:if test="${catalog.id==2}">selected="selected"</c:if>>生活</option>
                <option value="3" <c:if test="${catalog.id==3}">selected="selected"</c:if>>科普</option>
            </select>
        </div>
        <div class="form-group">
            <label for="keywords">关键字</label>
            <input type="text" class="form-control" id="keywords" name="keywords" placeholder="关键字" value="${article.keywords}">
        </div>
        <div class="form-group">
            <label for="desci">简介</label>
            <textarea class="form-control" id="desci" rows="3" name="desci" placeholder="简介">${article.desci}</textarea>
        </div>
        <div class="form-group">
            <label for="div1">内容</label>
            <div id="div1">
            </div>
            <textarea class="form-control" id="content" rows="3" name="content" placeholder="">${article.content}</textarea>
        </div>
            <input type="submit" />
                </form>

                <script>
                $(function(){
                    var ue = UE.getEditor('editor');
                    ue.ready(function() {
                        ue.setContent($("#cont").html());
                    });
                });
            </script>
        </div>
</body>
</html>
