PASSI PER LA CREAZIONE DI UN CLUSTER E L'ESECUZIONE DI UN POD CON UN'IMMAGINE CUSTOM
1)Creazione del cluster k3d
	k3d cluster create comp-cluster
2)Applicazione del manifest (comp.yaml)
	kubectl apply -f comp.yaml

Adesso il pod comp-pod del cluster dovrebbe essere in esecuzione

