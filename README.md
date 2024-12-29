# 🚀 **Guide d'Installation et de Déploiement de MLflow avec Docker**

## 📚 **Prérequis**
- Docker installé
- Docker Compose installé
- Python 3.12+
- Les fichiers suivants dans votre projet :
   - `setup_mlflow.sh`
   - `deploy_mlflow.sh`
   - `Dockerfile`
   - `secrets.sh`

---

## 🛠️ **1. Construction de l'Image Docker**
Avant de commencer, assurez-vous de construire l'image Docker :

```bash
sudo docker build -t appointment-detector:latest -f docker/Dockerfile .
```

---

## 🛡️ **2. Libérer le Port 5000**
Le serveur MLflow utilise le port 5000. Assurez-vous qu'il est libre.

### **Option 1 : Arrêter manuellement les processus utilisant le port 5000**
```bash
sudo lsof -t -i :5000 | xargs sudo kill -9
```

### **Option 2 : Vérifier que le port est libre**
```bash
sudo lsof -i :5000
```

Si aucune ligne n'apparaît, le port est libre.

---

## 🚀 **3. Lancer le Serveur MLflow**
Exécutez le script de configuration MLflow :

```bash
bash scripts/setup_mlflow.sh
```

### **3.1 Vérifiez le Serveur MLflow**
Assurez-vous que le serveur est opérationnel :

```bash
curl -I http://127.0.0.1:5000
```

Vous devriez obtenir :
```
HTTP/1.1 200 OK
```

---

## 📦 **4. Déployer le Projet avec MLflow**
Une fois le serveur MLflow opérationnel, lancez le déploiement :

```bash
bash scripts/deploy_mlflow.sh
```

---

## ✅ **5. Vérifications Finales**
- Accédez à l'interface MLflow : [http://127.0.0.1:5000](http://127.0.0.1:5000)
- Assurez-vous que les expériences et les artefacts sont correctement enregistrés.

---

## 🔄 **6. Redémarrage du Serveur MLflow**
Si nécessaire, redémarrez MLflow :

```bash
bash scripts/setup_mlflow.sh
```

---

## 📑 **Résumé des Commandes**
1. **Construire l'image Docker :**
   ```bash
   sudo docker build -t appointment-detector:latest -f docker/Dockerfile .
   ```
2. **Libérer le port 5000 :**
   ```bash
   sudo lsof -t -i :5000 | xargs sudo kill -9
   ```
3. **Configurer MLflow :**
   ```bash
   bash scripts/setup_mlflow.sh
   ```
4. **Vérifier le serveur :**
   ```bash
   curl -I http://127.0.0.1:5000
   ```
5. **Déployer le projet :**
   ```bash
   bash scripts/deploy_mlflow.sh
   ```

---

## 🆘 **Dépannage**
- **Port 5000 occupé :** Vérifiez avec `sudo lsof -i :5000` et terminez les processus.
- **Problèmes avec les secrets AWS :** Vérifiez que le fichier `secrets.sh` est correctement configuré.
- **Logs d'erreurs MLflow :** Consultez les logs du serveur avec `tail -f mlflow.log`

---

## 📝 **Personnalisation des Secrets**
Modifiez le fichier `secrets.sh` avec vos clés et configurations spécifiques :

```bash
export AWS_ACCESS_KEY_ID="VotreCléAWS"
export AWS_SECRET_ACCESS_KEY="VotreSecretAWS"
export MLFLOW_TRACKING_URI="http://127.0.0.1:5000"
export MLFLOW_EXPERIMENT_ID="1"
```

Puis rechargez les secrets :
```bash
source scripts/secrets.sh
```

---

## 🎯 **Félicitations !**
Vous avez réussi à déployer et configurer MLflow avec Docker. 🚀🎉

En cas de problème, consultez les logs et les étapes de dépannage.

Bon déploiement !




