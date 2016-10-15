package ar.edu.grupoesfera.cursospring.modelo;

import java.util.Iterator;
import java.util.TreeSet;

public class ListadoProducto{

	private static ListadoProducto instance = new ListadoProducto();
	private TreeSet<Producto> lista;
	
	private ListadoProducto (){
		
		this.lista = new TreeSet<Producto>();
		
	}
	
	private ListadoProducto(TreeSet<Producto> lista){
	
		this.lista.addAll(lista);
		
	}
	
	public static ListadoProducto getInstance(){
		
		return instance;
	}
	
	public TreeSet<Producto> getLista() {
		return lista;
	}

	public void setLista(TreeSet<Producto> lista) {
		this.lista = lista;
	}

	public void ingresa(Producto producto){
		
		this.lista.add(producto);
		
	}
	
	public void mostrarLista(TreeSet<Producto> lista){
		
		Iterator<Producto> producto = lista.iterator();
		while(producto.hasNext()){
			try{			
				System.out.println((producto.next()).toString());
			}catch(NullPointerException e){
				System.err.println("El producto no existe y/o presenta un error");
			}
		}
	}

}
