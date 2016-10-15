package ar.edu.grupoesfera.cursospring.modelo;

import java.util.Comparator;

public class OrdenarProductoPorCod implements Comparator <Producto> {

	@Override
	public int compare(Producto a, Producto b){
		
		return a.getCod().compareTo(b.getCod());
		
	}
}