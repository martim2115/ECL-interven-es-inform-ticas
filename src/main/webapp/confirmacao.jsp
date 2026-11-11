<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head><meta charset="UTF-8"><title>Confirmação</title></head>
<body>
<h1>Pedido validado com sucesso</h1>
<p><strong>Sala:</strong> <c:out value="${sala}"/></p>
<p><strong>Tipo de avaria:</strong> <c:out value="${tipo}"/></p>
<p><strong>Descrição:</strong> <c:out value="${descricao}"/></p>
</body>
</html>
