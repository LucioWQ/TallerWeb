package ar.edu.grupoesfera.cursospring.servicios;

import org.springframework.ui.ModelMap;

import ar.edu.grupoesfera.cursospring.modelo.Persona;

public interface PersonaService {
	
	public ModelMap ingresa(Persona persona);
	public ModelMap borrarPersona(Persona persona);
}
