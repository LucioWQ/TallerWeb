package ar.edu.grupoesfera.cursospring.modelo;

import java.util.Comparator;

public class CompararPersonaPorEmail implements Comparator <Persona> {

	@Override
	public int compare(Persona a, Persona b){
		
		return Integer.parseInt(a.getEmail()) - Integer.parseInt(b.getEmail());
	}
}
