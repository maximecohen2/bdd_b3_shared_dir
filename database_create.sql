CREATE TABLE CIVILITE
(
    civ_id NUMBER NOT NULL,
    civ_libelle VARCHAR(100) NOT NULL,
    CONSTRAINT PK_civ_id PRIMARY KEY (civ_id)
);

CREATE TABLE CODEPOSTAUX
(
    cp_id NUMBER NOT NULL,
    cp_code CHAR(5) NOT NULL,
    cp_ville VARCHAR(100) NOT NULL,
    CONSTRAINT PK_cp_id PRIMARY KEY (cp_id)
);

CREATE TABLE STATUT
(
    stat_id NUMBER NOT NULL,
    stat_libelle VARCHAR(100) NOT NULL,
    CONSTRAINT PK_stat_id PRIMARY KEY (stat_id)
);

CREATE TABLE TVA
(
    tva_id NUMBER NOT NULL,
    tva_taux DEC(5, 2) NOT NULL,
    CONSTRAINT PK_tva_id PRIMARY KEY (tva_id)
);

CREATE TABLE CATEGORIE
(
    cat_id NUMBER NOT NULL,
    cat_libelle VARCHAR(100) NOT NULL,
    cat_id_parent NUMBER NULL,
    CONSTRAINT PK_cat_id PRIMARY KEY (cat_id),
    CONSTRAINT FK_cat_id_parent FOREIGN KEY (cat_id_parent) REFERENCES CATEGORIE(cat_id)
);

CREATE TABLE CLIENT
(
    cli_id NUMBER NOT NULL,
    cli_nom VARCHAR(50) NOT NULL,
    cli_prenom VARCHAR(50) NOT NULL,
    cli_datenaissance DATE NOT NULL,
    cli_civ_id NUMBER NOT NULL,
    CONSTRAINT PK_cli_id PRIMARY KEY (cli_id),
    CONSTRAINT FK_cli_civ_id FOREIGN KEY (cli_civ_id) REFERENCES CIVILITE(civ_id)
);

CREATE TABLE ADRESSE
(
    ad_id NUMBER NOT NULL,
    ad_ligne1 VARCHAR(100) NOT NULL,
    ad_ligne2 VARCHAR(100) NULL,
    ad_cli_id NUMBER NOT NULL,
    ad_cp_id NUMBER NOT NULL,
    CONSTRAINT PK_ad_id PRIMARY KEY (ad_id),
    CONSTRAINT FK_ad_cli_id FOREIGN KEY (ad_cli_id) REFERENCES CLIENT(cli_id),
    CONSTRAINT FK_ad_cp_id FOREIGN KEY (ad_cp_id) REFERENCES CODEPOSTAUX(cp_id)
);

CREATE TABLE DEVIS
(
    dev_id NUMBER NOT NULL,
    dev_date DATE NOT NULL,
    dev_dureevalidite NUMBER NOT NULL,
    dev_cli_id NUMBER NOT NULL,
    CONSTRAINT PK_dev_id PRIMARY KEY (dev_id),
    CONSTRAINT FK_dev_cli_id FOREIGN KEY (dev_cli_id) REFERENCES CLIENT(cli_id)
);

CREATE TABLE FACTURE
(
    fa_id NUMBER NOT NULL,
    fa_date DATE NOT NULL,
    fa_dev_id NUMBER,
    fa_cli_id NUMBER NOT NULL,
    fa_stat_id NUMBER NOT NULL,
    CONSTRAINT PK_fa_id PRIMARY KEY (fa_id),
    CONSTRAINT FK_fa_dev_id FOREIGN KEY (fa_dev_id) REFERENCES DEVIS(dev_id),
    CONSTRAINT FK_fa_cli_id FOREIGN KEY (fa_cli_id) REFERENCES CLIENT(cli_id),
    CONSTRAINT FK_fa_stat_id FOREIGN KEY (fa_stat_id) REFERENCES STATUT(stat_id)
);

CREATE TABLE PRODUIT
(
    pdt_id NUMBER NOT NULL,
    pdt_reference VARCHAR(100) NOT NULL,
    pdt_designation VARCHAR(100) NOT NULL,
    pdt_puht DEC(14,2) NOT NULL,
    pdt_cat_id NUMBER NOT NULL,
    CONSTRAINT PK_pdt_id PRIMARY KEY (pdt_id),
    CONSTRAINT FK_pdt_cat_id FOREIGN KEY (pdt_cat_id) REFERENCES CATEGORIE(cat_id)
);

CREATE TABLE LIGNEDEVIS
(
    ldev_id NUMBER NOT NULL,
    ldev_designation VARCHAR(100) NOT NULL,
    ldev_qte DEC(6,1) NOT NULL,
    ldev_totalht DEC(14,2) NOT NULL,
    ldev_dev_id NUMBER NOT NULL,
    ldev_pdt_id NUMBER NOT NULL,
    ldev_tva_id NUMBER NOT NULL,
    CONSTRAINT PK_ldev_id PRIMARY KEY (ldev_id),
    CONSTRAINT FK_ldev_dev_id FOREIGN KEY (ldev_dev_id) REFERENCES DEVIS(dev_id),
    CONSTRAINT FK_ldev_pdt_id FOREIGN KEY (ldev_pdt_id) REFERENCES PRODUIT(pdt_id),
    CONSTRAINT FK_ldev_tva_id FOREIGN KEY (ldev_tva_id) REFERENCES TVA(tva_id)
);

CREATE TABLE LIGNEFACTURE
(
    lfa_id NUMBER NOT NULL,
    lfa_designation VARCHAR(100) NOT NULL,
    lfa_qte DEC(6,1) NOT NULL,
    lfa_totalht DEC(14,2) NOT NULL,
    lfa_fa_id NUMBER NOT NULL,
    lfa_pdt_id NUMBER NOT NULL,
    lfa_tva_id NUMBER NOT NULL,
    CONSTRAINT PK_lfa_id PRIMARY KEY (lfa_id),
    CONSTRAINT FK_lfa_fa_id FOREIGN KEY (lfa_fa_id) REFERENCES FACTURE(fa_id),
    CONSTRAINT FK_lfa_pdt_id FOREIGN KEY (lfa_pdt_id) REFERENCES PRODUIT(pdt_id),
    CONSTRAINT FK_lfa_tva_id FOREIGN KEY (lfa_tva_id) REFERENCES TVA(tva_id)
);