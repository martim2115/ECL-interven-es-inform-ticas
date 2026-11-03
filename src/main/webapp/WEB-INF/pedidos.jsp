<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List,java.util.Collections,pt.ecl.Pedido,pt.ecl.Html" %>
<%
List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
if (pedidos == null) {
    pedidos = Collections.emptyList();
}

String base = request.getContextPath();
if (base == null) {
    base = "";
}

Object mensagem = session.getAttribute("mensagem");
session.removeAttribute("mensagem");

Object erro = request.getAttribute("erro");
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Pedidos de intervenção</title>
    <link rel="stylesheet" href="<%= base %>/estilo.css">
</head>
<body>
    <a href="<%= base %>/">Página inicial</a>
    <h1>Pedidos de intervenção informática</h1>

    <% if (erro != null) { %>
        <p class="erro"><%= Html.escapar(erro) %></p>
    <% } %>

    <% if (mensagem != null) { %>
        <p class="sucesso"><%= Html.escapar(mensagem) %></p>
    <% } %>

    <h2>Comunicar um problema</h2>
    <form method="post" action="<%= base %>/pedidos">
        <input type="hidden" name="acao" value="criar">
        
        <label for="nome">Nome do requerente</label>
        <input id="nome" name="nome" required value="<%= Html.escapar(request.getParameter("nome")) %>">

        <label for="sala">Sala</label>
        <input id="sala" name="sala" required placeholder="Exemplo: Pólux" value="<%= Html.escapar(request.getParameter("sala")) %>">

        <label for="equipamento">Equipamento ou serviço</label>
        <input id="equipamento" name="equipamento" required placeholder="Exemplo: PC-07" value="<%= Html.escapar(request.getParameter("equipamento")) %>">

        <label for="descricao">Descrição do problema</label>
        <textarea id="descricao" name="descricao" required minlength="20"><%= Html.escapar(request.getParameter("descricao")) %></textarea>

        <button type="submit">Enviar pedido</button>
    </form>

    <h2>Acompanhamento</h2>
    <p>Total de pedidos: <%= pedidos.size() %></p>

    <% if (pedidos.isEmpty()) { %>
        <p>Ainda não existem pedidos.</p>
    <% } else { %>
        <% for (Pedido p : pedidos) { %>
            <article>
                <h3>Pedido <%= p.id %> — <%= Html.escapar(p.sala) %></h3>
