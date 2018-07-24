
package controlador;


import Dao.TrabajadoresD;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import Modelo.PasajerosM;
import static Modelo.PasajerosM_.id;
import Modelo.TrabajadoresM;

@Named(value = "TrabajadoresC")
@SessionScoped
public class TrabajadoresC implements Serializable {

    TrabajadoresM trabajadores = new TrabajadoresM();
    private List<PasajerosM> listaTrabajadores;

   

    public void limpiar() {
        trabajadores = new TrabajadoresM();
    }

  
  

    public void crearTrabajador() throws Exception {
        TrabajadoresD dao;
        dao = new TrabajadoresD();
        dao.crearTrabajador(trabajadores);
        listaTrabajadores();
        limpiar();
    }


    @Override
    public String toString() {
        return "Controlador.PasajerosC[ id=" + id + " ]";
    }

    private void listaPasajeros() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void listaTrabajadores() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}