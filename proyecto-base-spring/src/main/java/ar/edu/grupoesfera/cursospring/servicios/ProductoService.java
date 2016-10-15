package ar.edu.grupoesfera.cursospring.servicios;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import ar.edu.grupoesfera.cursospring.modelo.Producto;

public interface ProductoService {

	public ModelMap agregarOModificarProducto(@ModelAttribute("Producto") Producto producto) throws Exception;
		
	public ModelMap borrarProducto(@ModelAttribute("Producto") Producto producto) throws Exception;
}
