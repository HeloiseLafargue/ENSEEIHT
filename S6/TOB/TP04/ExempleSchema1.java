import java.awt.Color;

import afficheur.Ecran;
import afficheur.AfficheurSVG;


/** Construire le schéma proposé dans le sujet de TP avec des points,
  * et des segments.
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.7 $
  */
public class ExempleSchema1 {

	/** Construire le schéma et le manipuler.
	  * Le schéma est affiché.
	  * @param args les arguments de la ligne de commande
	  */
	public static void main(String[] args)
	{
		// Créer les trois segments
		Point p1 = new Point(3, 2);
		Point p2 = new Point(6, 9);
		Point p3 = new Point(11, 4);
		Segment s12 = new Segment(p1, p2);
		Segment s23 = new Segment(p2, p3);
		Segment s31 = new Segment(p3, p1);

		// Créer le barycentre
		double sx = p1.getX() + p2.getX() + p3.getX();
		double sy = p1.getY() + p2.getY() + p3.getY();
		Point barycentre = new Point(sx / 3, sy / 3);
		
		// Construire un écran
		Ecran ecran = new Ecran("Ecran", 600, 400, 20);

		// Translater
		s12.translater(4, -3);
		s23.translater(4, -3);
		s31.translater(4, -3);
		barycentre.translater(4, -3);
		
		// Afficher le schéma
		System.out.println("Le schéma est composé de : ");
		s12.afficher();		System.out.println();
		s23.afficher();		System.out.println();
		s31.afficher();		System.out.println();
		barycentre.afficher();	System.out.println();
	
		// Dessiner le schéma
		p1.dessiner(ecran);
		p2.dessiner(ecran);
		p3.dessiner(ecran);
		barycentre.dessiner(ecran);
		s12.dessiner(ecran);
		s23.dessiner(ecran);
		s31.dessiner(ecran);
		
		// Affichage SVG
		AfficheurSVG afficheurSVG = new AfficheurSVG();
		
		// Afficher la description SVG sur la sortie standard
		afficheurSVG.ecrire();
		
		// Afficher la description SVG dans un fichier
		afficheurSVG.ecrire("schema.svg");
	}

}
