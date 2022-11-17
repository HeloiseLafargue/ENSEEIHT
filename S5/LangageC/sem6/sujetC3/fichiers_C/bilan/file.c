/**
 *  \author Xavier Cr�gut <nom@n7.fr>
 *  \file file.c
 *
 *  Objectif :
 *	Implantation des op�rations de la file
*/

#include <malloc.h>
#include <assert.h>

#include "file.h"


void initialiser(File *f)
{
    f->queue = NULL;
    f->tete = NULL;
    assert(est_vide(*f));
}


void detruire(File *f)
{
    Cellule* ancienneTete = NULL; 
    while(f->tete != NULL){
        ancienneTete = f->tete;
        f->tete = f->tete->suivante;
        free(ancienneTete);
    }
    f->tete = f->queue = NULL;
}


char tete(File f)
{
    assert(! est_vide(f));
    return f.tete->valeur;
}


bool est_vide(File f)
{
    if(f.tete == NULL) return true;
    return false;
}

/**
 * Obtenir une nouvelle cellule allou�e dynamiquement
 * initialis�e avec la valeur et la cellule suivante pr�cis� en param�tre.
 */
static Cellule * cellule(char valeur, Cellule *suivante)
{
    Cellule * cellule = malloc(sizeof(Cellule));
    cellule->valeur = valeur;
    cellule->suivante = suivante;
    return cellule;
}


void inserer(File *f, char v)
{
    assert(f != NULL);
    if(f->tete == NULL){
        f->tete = cellule(v, NULL);
        f->queue = f->tete;
    }
    else{
        f->queue->suivante = cellule(v, NULL);
        f->queue = f->queue->suivante;
    }
}

void extraire(File *f, char *v)
{
    assert(f != NULL);
    assert(! est_vide(*f));

    *v = f->tete->valeur;
    Cellule* ancienneTete = f->tete;
    f->tete = f->tete->suivante;
    free(ancienneTete);
    ancienneTete = NULL;
}


int longueur(File f)
{
    int taille = 0;  
    while (f.tete != NULL){
        ++taille;
        f.tete = f.tete->suivante;
    }
    return taille;
}
