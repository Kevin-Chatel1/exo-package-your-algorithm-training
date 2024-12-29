#!/bin/bash

# Assurez-vous que les fichiers et dossiers ont les bonnes permissions
sudo chmod 666 mlflow.db
sudo chown $USER:$USER mlflow.db
sudo chmod -R 755 .
sudo chown -R $USER:$USER .

# Autoriser le port 5000 pour MLflow
echo "🛡️ Configuration du pare-feu..."
sudo ufw allow 5000/tcp

# Redémarrer le pare-feu pour appliquer les règles
sudo ufw reload

# Démarrer le serveur MLflow
echo "🚀 Démarrage du serveur MLflow..."
mlflow server --backend-store-uri sqlite:///mlflow.db \
    --default-artifact-root s3://doctolib-exo-bucket \
    --host 0.0.0.0 --port 5000 &

sleep 5
echo "✅ Serveur MLflow démarré avec succès !"


