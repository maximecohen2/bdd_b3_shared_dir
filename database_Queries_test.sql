/*
[1] Ecrire un programme qui affiche:
NomClient    PrenomClient
     année
       1  mois -> CA réalisé
       |   |
       |   |
       |   |
       |   |
       12  |

NomClient2    PrenomClient2
     année
       1  mois   ->  CA réalisé

Pour tous les clients par odre alpha du nom et du prénom
Pour les années de 2014 à 2018 décroissante
Pour tous les mois

Algo :
Pour tous les clients
    afficher Nom, Prenom
    Pour annee 2014 à 2018
        afficher annee
        Pour mois de 1 a 12
            afficher mois
            affecter CA dans variable
            affiche CA
        Fin pour
    Fin pour
Fin pour

*/


DECLARE
    min_year NUMBER := 2014;
    max_year NUMBER := 2018;
    CURSOR cur_client IS
        SELECT cli_id, cli_nom, cli_prenom
            FROM CLIENT
            ORDER BY cli_nom, cli_prenom;
    CURSOR cur_fa_date IS
        SELECT  DISTINCT fa_id, fa_date, fa_cli_id
            FROM FACTURE
            WHERE EXTRACT(YEAR FROM fa_date) <= max_year
                AND EXTRACT(YEAR FROM fa_date) >= min_year
            GROUP BY fa_id, fa_date, fa_cli_id;
BEGIN
    FOR client IN cur_client LOOP
        DBMS_OUTPUT.put_line(client.cli_nom || ' ' || client.cli_prenom);
        --FOR fa_date IN cur_fa_date LOOP
        FOR dte IN REVERSE 2018..2014 LOOP
            DBMS_OUTPUT.put_line(dte);
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.put_line('');
END;