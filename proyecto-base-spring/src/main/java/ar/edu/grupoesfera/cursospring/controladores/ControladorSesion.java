package ar.edu.grupoesfera.cursospring.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.grupoesfera.cursospring.modelo.Persona;

@Controller
@SessionAttributes("personaSesion")
public class ControladorSesion {

	@RequestMapping("/iniciarSesion")
	public ModelAndView inicioSesion(){
		ModelAndView miSesion = new ModelAndView();
		miSesion.addObject("persona",new Persona());
		miSesion.setViewName("inicioSesion");
		return miSesion;
	}
	
	@RequestMapping(value="/procesar-persona",method = RequestMethod.POST)
	public ModelAndView processPerson(@ModelAttribute Persona person) {
		ModelAndView modelAndView = new ModelAndView(); //EN INDEX CUANDO DICE "MIRA NUESTROS PRODUCTOS" AL LADO DE LA FRASE SE VISUALIZA EL MAIL DEL USUARIO.A FUTURO CAMBIAR POR NOMBRE.
		modelAndView.setViewName("redirect:index.jsp");
		
		modelAndView.addObject("pers", person);
		modelAndView.addObject("personaSesion", person);
		
		return modelAndView ;
	}
}
