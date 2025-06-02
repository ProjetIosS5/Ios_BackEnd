# Backend REST – API de gestion des plats pour l'app iOS

> Ce backend alimente l’application iOS de commande de plats en exposant des endpoints RESTful pour récupérer, ajouter, modifier ou supprimer des plats.

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.10+-blue?style=flat-square&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/API-REST-ff69b4?style=flat-square"/>
  <img src="https://img.shields.io/badge/Hébergé%20sur-PythonAnywhere-orange?style=flat-square"/>
</p>

<h3 align="center">• • •</h3>

## 🔗 Endpoint principal

> Endpoint en production (PythonAnywhere) :  
[`http://majoiepyth.pythonanywhere.com/api/main/dish`](http://majoiepyth.pythonanywhere.com/api/main/dish)

<h3 align="center">• • •</h3>

## 📁 Structure du projet

```
📦 backend/
 ┣ 📂 ios_BackEnd/
 ┣ 📂 authentification/
 ┃ ┣ 📄 models.py
 ┃ ┣ 📄 views.py
 ┃ ┣ 📄 serializers.py
 ┣ 📂 main/
 ┃ ┣ 📄 models.py
 ┃ ┣ 📄 views.py
 ┃ ┣ 📄 serializers.py
 ┣ 📂 users/
 ┃ ┣ 📄 models.py
 ┃ ┣ 📄 views.py
 ┃ ┣ 📄 serializers.py
 ┣ 📂 common/
 ┃ ┣ 📄 __init__.py
 ┣ 📂 utils/
 ┃ ┣ 📄 __init__.py
 ┣ 📄 manage.py
 ┣ 📄 projetresto.sql
 ┗ 📄 requirements.txt

```

> Ce projet suit une structure Django classique adaptée au contexte.

<h3 align="center">• • •</h3>

## ⚙️ Installation locale

```bash
# 1. Cloner le backend
git clone https://github.com/ProjetIosS5/Ios_BackEnd.git
cd backend

# 2. Créer un environnement virtuel (optionnel mais recommandé)
python -m venv venv
source venv/bin/activate  # ou .\venv\Scripts\activate sous Windows

# 3. Installer les dépendances
pip install -r requirements.txt

# 4. Appliquer les migrations
python manage.py migrate

# 5. Lancer le serveur de développement
python manage.py runserver
```

<h3 align="center">• • •</h3>

## 📦 Technologies utilisées

| Élément       | Détail                      |
|---------------|-----------------------------|
| Langage       | Python 3.10+                |
| Framework     | Django                      |
| Base de données | SQL                       |
| Hébergement   | PythonAnywhere              |

<h3 align="center">• • •</h3>

## 🔐 Sécurité

> Pensez à protéger vos **clés API** et fichiers `.env` en production.  
> Ajouter `.env` à votre fichier `.gitignore`.

<h3 align="center">• • •</h3>

## ☕ Me soutenir

<p align="center">
  <a href="https://buymeacoffee.com/majoiefaya" target="_blank" rel="noopener noreferrer">
    <img src="https://img.shields.io/badge/Buy%20Me%20a%20Coffee-yellow?style=flat-square&logo=buymeacoffee&logoColor=black" alt="Buy Me a Coffee"/>
  </a>
</p>
