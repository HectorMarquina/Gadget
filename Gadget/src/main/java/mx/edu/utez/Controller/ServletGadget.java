package mx.edu.utez.Controller;

import com.google.gson.Gson;
import mx.edu.utez.Model.Address.BeanAddress;
import mx.edu.utez.Model.Gadget.BeanGadget;
import mx.edu.utez.Model.Gadget.DaoGadget;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ServletGadget", urlPatterns = {"/readGadget", "/createGadget", "/updateGadget", "/deleteGadget", "/findById"})
public class ServletGadget extends HttpServlet {
    private Map map = new HashMap();
    final private Logger CONSOLE = LoggerFactory.getLogger(ServletGadget.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        map.put("listGadgets", new DaoGadget().findAll());
        write(response, map);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        BeanGadget beanGadget = new BeanGadget();
        BeanAddress beanAddress = new BeanAddress();

        switch (action){
            case "create":
                String name = request.getParameter("name");
                String street = request.getParameter("street");
                String suburb = request.getParameter("suburb");
                int postalCode = Integer.parseInt(request.getParameter("postalCode"));
                String state = request.getParameter("state");
                String country = request.getParameter("country");
                String date = request.getParameter("date");
                beanAddress = new BeanAddress(0,street,suburb,postalCode,state,country);
                beanGadget = new BeanGadget(0,name,date,beanAddress,0);
                boolean flag = new DaoGadget().create(beanGadget);

                if (flag){
                    map.put("message","Se ha registrado correctamente");
                } else {
                    map.put("message","No se registró correctamente");
                }
                response.sendRedirect(request.getContextPath() + "/readGadget");
                break;

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                int idAddress = Integer.parseInt(request.getParameter("idAddress"));
                String name1 = request.getParameter("name");
                String street1 = request.getParameter("street");
                String suburb1 = request.getParameter("suburb");
                int postalCode1 = Integer.parseInt(request.getParameter("postalCode"));
                String state1 = request.getParameter("state");
                String country1 = request.getParameter("country");
                String date1 = request.getParameter("date");
                beanAddress = new BeanAddress(idAddress,street1,suburb1,postalCode1,state1,country1);
                beanGadget = new BeanGadget(id,name1,date1,beanAddress,0);
                boolean flag1 = new DaoGadget().update(beanGadget);

                if (flag1){
                    CONSOLE.error("Se ha actualizado correctamente");
                } else {
                    CONSOLE.error("message", "No se actualizó correctamente");
                }
                request.getRequestDispatcher("/views/gadget/gadgets.jsp").forward(request,response);
                break;

            case "delete":
                if (new DaoGadget().delete(Integer.parseInt(request.getParameter("id2")))){
                    request.setAttribute("message", "Se ha eliminado correctamente");

                }else {
                    CONSOLE.error("No se eliminó correctamente");
                }
                request.getRequestDispatcher("/views/gadget/gadgets.jsp").forward(request,response);
                break;
            case "findById":
                long id3 = Long.parseLong(request.getParameter("id"));
                beanGadget= new DaoGadget().findById(id3);
                map.put("gadget", beanGadget);
                response.sendRedirect(request.getContextPath() + "/readGadget");
                break;


            default:
                request.getRequestDispatcher("/").forward(request, response);
                break;
        }

    }
    private void write(HttpServletResponse response, Map<String, Object> map) throws IOException{
        response.setContentType("aplication/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(map));
    }
}
