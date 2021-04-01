
package ArtHub.services;
import ArtHub.entities.Partenaire;
import ArtHub.entities.User;
import ArtHub.tools.MyConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

/**
 * wadup
 * @author Fayechi
 */
public class PartenaireCRUD {
    private Connection cnx;
    private PreparedStatement ste;

    public PartenaireCRUD() {
        cnx = MyConnection.getInstance().getConnection();
    }
    
    public void ajouterPartenaire(Partenaire p){
        String req ="INSERT INTO partenaire (id_part,nom,adresse,logo,RIB,tel,id_user)"+"values (?,?,?,?,?,?,?)";
        try {
            ste = cnx.prepareStatement(req);
            ste.setInt(1, p.getId_part());
            ste.setString(2, p.getNom());
            ste.setString(3, p.getAdresse());
            ste.setString(4, p.getLogo());
            ste.setString(5, p.getRib());
            ste.setString(6, p.getTel());
            ste.setInt(7, p.getId_user().getId_user());
            ste.executeUpdate();
            System.out.println("Partenaire ajouté");
            
        } catch (SQLException ex) {
            System.out.println("Probléme");
            System.out.println(ex.getMessage());
            
        }
        
    }
    
      public List<Partenaire> consulterPartenaire() {

        List<Partenaire> myList = new ArrayList<>();
        try {

            Statement pst = cnx.createStatement();

            ResultSet rs = pst.executeQuery("SELECT * from partenaire");
            while (rs.next()) {

               
               
                String nom = rs.getString("nom");
                String adresse = rs.getString("adresse");
           
                String RIB = rs.getString("RIB");
                String tel = rs.getString("tel");
                int status = rs.getInt("status");
                
                
                Partenaire p = new Partenaire(nom, adresse,RIB,tel,status);
              
                myList.add(p);

            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return myList;

    }
      
       public ObservableList<Partenaire> consulterPartenairess() {

        ObservableList<Partenaire> myList = FXCollections.observableArrayList();
        try {

            Statement pst = cnx.createStatement();

            ResultSet rs = pst.executeQuery("SELECT * from partenaire where status=0");
            while (rs.next()) {

               
               int id = rs.getInt("id_part");
                String nom = rs.getString("nom");
                String adresse = rs.getString("adresse");
           
                String RIB = rs.getString("RIB");
                String tel = rs.getString("tel");
                int status = rs.getInt("status");
                
                
                Partenaire p = new Partenaire(id,nom, adresse,RIB,tel,status);
              
                myList.add(p);

            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return myList;

    }

    public void supprimerPartenaire(Partenaire p) {
         try {
            String requete = "DELETE FROM partenaire WHERE id_part=?";

            PreparedStatement pst = cnx.prepareStatement(requete);
            pst.setInt(1, p.getId_part());
            pst.executeUpdate();
            System.out.println("Partenairel supprimé avec succées");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
      
      
    public void modifierPartenaire(int id_part, String object, Object obj) {
        try {
            String requete = "UPDATE partenaire SET ? = ? WHERE id_part = ?";
            PreparedStatement pst = cnx.prepareStatement(requete);
            pst.setString(1, object);
            pst.setObject(2, obj);
            pst.setInt(3, id_part);
            String ch = pst.toString().replaceFirst("\'", "");
            String ch2 = ch.replaceFirst("\'", "");
            int pos = ch2.indexOf("UPDATE");
            String ch3 = ch2.substring(pos, ch2.length());
            System.out.println(ch3);
            pst = cnx.prepareStatement(ch3);
            pst.executeUpdate();
            System.out.println("Partenaire modifié avec succès");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public void affectPartenaire(int id_part, int status) {
        try {
            String requete = "UPDATE partenaire SET status = ? WHERE id_part = ?";
            PreparedStatement pst = cnx.prepareStatement(requete);
            pst.setInt(1, status);
            pst.setInt(2, id_part);
            String ch = pst.toString().replaceFirst("\'", "");
            String ch2 = ch.replaceFirst("\'", "");
            int pos = ch2.indexOf("UPDATE");
            String ch3 = ch2.substring(pos, ch2.length());
            System.out.println(ch3);
            pst = cnx.prepareStatement(ch3);
            pst.executeUpdate();
            System.out.println("Partenaire modifié avec succès");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
     public boolean checkPartenaire(int id) {

        try {

            Statement pst = cnx.createStatement();

            ResultSet rs = pst.executeQuery("SELECT * from partenaire where id_user="+id);
            while (rs.next()) {
                int status = rs.getInt("status");
                System.out.println(status);
                if(status==1)
                    return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return false;

    }
}
