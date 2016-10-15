package ar.edu.grupoesfera.cursospring.servicios;

import java.util.Iterator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import ar.edu.grupoesfera.cursospring.modelo.ListadoProducto;
import ar.edu.grupoesfera.cursospring.modelo.Producto;
import ar.edu.grupoesfera.cursospring.servicios.ProductoService;

@Service("ProductoService")
@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
public class ProductoServiceImp implements ProductoService {

	
	@Override
	public ModelMap agregarOModificarProducto(Producto producto) throws Exception{

		
		if(producto != null && producto.getDescrip() != "" && !producto.getDescrip().startsWith(" ")){
			
			if(producto.getPrecio() != null && !producto.getPrecio().isNaN()){
			ModelMap model = new ModelMap();
			ListadoProducto listado = ListadoProducto.getInstance();
			Iterator<Producto> iterator = listado.getLista().iterator();
			
			producto.setDescrip(producto.getDescrip().toLowerCase());
			producto.setDescrip(producto.getDescrip().substring(0,1).toUpperCase()+ producto.getDescrip().substring(1));
			
			while(iterator.hasNext()){
				
				if(iterator.next().equals(producto)){
					
					
					iterator.remove();
							
				}
			}
			
			try{			
				listado.ingresa(producto);
			}catch(Exception e){
				System.err.println("El producto no se pudo agregar");
			}
			
			model.put("Listado", listado.getLista());
			
			return model;
			
			} else {
				
				throw new Exception("No especificó precio($)");
			
			}
			
		} else
		
	    throw new Exception("No específico ningún producto");
	}

	@Override
	public ModelMap borrarProducto(Producto producto) throws Exception {

		
		if(producto != null && producto.getDescrip() != "" && !producto.getDescrip().startsWith(" ")){
		
			int bandera = 0;
			ModelMap model = new ModelMap();
			ListadoProducto listado = ListadoProducto.getInstance();
			Iterator<Producto> iterator = listado.getLista().iterator();
			
			while(iterator.hasNext()){
				
				if(iterator.next().equals(producto)){
					
					iterator.remove();
				
					bandera = 1;
				
				}
			}
			
			
			if(bandera == 1){			
				try{			
					producto.setEstado(false);
					listado.ingresa(producto);
				}catch(Exception e){
					System.err.println("El producto no se pudo agregar");
				}
			}
	
			model.put("Listado",listado.getLista());
			
			return model;
			
		} else
			

		    throw new Exception("No específico ningún producto");
		
	}

	
}
