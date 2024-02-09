Istruzioni per l'avvio dei nodi nebula con i servizi dokcerd e k3d

1)Posizionarsi nella cartella "nebula faro" 
1.1) Aprire il terminare ed esegure il comando(fa la build e crea l'immagine docker) : sudo docker build -t nebula_faro .
1.2)Runnare l'immagine docker creata nel punto 1.1) con il comando: sudo docker run --privileged -it nebula_faro 

2)Posizionarsi nella cartella "nebula server"
2.1) Aprire il terminare ed esegure il comando: sudo docker build -t nebula_server .
2.2)Runnare l'immagine docker creata nel punto 1.1) con il comando: sudo docker run --privileged -it nebula_server
A questo punto lo script di avvio di nebula_server avvia i servizi dockerd e k3d


3)Posizionarsi nella cartella "nebula client"
3.1) Aprire il terminare ed esegure il comando: sudo docker build -t nebula_client .
3.2)Runnare l'immagine docker creata nel punto 1.1) con il comando: sudo docker run --privileged -it nebula_client
A questo punto lo script di avvio di nebula_client avvia i servizi dockerd e k3d

------------------------------------------------------------------------

Istruzioni avvio con DockerCompose( avviare solo nebula_faro )

1)Fare la build delle immagini docker( /Tesi/nebula_faro)assegnandoli il nome "nebula_faro","nebula_client","nebula_server"

2)Avviare con docker-compose il faro : sudo docker-compose up nebulafaro









-----Config Nebula net-----

192.168.100.1/32: lighthouse1 (nebula_docker)

192.168.100.5/32: laptop (nebula_docker_client)

192.168.100.9/32: server (nebula_docker_server)

-----Config docker net(routable addresses)-----

10.10.0.4/16: lighthouse1 172.17.0.3/16

10.10.0.3/16: server	172.17.0.4/16
10.10.0.2/16: laptop  172.17.0.5/16

sudo docker build -t nebula_server .
sudo docker run --ip 10.10.0.4 --net nebulaNet  --privileged nebula_server 

sudo docker build -t nebula_client .
sudo docker run --ip 10.10.0.2 --net nebulaSubNet  --privileged nebula_client

sudo docker build -t nebula_faro .
sudo docker run --ip 10.10.0.3 --net nebulaSubNet  --privileged nebula_faro


-----Per il test eseguire il docker con il seguente comando:-----
sudo docker exec -it <container id> /bin/sh

-----Per verificare il dns-----
dig @192.168.100.1  +short server  A
dig @192.168.100.1  +short laptop  A
