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

## DevIcons

Cet environnement utilise des glyphes d'icônes spécifiques pour les plugins qui ont été installés (comme kyazdani42/nvim-web-devicons).
Il est donc nécessaire d'avoir une police patchée sur son système / terminal.

En voici une liste : https://github.com/ryanoasis/nerd-fonts#patched-fonts

En sélectionner une puis la mettre dans un des dossiers suivants : 

- /usr/share/fonts

- ~/.fonts (portée utilisateur)

Ensuite :

- Recharger les polices : `fc-cache`
- Vérifier que sa police se trouve bien dans les polices chargées : `fc-list`

## LSP et MASON

L'environnement NeoVim fourni possède un **client LSP**, soit un client qui permet d'interroger des serveurs de langages à des fins d'autocomplétion.

En complément de ce client, NeoVim possède aussi le plugin *MASON* qui permet de faciliter l'installation de nouveaux serveurs de langages.

### Des commandes utiles

- Obtenir les logs du client LSP : 

```vim
:LspLog
```

- Obtenir les informations du serveur de langage utilisé dans un fichier :

```vim
:LspInfo
```

- Afficher l'utilitaire MASON : 

```vim
:Mason
```

## Intelephense

Intelephense est utilisé pour assurer la complétion des scripts PHP.
Une licence (clé) est nécessaire pour bénéficier de toutes les fonctionnalités.

La clé de licence devra être créée dans un fichier `licence.txt`.

Et comme indiqué dans la **configuration par défaut** du LSP de Intelephense (https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense), il est nécessaire d'être dans un dossier présentant l'une des 2 caractéristiques (`root_dir`) :

- Être un dépôt git (présence du dossier `.git`)
- Avoir le fichier `composer.json`

## Psalm

Similairement à Intelephense (https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#psalm), il est nécessaire dans le dossier d'avoir un fichier `psalm.xml`.

Il faut également installer le **binaire psalm** dans le répertoire de son projet :

```sh
composer require vimeo/psalm
```

Ensuite, le linter fonctionnera *depuis le répertoire racine* du projet (où on a le dossier `vendor` de composer en général).
Ainsi, si l'on souhaite éditer un fichier, il faut le faire *depuis le répertoire racine* (et non en se déplaçant).

OK : 

```
nvim src/script.php
```

KO :

```sh
cd src
nvim script.php
```
