import java.rmi.RemoteException;

public class RFicheImpl implements RFiche{

    private String nom;
    private String email;

    public RFicheImpl(String nom, String email) throws RemoteException {
        this.nom = nom;
        this.email = email;
    }

    @Override
    public String getNom() throws RemoteException {
        return this.nom;
    }

    @Override
    public String getEmail() throws RemoteException {
        return this.email;
    }
    
}
