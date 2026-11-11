<%@ page contentType="text/html;charset=UTF-8" %>
<%-- JSTL 1.2 (javax): http://java.sun.com/jsp/jstl/core
     JSTL 3 (Jakarta, Tomcat 10+): jakarta.tags.core --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head><meta charset="UTF-8"><title>Comunicar avaria</title></head>
<body>
<h1>Comunicar avaria</h1>
<form method="post" action="${pageContext.request.contextPath}/pedido">
  <p>
    <label>Sala: <input type="text" name="sala" value="<c:out value='${sala}'/>"></label>
    <span style="color:red"><c:out value="${erroSala}"/></span>
  </p>
  <p>
    <label>Tipo de avaria:
      <select name="tipo">
        <option value="">-- escolher --</option>
        <option value="Equipamento" ${tipo == 'Equipamento' ? 'selected' : ''}>Equipamento</option>
        <option value="Software"    ${tipo == 'Software'    ? 'selected' : ''}>Software</option>
        <option value="Rede"        ${tipo == 'Rede'        ? 'selected' : ''}>Rede</option>
      </select>
    </label>
    <span style="color:red"><c:out value="${erroTipo}"/></span>
  </p>
  <p>
    <label>Descrição:<br>
      <textarea name="descricao" rows="4" cols="40"><c:out value="${descricao}"/></textarea>
    </label>
    <span style="color:red"><c:out value="${erroDescricao}"/></span>
  </p>
  <button type="submit">Enviar</button>
</form>
</body>
</html>
