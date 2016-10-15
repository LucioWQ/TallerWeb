package ar.edu.grupoesfera.cursospring.controladores;

import javax.inject.Inject;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import ar.edu.grupoesfera.cursospring.modelo.Producto;
import ar.edu.grupoesfera.cursospring.servicios.ProductoService;

@RestController
public class ControladorProducto {
	
	@Inject
	private ProductoService productoservice;

	@RequestMapping("/Index")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	@RequestMapping(value="/vistaProducto")
	public ModelAndView vistaProducto(ModelMap model){
		Producto producto = new Producto();
		model.put("Producto", producto);
		return new ModelAndView("vistaProducto",model);
	}
	
	@RequestMapping(value="/agregarProducto", method= RequestMethod.POST)
	public ModelAndView redAgregarOModificarProducto(@ModelAttribute("Producto") Producto producto) throws Exception{
		
		return new ModelAndView("vistaProducto", productoservice.agregarOModificarProducto(producto));
	}
	
	@RequestMapping(value="/borrarProducto", method= RequestMethod.GET)
	public ModelAndView redBorrarProducto(@ModelAttribute("Producto") Producto producto ) throws Exception{
	
		return new ModelAndView("vistaProducto", productoservice.borrarProducto(producto));
	}
}