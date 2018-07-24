
package controlador;

import Dao.PasajeroD;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

@Named(value = "BusC")
@SessionScoped
public class BusC implements Serializable {

    BusC Bus = new BusC();
    private List<BusC> listarBus;

   

    public void limpiar() {
        Bus = new BusC();
    }

    

    public void crearBus() throws Exception {
        BusC dao;
        try {
            dao = new BusC();
            dao.crearBus();
        

            crearBus();
            limpiar();
        } catch (SQLException e) {
            throw e;
        }
            
            
        }
            }
    