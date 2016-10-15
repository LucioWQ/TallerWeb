package ar.edu.grupoesfera.cursospring.controladores;

import javax.inject.Inject;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import ar.edu.grupoesfera.cursospring.modelo.Persona;
import ar.edu.grupoesfera.cursospring.servicios.PersonaService;
@SessionAttributes("listadoPer")
@RestController
public class ControladorPersona {
	@Inject
	private PersonaService personaService;
	
	@RequestMapping(value="/vistaPersona")
	public ModelAndView vistaProducto(ModelMap model){
		Persona persona = new Persona();
		model.put("Persona", persona);
		return new ModelAndView("vistaPersona",model);
	}
	
	@RequestMapping(value="/agregarPersona", method= RequestMethod.POST)
	public ModelAndView ingresarService(@ModelAttribute("Persona") Persona persona){
		return new ModelAndView("vistaPersona", personaService.ingresa(persona));
	}
	
	@RequestMapping(value="/borrarPersona", method= RequestMethod.GET)
	public ModelAndView borrarPersonaService(@ModelAttribute("Persona") Persona persona){
		return new ModelAndView("vistaPersona", personaService.borrarPersona(persona));
	}
}