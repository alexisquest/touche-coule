Nous avons créer un ship factory qui permet de selectionner, parmis les types de bateau proposé, le type de bateau que l'on souhaite déployer (register).
Une fois que le type de bateau a été choisis, on peut appuyer sur le boutton register. 
Le smart contrat ShipFactory va alors déployer un smart contrat qui hérite de Ship. (cette opération demande du gas)
Une fois le contrat déployer, un event (deployShip) est emis par le smart contrat ShipFactory. Cet event transmet l'adresse du contrat qui vient d'être déployer.
La fonction register du contrat Main est alors appelé avec comme arguement l'adresse emit par l'event deployShip.
Un nouveau bateau est alors register et apparaît donc sur la grille.
Les bateaux appartenant au compte connecté sont en vert, les autres sont en rouge.

On a rajouté également des déplacements pour les bateaux. (à compléter)

On a pu coder deux type de bateau :
-Les déterministes :
    - Ils se placent de façon aléatoire
    - Ils tirent sur les cases dans l'ordre. (0,0) puis (0,1) puis (0,2) ... puis (1,0) puis (1,1) ...
    - Ils se déplacent de façon aléatoire

-Les aléatoires :
    - Ils se placent de façon aléatoire
    - Ils tirent de façon aléatoire
    - Ils se déplacent de façon aléatoire
