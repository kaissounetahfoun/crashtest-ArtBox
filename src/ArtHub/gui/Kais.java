/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ArtHub.gui;


//import com.azure.ai.textanalytics.TextAnalyticsClient;
//import com.kieferlam.javafxblur.Blur;
import static java.awt.Color.blue;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.stage.Modality;
import javafx.stage.Screen;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import java.awt.Dimension;


/**
 *
 */
public class Kais extends Application {

    @Override
    public void start(Stage primaryStage) {
        
       /*SentimentAnalysis sa = new SentimentAnalysis();
        sa.getSent("Kais is dummy thick");
        */

        try {   
//            Blur.loadBlurLibrary();
            // Color c = Color.rgb(10,30,255,1.200);
            Screen screen = Screen.getPrimary();
            Rectangle2D bounds = screen.getVisualBounds();
            // Parent root = FXMLLoader.load(getClass().getResource("ADD-Event.fxml"));
            Parent root = FXMLLoader.load(getClass().getResource("Login.fxml"));
            //Parent root = FXMLLoader.load(getClass().getResource("Affichepostes.fxml"));
            //Parent root = FXMLLoader.load(getClass().getResource("CRUDEvent.fxml"));
            //Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
            Scene scene = new Scene(root );//root, 1920, 1080);
            scene.setFill(Color.LIGHTGRAY);
//            primaryStage.setX(bounds.getMinX());
//            primaryStage.setY(bounds.getMinY());
//            primaryStage.setWidth(bounds.getWidth());
//            primaryStage.setHeight(bounds.getHeight());
            //primaryStage.initModality(Modality.APPLICATION_MODAL);
            //primaryStage.setFullScreen(true);
            primaryStage.initStyle(StageStyle.UNDECORATED);
            primaryStage.setTitle("ArtBox");
            primaryStage.setScene(scene);
            primaryStage.setResizable(true);
            
            primaryStage.show();

        } catch (IOException ex) {
            Logger.getLogger(Kais.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }

}
