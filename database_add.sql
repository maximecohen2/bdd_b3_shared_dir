INSERT ALL
    INTO CODEPOSTAUX(cp_id, cp_code, cp_ville) VALUES (0, '33000', 'Bordeaux')
    INTO CODEPOSTAUX(cp_id, cp_code, cp_ville) VALUES (1, '78540', 'Saint-Germain-en-Laye')
    INTO CODEPOSTAUX(cp_id, cp_code, cp_ville) VALUES (2, '75000', 'Paris')
SELECT * FROM DUAL;

INSERT ALL
    INTO CIVILITE(civ_id, civ_libelle) VALUES (0, 'Mr')
    INTO CIVILITE(civ_id, civ_libelle) VALUES (1, 'Mme')
    INTO CIVILITE(civ_id, civ_libelle) VALUES (2, 'Mlle')
SELECT * FROM DUAL;

INSERT ALL
    INTO STATUT(stat_id, stat_libelle) VALUES (0, 'Payé')
    INTO STATUT(stat_id, stat_libelle) VALUES (1, 'Annulé')
    INTO STATUT(stat_id, stat_libelle) VALUES (2, 'Validé')
SELECT * FROM DUAL;

INSERT ALL
    INTO TVA(tva_id, tva_taux) VALUES (0, 19.6)
    INTO TVA(tva_id, tva_taux) VALUES (1, 20.0)
    INTO TVA(tva_id, tva_taux) VALUES (2, 17.3)
SELECT * FROM DUAL;

INSERT ALL
    INTO CATEGORIE(cat_id, cat_libelle, cat_id_parent) VALUES (0, 'Film', null)
    INTO CATEGORIE(cat_id, cat_libelle, cat_id_parent) VALUES (1, 'Action', 0)
    INTO CATEGORIE(cat_id, cat_libelle, cat_id_parent) VALUES (2, 'Jeux Vidéo', null)
SELECT * FROM DUAL;

INSERT ALL
    INTO CLIENT(cli_id, cli_nom, cli_prenom, cli_datenaissance, cli_civ_id)
        VALUES (0, 'Goulou', 'Mama', TO_DATE('2000/03/05', 'yyyy/mm/dd'), 2)
    INTO CLIENT(cli_id, cli_nom, cli_prenom, cli_datenaissance, cli_civ_id)
        VALUES (1, 'Lefevre', 'Marion', TO_DATE('1996/10/15', 'yyyy/mm/dd'), 1)
    INTO CLIENT(cli_id, cli_nom, cli_prenom, cli_datenaissance, cli_civ_id)
        VALUES (2, 'Cohen', 'Maxime', TO_DATE('1994/01/30', 'yyyy/mm/dd'), 0)
SELECT * FROM DUAL;

INSERT ALL
    INTO ADRESSE(ad_id, ad_ligne1, ad_ligne2, ad_cli_id, ad_cp_id)
        VALUES (0, '6 rue de la toutre', '', 2, 1)
    INTO ADRESSE(ad_id, ad_ligne1, ad_ligne2, ad_cli_id, ad_cp_id)
        VALUES (1, '1 rue des vieux puits', '', 0, 2)
    INTO ADRESSE(ad_id, ad_ligne1, ad_ligne2, ad_cli_id, ad_cp_id)
        VALUES (2, '5 rue jules Massenet', 'résidence Bel Air', 1, 0)
SELECT * FROM DUAL;

INSERT ALL
    INTO DEVIS(dev_id, dev_date, dev_dureevalidite, dev_cli_id)
        VALUES (0, TO_DATE('2016/12/27', 'yyyy/mm/dd'), 700, 2)
    INTO DEVIS(dev_id, dev_date, dev_dureevalidite, dev_cli_id)
        VALUES (1, TO_DATE('2017/03/14', 'yyyy/mm/dd'), 50, 0)
    INTO DEVIS(dev_id, dev_date, dev_dureevalidite, dev_cli_id)
        VALUES (2, TO_DATE('2017/11/20', 'yyyy/mm/dd'), 400, 1)
SELECT * FROM DUAL;

INSERT ALL
    INTO FACTURE(fa_id, fa_date, fa_dev_id, fa_cli_id, fa_stat_id)
        VALUES (0, TO_DATE('2017/06/04', 'yyyy/mm/dd'), null, 0, 2)
    INTO FACTURE(fa_id, fa_date, fa_dev_id, fa_cli_id, fa_stat_id)
        VALUES (1, TO_DATE('2017/02/11', 'yyyy/mm/dd'), 1, 2, 1)
    INTO FACTURE(fa_id, fa_date, fa_dev_id, fa_cli_id, fa_stat_id)
        VALUES (2, TO_DATE('2017/01/30', 'yyyy/mm/dd'), 2, 0, 0)
SELECT * FROM DUAL;

INSERT ALL
    INTO PRODUIT(pdt_id, pdt_reference, pdt_designation, pdt_puht, pdt_cat_id)
        VALUES (0, '#5752GD46', 'How to train your dragon 2', 25.0, 0)
    INTO PRODUIT(pdt_id, pdt_reference, pdt_designation, pdt_puht, pdt_cat_id)
        VALUES (1, '#068GHJ65', 'Star Wars: Battlefront 2', 65.0, 2)
    INTO PRODUIT(pdt_id, pdt_reference, pdt_designation, pdt_puht, pdt_cat_id)
        VALUES (2, '#134RT08U', 'Rambo', 10.0, 1)
SELECT * FROM DUAL;

INSERT ALL
    INTO LIGNEDEVIS(ldev_id, ldev_designation, ldev_qte, ldev_totalht, ldev_dev_id, ldev_pdt_id, ldev_tva_id)
        VALUES (0, 'achat film Rambo', 1, 10.0, 0, 2, 0)
    INTO LIGNEDEVIS(ldev_id, ldev_designation, ldev_qte, ldev_totalht, ldev_dev_id, ldev_pdt_id, ldev_tva_id)
        VALUES (1, 'achat jeux Star wars', 10, 650.0, 2, 1, 1)
    INTO LIGNEDEVIS(ldev_id, ldev_designation, ldev_qte, ldev_totalht, ldev_dev_id, ldev_pdt_id, ldev_tva_id)
        VALUES (2, 'achat film htd 2', 1, 25.0, 1, 0, 2)
SELECT * FROM DUAL;

INSERT ALL
    INTO LIGNEFACTURE(lfa_id, lfa_designation, lfa_qte, lfa_totalht, lfa_fa_id, lfa_pdt_id, lfa_tva_id)
        VALUES (0, 'achat film Rambo', 1, 10.0, 0, 2, 0)
    INTO LIGNEFACTURE(lfa_id, lfa_designation, lfa_qte, lfa_totalht, lfa_fa_id, lfa_pdt_id, lfa_tva_id)
        VALUES (1, 'achat jeux Star wars', 10, 650.0, 2, 1, 1)
    INTO LIGNEFACTURE(lfa_id, lfa_designation, lfa_qte, lfa_totalht, lfa_fa_id, lfa_pdt_id, lfa_tva_id)
        VALUES (2, 'achat film htd 2', 1, 25.0, 1, 0, 2)
SELECT * FROM DUAL;