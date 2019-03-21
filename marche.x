/* Les articles */
struct article {char nom[10]; char description[10]; float prix;};
/* Structure caddie qui contient une liste d'articles */
struct caddie {article mesArticles[3];};
/* Structure compte Type 1 = Client ; 2 = Fournisseur ; 3 = Point relais */
struct compte {int id; char nom[10]; char prenom[10]; char email[10]; char password[10];
caddie monCaddie; int type; char adresse[10];};
/* Structure fournisseur qui contient un fournisseur et ses articles */
struct fournisseur {compte comptefournisseur; caddie mesArticles;};
/* Utilisé pour la connexion */
struct compteConnexion {char email[25]; char password[25];};
/* Utilisé pour l'ajout ou la suppresion d'article dans les caddies */
struct gestionArticle {article unArticle; caddie moncaddie;};
/* Moyen de payement, ici par carte */
struct payement {int numerocarte; char nom[10]; char dateexp[10]; int numerosecu;};
/* Les commandes associées au compte client, pas besoin de plus pour le scénario
*/
struct commande {caddie caddieCommande; compte compteClient;
payement monPayement;};
/* La livraison, destination = point relais ou mon compte ; */
struct livraison {commande maCommande; compte destination; char date[10];
char horaire[10]; int note; };
/* Liste de commande pour avoir un historique */
struct commandes {livraison mesLivraison[3];};
/* Sert pour ajouter ou supprimer une commande d'une liste de commandes */
struct gestionCommande {livraison livraison; livraison listelivraison[3];};
/* Utilisé pour l'inscription */
struct gestionCompte {compte uncompte; compte mescomptes[10];};
/* Les fonctions */
program MARCHE_PROG{
	version MARCHE_VERSION_1{
  /* Inscrit un utilisateur */
	void INSCRIPTION(compte) = 1;
  /* Connecte un utilisateur, retourne le compte correspondant */
	compte CONNEXION(compteConnexion) = 2;
  /* Ajoute un article */
	caddie AJOUTCADDIE(gestionArticle) = 3;
  /* Supprime un article */
	caddie SUPPRIMECADDIE(gestionArticle) = 4;
  /* Vérifie le moyen de payement retourne 0 si ok et 1 si erreur */
  int PAYEMENT(payement) = 5;
  /* Ajoute la commandes dans une liste de commandes */
	commandes COMMANDEPAYER(gestionCommande) = 6;
	} = 1;
} = 32134;
