package ar.edu.grupoesfera.cursospring.modelo;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class HttpSessionCollector implements HttpSessionListener {
    private static final Map<String, HttpSession> sessions = new HashMap<String, HttpSession>();

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        sessions.put(session.getId(), session);
    }


    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        sessions.remove(event.getSession().getId());
    }

    public static HttpSession find(String sessionId) {
        return sessions.get(sessionId);
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response) throws IOException{

       
        if (request.getServletPath() == "/vistaPrueba"){
            return true;
    }

        ServletRequest session = null;
    	@SuppressWarnings("null")
    	Persona per=(Persona) session.getAttribute("per");
        if(per == null)
        {
            System.err.println("Request Path : ");
            response.sendRedirect("index");
            return false;
        }
        else
        {
            return true;
        }
    }

}