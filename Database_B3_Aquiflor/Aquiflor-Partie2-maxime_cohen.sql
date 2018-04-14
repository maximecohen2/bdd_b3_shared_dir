-- ********************************************************************* --
-- Partie 2 : SQL, SQL Avancé, PL/SQL, Procédures, Fonctions et Triggers --
-- ********************************************************************* --

-- 1. Question 1 --
CREATE OR REPLACE FUNCTION is_flr_in_comp(id_flr IN NUMBER, id_comp IN NUMBER)
RETURN BOOLEAN
IS
    flr_count NUMBER;
    count_result BOOLEAN;
CURSOR c1
IS
    SELECT COUNT(cont_idfleur)
    FROM CONTENIR
    INNER JOIN COMPOSITIONS
        ON cont_idcomposition = comp_id
    WHERE cont_idfleur = id_flr
        AND comp_id = id_comp;
BEGIN
    open c1;
    fetch c1 into flr_count;
    close c1;
    
    IF flr_count > 0 THEN
        count_result := TRUE;
    ELSE
        count_result := FALSE;
    END IF;
    RETURN count_result;
END;

SELECT is_flr_in_comp(1, 2) FROM DUAL;