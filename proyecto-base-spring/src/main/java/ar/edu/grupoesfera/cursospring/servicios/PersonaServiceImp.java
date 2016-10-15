package ar.edu.grupoesfera.cursospring.servicios;

import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import ar.edu.grupoesfera.cursospring.modelo.ListadoPersona;
import ar.edu.grupoesfera.cursospring.modelo.Persona;

@Service("PersonaService")
@Transactional (readOnly = true , propagation = Propagation.SUPPORTS)
public class PersonaServiceImp implements PersonaService {

	@Override
	public ModelMap ingresa(Persona persona) {
		ModelMap model = new ModelMap();
		ListadoPersona listado = ListadoPersona.getInstance();
		Iterator<Persona> iterator = listado.getLista().iterator();
		
		while(iterator.hasNext()){
			if(iterator.next().equals(persona)){
				iterator.remove();		
			}
		}
		
		listado.getLista().add(persona);
		
		model.put("Listado", listado.getLista());

		return model;		
	}

	@Override
	public ModelMap borrarPersona(Persona persona) {
		
		int bandera = 0;
		
		ListadoPersona listado = ListadoPersona.getInstance();
		ModelMap model = new ModelMap();
		Iterator<Persona> iterator = listado.getLista().iterator();
		
		while(iterator.hasNext()){
			if(iterator.next().equals(persona)){
				iterator.remove();
			
				bandera = 1;
			
			}
		}
		
		if(bandera == 1){			
			persona.setEstado(false);
			listado.getLista().add(persona);
		}

		model.put("Listado",listado.getLista());

		return model;
	}
}