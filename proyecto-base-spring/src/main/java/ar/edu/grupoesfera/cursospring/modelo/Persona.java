package ar.edu.grupoesfera.cursospring.modelo;

public class Persona implements Comparable<Persona> {

 private String nombre;
 private String apellido;
 private String email;
 private String password;
 private Boolean estado = true;


public Persona (){

}

public Persona (String nombre, String apellido, String email, String password) {
	 
	 this.nombre = nombre;
	 this.apellido = apellido;
	 this.email = email;
	 this.password = password;
	 
 }


public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getApellido() {
	return apellido;
}

public void setApellido(String apellido) {
	this.apellido = apellido;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public Boolean getEstado() {
	return estado;
}

public void setEstado(Boolean estado) {
	this.estado = estado;
}

public String toString(){
	return (this.getNombre()+ " | " + this.getApellido() + " | " + this.getEmail() +  " | " + this.getPassword());
}

public boolean equals(Object obj){
	
	if(obj instanceof Persona){
		
		Persona diferente = (Persona) obj;
		
		if(this.getEmail().equalsIgnoreCase(diferente.getEmail())){
			
			return true;
		
		} else {
			
			return false;
			
		}
		
	} else {
		
		return false;
		
	}
	
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((apellido == null) ? 0 : apellido.hashCode());
	return result;
}

@Override
public int compareTo(Persona obj) {
	return this.getEmail().compareTo(obj.getEmail());
}

}