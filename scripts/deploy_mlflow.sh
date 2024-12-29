#!/bin/bash

# Charger les variables secrètes
source scripts/secrets.sh

# Lancer le conteneur Docker
echo "🐳 Démarrage du conteneur Docker..."
docker run -it --rm \
-e MLFLOW_TRACKING_URI="$MLFLOW_TRACKING_URI" \
-e MLFLOW_EXPERIMENT_ID="$MLFLOW_EXPERIMENT_ID" \
-e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
-e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
--network="host" \
appointment-detector:latest python train.py --n_estimators 100 --min_samples_split 2



