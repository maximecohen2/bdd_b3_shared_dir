-- Requête 1:
SELECT cli_nom, cli_prenom, DEVIS.*
    FROM CLIENT, DEVIS
    WHERE dev_date + dev_dureevalidite >= sysdate 
        AND cli_id = dev_cli_id
    ORDER BY dev_date DESC;

-- Requête 2:
SELECT cli_nom, cli_prenom, COUNT(fa_dev_id) AS "nombre devis (2017)"
    FROM CLIENT, FACTURE
    WHERE cli_id = fa_cli_id
        AND fa_dev_id IS NOT NULL
        AND EXTRACT(YEAR FROM fa_date) = 2017
    GROUP BY cli_nom, cli_prenom, cli_id;

-- Requête 3:
SELECT cli_nom, cli_prenom, SUM(lfa_totalht) AS "CA realise (2017)"
    FROM CLIENT, FACTURE, LIGNEFACTURE
    WHERE cli_id = fa_cli_id
        AND fa_id = lfa_fa_id
        AND EXTRACT(YEAR FROM fa_date) = 2017
    GROUP BY cli_nom, cli_prenom, cli_id;
    
-- Requête 4:
SELECT cli_nom, cli_prenom, SUM(ldev_totalht) AS "CA previsionnel (2017)"
    FROM CLIENT, DEVIS, LIGNEDEVIS
    WHERE cli_id = dev_cli_id
        AND dev_id = ldev_dev_id
        AND EXTRACT(YEAR FROM dev_date) = 2017
    GROUP BY cli_nom, cli_prenom, cli_id;
    
-- Requête 5:
SELECT pdt_designation, SUM(lfa_totalht) AS "CA realise (2017)"
    FROM PRODUIT, FACTURE, LIGNEFACTURE
    WHERE pdt_id = lfa_pdt_id
        AND fa_id = lfa_fa_id
        AND fa_date >= date '2017-03-31'
    GROUP BY pdt_designation, pdt_id;

-- Requête 6:
