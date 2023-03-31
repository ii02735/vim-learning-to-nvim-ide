# Environnement NeoVim personnalisé

Ce dépôt contient un Dockerfile qui installe l'éditeur de texte **NeoVim**, avec des plugins qui ont été ajoutés.
L'objectif est de pouvoir retrouver des fonctionnalités comparables à un **IDE**.

1. Construire l'image Docker
2. Lancer un container (en mode non-root si vous souhaitez l'utiliser dans l'un de vos projets de développement)

```sh
docker run --rm -it -u $(id -u):$(id -g) -v <chemin de votre projet>:/home/noroot/<projet> <nom de l'image choisie> ash
```

**À ne pas oublier :** 

- Lancer la commande `:so` à l'intérieur du fichier `.config/nvim/lua/configurations/packer.nvim`
- Synchroniser les plugins : `:PackerSync`
- Quitter l'éditeur pour prendre en compte les changements : `:q`
- Ré-ouvrir un fichier ou netrw pour observer les changements (tester les combinaisons de touche)
