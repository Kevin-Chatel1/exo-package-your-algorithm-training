# Utiliser Miniconda pour un environnement Python léger
FROM continuumio/miniconda3:latest

# Définir le répertoire de travail
WORKDIR /home/app

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    nano unzip curl && \
    rm -rf /var/lib/apt/lists/*

# Installer les dépendances AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && ./aws/install && \
    rm -rf awscliv2.zip ./aws

# Copier le fichier requirements.txt depuis le contexte de construction
COPY requirements.txt /home/app/requirements.txt

# Installer les dépendances Python
RUN pip install --upgrade pip && \
    pip install -r /home/app/requirements.txt

# Copier tous les fichiers du projet
COPY . /home/app

# Exposer le port pour MLflow
EXPOSE 5000

# Définir CMD pour exécuter `train.py` par défaut mais permettre d'autres commandes
CMD ["python", "train.py"]


