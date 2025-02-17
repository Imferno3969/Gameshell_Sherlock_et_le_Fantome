#!/bin/bash

############################################################################################################################
#                                                                                                                          #
#                                                                                                                          #
#                                                                                                                          #
#                                                                                                                          #
#                                                                                                                          #
#                                                                                                                          #
#                             ATTENTION SI VOUS ETES EN BTS VOUS N'AVEZ PAS LE DROIT D ÊTRE ICI                            #
#                                                                                                                          #
#                                                                                                                          #
#                                                                                                                          #
#                                                                                                                          #
#                                                                                                                          #
#                                                                                                                          #
############################################################################################################################


# Couleurs pour le texte
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"

# Remise couleur naturelle
RESET="\033[0m"

# Fonction "Press Enter to continue"
press_enter() {
    echo -e "${CYAN}Appuyez sur Entrée pour continuer...${RESET}"
    read -r  # Attente que l'utilisateur appuie sur Entrée
}

# Fonction pour afficher l'aide
afficher_aide() {
    echo -e "${CYAN}############################# AIDE : Commandes disponibles #############################${RESET}"
    echo -e "${YELLOW}ls${RESET}   : Liste le contenu d'un répertoire en étant dedans."
    echo -e "        ${CYAN}Exemple :${RESET} ls -l"
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}-l${RESET} : Affiche les détails des fichiers (permissions, taille, propriétaire, etc.)."
    echo -e "          - ${YELLOW}-a${RESET} : Affiche également les fichiers cachés (ceux commençant par un point)."
    echo
    echo -e "${YELLOW}cd${RESET}   : Change de répertoire."
    echo -e "        ${CYAN}Exemple :${RESET} cd CHEMIN"
    echo -e "        ${GREEN}Astuce :${RESET} Tapez ${YELLOW}cd ..${RESET} pour revenir au répertoire parent."
    echo
    echo -e "${YELLOW}tr${RESET}   : Traduit ou supprime des caractères dans un texte."
    echo -e "        ${CYAN}Exemple :${RESET} echo 'ABC' | tr 'A-Z' 'a-z'"
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}-d${RESET} : Supprime les caractères spécifiés."
    echo -e "          - ${YELLOW}-s${RESET} : Remplace les séquences répétées de caractères par un seul caractère."
    echo
    echo -e "       Elle peut aussi permettre de décaler des lettres."
    echo -e "        ${CYAN}Exemple :${RESET} echo 'ABC' | tr 'f-za-fF-ZA-F' 'a-z'"
    echo -e "        Dans cet exemple, nous disons que l'alphabet commence par la lettre f et donc de traduire "
    echo -e "        le texte ABC avec cette alphabet, et les Majuscule permettent de décaler aussi l'alphabet majuscule"
    echo -e "        a-z a la fin permet de définir l'alphabet de la phrase ABC."
    echo
    echo -e "${YELLOW}find${RESET} : Recherche des fichiers ou répertoires dans une hiérarchie."
    echo -e "        ${CYAN}Exemple :${RESET} find / -name '*.txt'"
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}-name${RESET} : Recherche par nom de fichier (joker accepté : *, ?)."
    echo -e "          - ${YELLOW}-type${RESET} : Filtre par type (f pour fichier, d pour répertoire)."
    echo -e "          - ${YELLOW}-size${RESET} : Recherche par taille (par ex., +10M pour plus de 10 Mo)."
    echo
    echo -e "${YELLOW}tree${RESET} : Afficher la l'arborescence du dossier ou on est."
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}tree CHEMIN${RESET} : Affiche l'arborescence du dossier sélectionner."
    echo
    echo -e "${YELLOW}cat${RESET}  : Affiche le contenu d'un fichier."
    echo -e "        ${CYAN}Exemple :${RESET} cat indice.txt"
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}-n${RESET} : Numérote les lignes du fichier."
    echo
    echo -e "${YELLOW}cp${RESET}   : Copie des fichiers ou des répertoires."
    echo -e "        ${CYAN}Exemple :${RESET} cp fichier.txt CHEMIN/copie.txt"
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}-r${RESET} : Copie récursive des répertoires."
    echo
    echo -e "${YELLOW}mv${RESET}   : Déplace ou renomme des fichiers ou répertoires."
    echo -e "        ${CYAN}Exemple :${RESET} mv ancien_nom.txt nouveau_nom.txt"
    echo -e "                                 mv ancien_CHEMIN nouveau_CHEMIN"
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}-i${RESET} : Demande confirmation avant de remplacer des fichiers existants."
    echo
    echo -e "${YELLOW}ping${RESET}   : Déplace ou renomme des fichiers ou répertoires."
    echo -e "        ${CYAN}Exemple :${RESET} mv ancien_nom.txt nouveau_nom.txt"
    echo -e "        ${CYAN}Exemple :${RESET} mv ancien_CHEMIN nouveau_CHEMIN"
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}-i${RESET} : Demande confirmation avant de remplacer des fichiers existants."
    echo
    echo -e "${YELLOW}steghide${RESET}   : Permet de disimuler ou déchiffrer un message dans une image."
    echo -e "        ${CYAN}Exemple :${RESET} steghide extract -sf IMAGE.png"
    echo -e "        ${GREEN}Options courantes :${RESET}"
    echo -e "          - ${YELLOW}embed${RESET} : Permet de dissimuler un fichier dans une image."
    echo -e "          - ${YELLOW}extract${RESET} : Permet d'extraire un fichier dissimulé dans une image."
    echo -e "          - ${YELLOW}info${RESET} : Regarde si il y a un message dissimuler dans une image."
    echo -e "          - ${YELLOW}-sf${RESET} : Indique l'image source contenant des données."
    echo -e "          - ${YELLOW}-ef${RESET} : Indique le fichier source a dissimuler."
    echo
    echo -e "${CYAN}######################################################################################${RESET}"
    echo
}

# Fonction pour gérer la commande /ping X.X.X.X
easter_egg_ping() {
    clear

    cmatrix &
    CMATRIX_PID=$! 
    
    sleep 5
    
    kill -SIGINT $!
    wait $CMATRIX_PID

    clear
    
    echo -e "${GREEN}"
    cat /easter_egg.txt
    echo -e "${RESET}"

    sleep 10
    clear
}






######################################################## INTRODUCTION ######################################################

clear
press_enter
clear

echo -e "${RED}"
echo -e "          ____  _               _            _       _                   _         _               _ _            "
echo -e "         / ___|| |__   ___ _ __| | ___   ___| | __  (_)___     _ __ ___ (_)___ ___(_)_ __   __ _  | | |           "
echo -e "         \___ \| '_ \ / _ \ '__| |/ _ \ / __| |/ /  | / __|   | '_ \ _ \| / __/ __| | '_ \ / _\ | | | |           "
echo -e "          ___) | | | |  __/ |  | | (_) | (__|   <   | \__ \   | | | | | | \__ \__ \ | | | | (_| | |_|_|           "
echo -e "         |____/|_| |_|\___|_| _|_|\___/ \___|_|\_\  |_|___/   |_| |_| |_|_|___/___/_|_| |_|\__, | (_|_)           "
echo -e "                                                                                           |___/          ${RESET}"                                                                                                                                                                                                                                                                      
echo
echo -e "Le 1er Décembre, 2024"
echo
echo -e "                              === Journal de l'Enquête : Le Hacker Fantôme ===                                    "
echo
sleep 1
echo
echo -e " Un hacker mystérieux connu sous le nom de 'Le Fantôme' a semé la terreur à travers plusieurs grandes entreprises."
echo -e "Le détective Sherlock Holmes, avec l'aide de son fidèle acolyte Dr. Watson, a pris en charge l'affaire. Mais alors"
echo -e "que les indices s'accumulaient, Sherlock et Watson ont mystérieusement disparu...                                 "
sleep 2
echo
echo
echo -e "${CYAN}  Vous, détective en herbe, allez devoir prendre la relève et découvrir la vérité en suivant les traces laissées   "
echo -e "par Sherlock. Attention le hacker fantome est connu pour vouloir s'amuser avec les gens qui essai de l'arreter ,  "
echo -e "n'oubliez pas qu'il est dangereux !                                                                               "
echo
sleep 3
echo -e "N'hésiter pas a utiliser les documents, les notes, les images et tout ce que vous pourrez trouver sur le PC portable"
echo -e "de Sherlock. Utiliser vos connaissances en linux et en sécuriter d'information et vous reussirez à coincer le hacker"
echo -e "fantome et sauver Sherlock et son accolite Watson. Bonne chance !${RESET}                                         "
sleep 3 
echo
echo
press_enter
clear


########################################### Étape 1 : Mot de passe de session ##############################################

echo -e "${BLUE}#################################### [Étape 1] Accès au PC de Sherlock ##########################################${RESET}"
echo
sleep 1
echo
echo -e "Le PC de Sherlock est rester dans son bureau, Il a toute les notes de l'enqueteur. Il pourrait nous aider !       "
echo -e "Mais nous n'avons pas le mot de passe ... Sherlock est connu pour être simple d'esprit et directe, peut-être qu'il"
echo -e "a mis un mot de passe simple comme le nom de quelqu'un à qui il tient ?"
echo
sleep 1

# Rendre la comparaison insensible à la casse
shopt -s nocasematch  # Active la comparaison insensible à la casse pour les chaînes

# Demande mot de passe jusqu'à ce que ce soit correct
while true; do
    read -p "Quel peut bien être le mot de passe de Sherlock ? " session_pass
    if [[ "$session_pass" =~ ^watson$ ]]; then  # Vérifie si le mot de passe est 'watson' peu importe la casse
        echo -e "${GREEN}Accès accordé.${RESET}"
        break  # Mot de passe correct, on sort de la boucle et on passe à la suite
    else
        echo -e "${RED}Mot de passe incorrect.${RESET}"  # Si mot de passe incorrect, on recommence
    fi
done
sleep 1
clear

################################################## animation etape 1 #######################################################
echo -e "
            ,------------------------------------------------------------------------------------------------,
            |  /------------------------------------------------------------------------------------------\  |
            | |                                                                                            | |
            | |                                        010101101                                           | |
            | |                                      0001010110101                                         | |
            | |                                     00101     01001                                        | |
            | |                                     0110       0010                                        | |
            | |                                   0110101010101101110                                      | |
            | |                                 01010101101110110101010                                    | |
            | |                                10101010110   10110101010                                   | |
            | |                                0101010101     1011010100                                   | |
            | |                                0101010101     1011010100                                   | |
            | |                                01010101101   11010101101                                   | |
            | |                                01010101101   11010100101                                   | |
            | |                                010101011011 110101011101                                   | |
            | |                                 00101011011101101010101                                    | |
            | |                                   1011011101101010001                                      | |
            |  \__________________________________________________________________________________________/  |
            |________________________________________________________________________________________________|
             \_____                                        []                                        _______/
                  /__________________________________________________________________________________\         
                              ,----------------------------------------------------,
                              | [][][][][]  [][][][][]  [][][][]  [][__]  [][][][] |
                              |                                                    |
                              |  [][][][][][][][][][][][][][_]    [][][]  [][][][] |
                              |  [_][][][][][][][][][][][][][ |   [][][]  [][][][] |
                              | [][_][][][][][][][][][][][][]||     []    [][][][] |
                              | [__][][][][][][][][][][][][__]    [][][]  [][][]|| |
                              |   [__][________________][__]              [__][]|| |
                              \----------------------------------------------------/                                       "
sleep 2
clear

echo -e "
            ,------------------------------------------------------------------------------------------------,
            |  /------------------------------------------------------------------------------------------\  |
            | |                                                                                            | |
            | |                                                   010101101                                | |
            | |                                                 0001010110101                              | |
            | |                                                00101     01001                             | |
            | |                                                0110       0010                             | |
            | |                                   0110101010101101110                                      | |
            | |                                 01010101101110110101010                                    | |
            | |                                10101010110   10110101010                                   | |
            | |                                0101010101     1011010100                                   | |
            | |                                0101010101     1011010100                                   | |
            | |                                01010101101   11010101101                                   | |
            | |                                01010101101   11010100101                                   | |
            | |                                010101011011 110101011101                                   | |
            | |                                 00101011011101101010101                                    | |
            | |                                   1011011101101010001                                      | |
            |  \__________________________________________________________________________________________/  |
            |________________________________________________________________________________________________|
             \_____                                        []                                        _______/
                  /__________________________________________________________________________________\         
                              ,----------------------------------------------------,
                              | [][][][][]  [][][][][]  [][][][]  [][__]  [][][][] |
                              |                                                    |
                              |  [][][][][][][][][][][][][][_]    [][][]  [][][][] |
                              |  [_][][][][][][][][][][][][][ |   [][][]  [][][][] |
                              | [][_][][][][][][][][][][][][]||     []    [][][][] |
                              | [__][][][][][][][][][][][][__]    [][][]  [][][]|| |
                              |   [__][________________][__]              [__][]|| |
                              \----------------------------------------------------/                                       "
sleep 3
clear


############################################### Étape 2 : Message crypté ###################################################

echo -e "${BLUE}###################################### [Étape 2] Message crypté ###############################################${RESET}"
echo
sleep 1
echo
echo -e "Un mail étrange                                                                            " 
sleep 1
echo
echo -e "Le détective Sherlock Holmes a reçu un message anonyme dans sa messagerie personnelle.                            "
echo -e "Le message est simple, mais étrange :                                                                             "
echo -e "${CYAN}\"Trouve la clé pour déchiffrer la vérité. Laisse les mots de passe derrière toi. Comme dit l'a César\"${RESET}"
echo
sleep 1
echo
echo -e "Le message est suivi d'une chaîne de caractères bizarres. Voici le message chiffré :                              "
echo -e "${CYAN}\"Oh Idqwrph hvw sdupl qrxv.\"${RESET}                                                                     "
echo
sleep 1
echo
echo -e "D'après les notes de Sherlock, ce genre de code est chiffré avec une méthode de cryptographie.                    "
echo -e "Votre mission : trouver la clé de chiffrement et découvrir la phrase déchiffrée.                                  "
echo
echo -e "Utilisez vos connaissances, les fichiers présents, ou même des scripts pour déchiffrer le message."
echo
echo
echo
# L'utilisateur peut utiliser des commandes
echo -e "${BLUE}Vous pouvez utiliser les commandes Linux habituelles pour explorer.                        "
echo -e "Si jamais vous avez besoin d'aide pour des commandes linux vous pouvez utiliser le /aide.${RESET} "

# Boucle pour l'environnement de commande
echo -e "Tapez '/étape2' pour répondre à l'étape 2."
while true; do
    read -p "~$" user_input

    if [[ "$user_input" == "/étape2" ]]; then
        # Démarre les questions
        while true; do
            echo -e "${BLUE}Pour valider cette étape, répondez aux deux questions suivantes :${RESET}      "
            
            # Première question : décalage
            read -p "De combien est le décalage du chiffrement de César ? " shift
            if [[ "$shift" != "3" ]]; then
                echo -e "${RED}Réponse incorrecte. Vous retournez à l'environnement de commande.${RESET}   "
                break  # Retour à la boucle des commandes
            fi
            echo
            # Deuxième question : phrase
            read -p "Et quelle est la phrase déchiffrée ? (écrivez exactement la même phrase) " decrypted_phrase
            if [[ "$decrypted_phrase" != "Le Fantome est parmi nous" ]]; then
                echo -e "${RED}Réponse incorrecte. Vous retournez à l'environnement de commande.${RESET}   "
                break  # Retour à la boucle des commandes
            fi

            # Si les deux réponses sont correctes
            echo -e "${GREEN}Bravo ! Vous avez trouvé le décalage et déchiffré la phrase.${RESET}          "
            break 2 # Fin de l'étape 2
        done
        

    # Affiche l'aide
    elif [[ "$user_input" == "/aide" ]]; then
        afficher_aide

    else
        # Permet à l'utilisateur d'exécuter des commandes Linux
        eval "$user_input" 2>/dev/null || echo -e "${RED}Commande invalide. Tapez /aide pour voir la liste des commandes dont vous pourriez avoir besoin.${RESET}                        "
    fi
done
sleep 2
clear

################################################ Étape 3 : Trouver l'IP ####################################################

echo -e "${BLUE}################################## [Étape 3] Trouver l'IP du hacker ###########################################${RESET}"
echo
sleep 1
echo
echo -e "Sherlock a récupéré des logs qui pourraient nous conduire au hacker Fantôme."
echo -e "Dans ces logs, il y a des adresses IP d'entreprise qui ont été attaqué par des hackers. Peut-être que l'on pourrait"
echo -e "trouver l'IP d'un poste du hacker ?"
echo
echo -e "${YELLOW}Votre mission : Retrouvez l'adresse IP correspondant au Fantôme dans les fichiers logs trouver par Sherlock.${RESET}"
echo

echo -e "Tapez '/étape3' pour répondre à l'étape 3."
while true; do
    read -p "~$" user_input

    if [[ "$user_input" == "/étape3" ]]; then
        # Démarre la question
        while true; do
            echo -e "${BLUE}Pour valider cette étape, répondez a la question suivante :${RESET}      "
            
            # Première question : décalage
            read -p "Quelle est l'IP du poste attaquant du Fantôme ? " shift
            if [[ "$shift" != "X.X.X.X" ]]; then
                echo -e "${RED}Réponse incorrecte. Vous retournez à l'environnement de commande.${RESET}   "
                break  # Retour à la boucle des commandes
            fi

            # Si la réponse est correcte
            echo -e "${GREEN}Bravo ! Vous avez trouvé le poste du fantome et sa méthode.${RESET}"
            break 2

        done
        

    # Affiche l'aide
    elif [[ "$user_input" == "/aide" ]]; then
        afficher_aide
    
    elif [[ "$user_input" == "ping 192.168.1.3" ]]; then
        easter_egg_ping 
    
    else
        # Permet à l'utilisateur d'exécuter des commandes Linux
        eval "$user_input" 2>/dev/null || echo -e "${RED}Commande invalide. Tapez /aide pour voir la liste des commandes dont vous pourriez avoir besoin.${RESET}                        "
    fi
done
sleep 2
clear


################################################ Étape 4 : Décoder la photo ################################################

echo -e "${BLUE}################################## [Étape 4] La mystérieuse photo #############################################${RESET}"
echo
sleep 1
echo
echo -e "Un hacker rival au Fantome, a envoyer un mail a Sherlock avec des photos de petit crime du Fantome."
echo -e "D'après les notes de Sherlock, Watson pense que c'est un piège, mais Sherlock pense qu'il pourrait être réel, et "
echo -e "leur permettre d'attrapper ce criminel plus rapidement. Si cela est vrai d'après Sherlock, le Fantome a dû voir "
echo -e "ce mail. Le hacker rival a dû alors peut être trouver un moyen de dissimuler les informations qu'il voulait pas "
echo -e "que le fantome voit mais que Sherlock serait capable de trouver."
echo
echo -e "${YELLOW}Votre mission : Trouvez les informations cachées dans le mail du hacker rival.${RESET}"
echo

echo -e "Tapez '/étape4' pour répondre à l'étape 4."
while true; do
    read -p "~$" user_input

    if [[ "$user_input" == "/étape4" ]]; then
        # Démarre la question
        while true; do
            echo -e "${BLUE}Pour valider cette étape, répondez a la question suivante :${RESET}      "
            
            # Première question : décalage
            read -p "Quel message a voulu vous transmettre le hacker rival ? (mettre le port du protocole des caméras)" shift
            if [[ "$shift" != "22" ]]; then
                echo -e "${RED}Réponse incorrecte. Vous retournez à l'environnement de commande.${RESET}   "
                break  # Retour à la boucle des commandes
            fi

            # Si la réponse est correcte
            echo -e "${GREEN}Bravo ! Vous avez trouvé le poste du hacker.${RESET}          "
            break 2

        done
        

    # Affiche l'aide
    elif [[ "$user_input" == "/aide" ]]; then
        afficher_aide
    
    elif [[ "$user_input" == "ping 192.168.1.3" ]]; then
        easter_egg_ping 
    
    else
        # Permet à l'utilisateur d'exécuter des commandes Linux
        eval "$user_input" 2>/dev/null || echo -e "${RED}Commande invalide. Tapez /aide pour voir la liste des commandes dont vous pourriez avoir besoin.${RESET}"
    fi
done

sleep 2
clear

############################################## Étape 5 : Fouiller la clé USB ###############################################

echo -e "${BLUE}####################################### [Étape 5] : La clé USB perdu #######################################${RESET}"
echo
sleep 1
echo
echo -e "Suite a une tentative d'intrusion du Fantome dans le bureau de Sherlock. Sherlock a couru apres le Fantome, et il a"
echo -e "fait tombé de son sac une clé USB. Peut-être qu'il y a quelque chose d'important dedans. "
echo
echo -e "${YELLOW}Votre mission : Trouvez le fichier caché.${RESET}"
echo

############################################## GIT CLONE ###############################################
############################################## GIT CLONE ###############################################
############################################## GIT CLONE ###############################################
############################################## GIT CLONE ###############################################

echo -e "Tapez '/étape5' pour répondre à l'étape 5."
while true; do
    read -p "~$" user_input

    if [[ "$user_input" == "/étape5" ]]; then
        # Démarre la question
        while true; do
            echo -e "${BLUE}Pour valider cette étape, répondez a la question suivante :${RESET}      "
            
            # Première question : décalage
            read -p "Quelle est la commande que vous avez utilisé pour trouver le fichier cachée ?" shift
            if [[ "$shift" != "ls -a" ]]; then
                echo -e "${RED}Réponse incorrecte. Vous retournez à l'environnement de commande.${RESET}   "
                break  # Retour à la boucle des commandes
            fi

            # Si la réponse est correcte
            echo -e "${GREEN}Bravo ! Vous avez trouvé les poste du hacker.${RESET}          "
            break 2

        done
        

    # Affiche l'aide
    elif [[ "$user_input" == "/aide" ]]; then
        afficher_aide
    
    elif [[ "$user_input" == "ping 192.168.1.3" ]]; then
        easter_egg_ping 
    
    else
        # Permet à l'utilisateur d'exécuter des commandes Linux
        eval "$user_input" 2>/dev/null || echo -e "${RED}Commande invalide. Tapez /aide pour voir la liste des commandes dont vous pourriez avoir besoin.${RESET}"
    fi
done

sleep 2
clear   





############################################## Étape final : Brute force SSH ###############################################

echo -e "${BLUE}##################################### [Étape final] : Brute force SSH ######################################${RESET}"
echo
sleep 1
echo
echo -e "BRAVO ! Vous avez reussi a reunir tout les indices de sherlokc et vous allez pouvoir passer au moment ou il faut"
echo -e "trouver le Fantome !"
echo
echo -e "Pour ce faire nous allons attaquer le réseau du Fantome et trouver le mot de passe d'un de ces postes."
echo -e "En utilisant Hydra (l'hydre sur la gauche/ le serpent vert a 3 têtes), vous allez pouvoir trouver le mot de passe."
echo -e "Il vous suffit de renseigner les indices que vous avez obtenus tout au long de cette enquête."
echo
echo -e "${YELLOW}Votre mission : Avec Hydra, trouver le mot de passe du Fantome sur le poste du Fantome.${RESET}"
echo

echo -e "Tapez '/étape_final' pour répondre à l'étape final."
while true; do
    read -p "~$" user_input

    if [[ "$user_input" == "/étape_final" ]]; then
        # Démarre la question
        while true; do
            echo -e "${BLUE}Pour confirmer que vous avez trouver le fantome, veuillez répondre a la question suivante :${RESET}      "
            
            # Première question : décalage
            read -p "Quelle est le mot de passe du Fantome ?" shift
            if [[ "$shift" != "Ghost_42" ]]; then
                echo -e "${RED}Réponse incorrecte. Vous retournez à l'environnement de commande.${RESET}   "
                break  # Retour à la boucle des commandes
            fi

            # Si la réponse est correcte
            echo -e "${GREEN}Bravo ! Vous pouvez maintenant rentrer sur le poste du Fantome et sauver Sherlock.${RESET}          "
            break 2

        done
        

    # Affiche l'aide
    elif [[ "$user_input" == "/aide" ]]; then
        afficher_aide
    
    elif [[ "$user_input" == "ping 192.168.1.3" ]]; then
        easter_egg_ping 
    
    else
        # Permet à l'utilisateur d'exécuter des commandes Linux
        eval "$user_input" 2>/dev/null || echo -e "${RED}Commande invalide. Tapez /aide pour voir la liste des commandes dont vous pourriez avoir besoin.${RESET}"
    fi
done

sleep 2
clear 






############################################## Morale final ###############################################

echo -e "${YELLOW}=== Fin de l'enquête ===${RESET}"
echo
sleep 1
echo -e "${GREEN}Sherlock et Watson sont sauvés grâce à votre aide !${RESET}"
echo -e "En utilisant Hydra, vous avez pu faire une attaque brute force. Le principe est que le logiciel teste plein de "
echo -e "mot de passe et continue jusqu'à trouver le mot de passe. Si le mot de passe est simple, il trouvera facilement,"
echo -e "si il est compliqué il prendra du temps et si il est suffisament complexe, alors le logiciel mettra trop de temps"
echo -e "a le trouver et alors les attanquants abandonnerons."
echo -e "Malgré que l'on l'ai fait dans le mini-jeu, ce principe est aussi valable sur tout vos comptes a ce jour. "
echo -e "C'est donc pour une raison de sécurité que les sites (Instagram, Snapchat, Facebook) vous demande certain "
echo -e "paramettrage lors de la création de votre mot de passe."
echo
echo -e "Félicitation d'être aller au bout de ce mini-jeu technique. Et bonne journée !"