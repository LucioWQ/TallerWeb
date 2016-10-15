package ar.edu.grupoesfera.cursospring.modelo;

import java.util.Comparator;

public class CompararProductoPorDescrip implements Comparator <Producto> {

	@Override
	public int compare(Producto a, Producto b){
		
		return Integer.parseInt(a.getDescrip()) - Integer.parseInt(b.getDescrip());
	}
}
