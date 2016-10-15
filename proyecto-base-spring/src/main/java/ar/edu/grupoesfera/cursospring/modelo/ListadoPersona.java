package ar.edu.grupoesfera.cursospring.modelo;

import java.util.Iterator;
import java.util.TreeSet;

public class ListadoPersona {

	private static ListadoPersona instance = new ListadoPersona();
	private TreeSet<Persona> lista;
	
	private ListadoPersona (){
		
		this.lista = new TreeSet<Persona>();
		
	}
	
	private ListadoPersona(TreeSet<Persona> lista){
	
		this.lista.addAll(lista);
		
	}
	
	public static ListadoPersona getInstance(){
		
		return instance;
	}
	
	public TreeSet<Persona> getLista() {
		return lista;
	}

	public void setLista(TreeSet<Persona> lista) {
		this.lista = lista;
	}

	public void ingresa(Persona persona){
		
		this.lista.add(persona);
		
	}
	
	public void mostrarListaPersona(TreeSet<Persona> lista){
		
		Iterator<Persona> persona = lista.iterator();
		while(persona.hasNext()){
			try{			
				System.out.println((persona.next()).toString());
			}catch(NullPointerException e){
				System.err.println("Error");
			}
		}
	}
}
