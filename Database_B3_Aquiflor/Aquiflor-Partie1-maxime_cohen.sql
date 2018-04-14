-- ********************************************* --
-- Partie 1 : SQL, Requêtes simples et complexes --
-- ********************************************* --

-- 1. --

-- 2. --
SELECT
    flr_codearticle AS "Code Article",
    flr_nom AS "Nom",
    flr_description AS "Description"
FROM FLEURS
ORDER BY flr_codearticle ASC;

-- 3. --
SELECT 
    flr_codearticle AS "Code Article",
    flr_prixventeTTC AS "prix de vente TTC"
FROM FLEURS
WHERE flr_nom LIKE '%Jaune%'
    OR flr_nom LIKE '%Orange%'
ORDER BY flr_prixventeTTC;

-- 4. --
SELECT
    AVG(flr_prixventeTTC) AS "Prix de vente moyen"
FROM FLEURS
WHERE flr_nom LIKE '%Equateur%';

-- 5. --
SELECT
    comp_codearticle AS "Code Article",
    SUM(cont_quantite) AS "nombre de roses"
FROM COMPOSITIONS
INNER JOIN CONTENIR
    ON comp_id = cont_idcomposition
GROUP BY comp_codearticle;
    
-- 6. --
SELECT
    comp_id,
    comp_libelle AS "Libelle"
FROM COMPOSITIONS
INNER JOIN CONTENIR
    ON comp_id = cont_idcomposition
INNER JOIN FLEURS
    ON flr_id = cont_idfleur
WHERE flr_nom NOT LIKE '%Rose%Rose%'
    AND flr_nom NOT LIKE '%Rouge%'
GROUP BY comp_libelle, comp_id;

-- 7. --
UPDATE COMPOSITIONS
SET comp_prixventeTTC = (
    SELECT 
        SUM(flr_prixventeTTC * cont_quantite * 90 / 100)
    FROM FLEURS
    INNER JOIN CONTENIR
        ON flr_id = cont_idfleur
    WHERE cont_idcomposition = comp_id
    GROUP BY cont_idcomposition);

