import jakarta.servlet.*;          
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/pedido")
public class PedidoServlet extends HttpServlet {

    private static final List<String> TIPOS = List.of("Equipamento", "Software", "Rede");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/formulario.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");   

        String sala = limpar(req.getParameter("sala"));
        String tipo = limpar(req.getParameter("tipo"));
        String descricao = limpar(req.getParameter("descricao"));

        boolean erro = false;
        if (sala.isEmpty()) {
            req.setAttribute("erroSala", "A sala é obrigatória.");
            erro = true;
        }
        if (!TIPOS.contains(tipo)) {
            req.setAttribute("erroTipo", "Escolha Equipamento, Software ou Rede.");
            erro = true;
        }
        if (descricao.length() < 10) {
            req.setAttribute("erroDescricao", "A descrição deve ter pelo menos 10 caracteres.");
            erro = true;
        }

        req.setAttribute("sala", sala);
        req.setAttribute("tipo", tipo);
        req.setAttribute("descricao", descricao);

        String destino = erro ? "/formulario.jsp" : "/confirmacao.jsp";
        req.getRequestDispatcher(destino).forward(req, resp);
    }

    private static String limpar(String valor) {
        return valor == null ? "" : valor.trim();
    }
}
