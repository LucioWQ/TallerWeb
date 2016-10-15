package ar.edu.grupoesfera.cursospring.modelo;

import java.util.Comparator;

public class CompararPersonaPorNombre implements Comparator <Persona> {
	@Override
	public int compare(Persona a, Persona b){
		
		return Integer.parseInt(a.getNombre()) - Integer.parseInt(b.getNombre());
}
}
