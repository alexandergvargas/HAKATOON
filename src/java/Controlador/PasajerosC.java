package controlador;

import Dao.PasajeroD;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import Modelo.PasajerosM;
import static Modelo.PasajerosM_.id;

@Named(value = "PasajerosC")
@SessionScoped
public class PasajerosC implements Serializable {

    PasajerosM pasajeros = new PasajerosM();
    private List<PasajerosM> listaPasajeros;

   

    public void limpiar() {
        pasajeros = new PasajerosM();
    }

    public void valident() {
        if ("DNI".equals(pasajeros.gettipodocPasa())) {
            String numeriden = "8";
        } else if (!"CEX".equals(pasajeros.gettipodocPasa())) {
        } else {
            String numeriden = "12";
        }
    }

  

    public void crearPasajero() throws Exception {
        PasajeroD dao;
        try {
            dao = new PasajeroD();
            dao.crearPasajero(pasajeros);
        

            crearPasajero();
            listaPasajeros();
            limpiar();
        } catch (SQLException e) {
            throw e;
        }
    }

 

  

    @Override
    public String toString() {
        return "Controlador.PasajerosC[ id=" + id + " ]";
    }

    private void listaPasajeros() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
