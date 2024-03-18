Istruzioni per l'avvio 

1)Fare la build delle immagini docker( faro, host1, host2, router)

1.1)Posizionarsi all'interno della cartella (ad esempio "faro") e fare la build chiamando l'immagine con lo stesso nome della cartella utilizzando il seguente comando: docker build -t "nome cartella" . 

2)Una volta fatta la build di tutte le immagini ci si posiziona nella cartella radice e si avviano i servizi con dokcer compose utilizzando il seguente comando: "docker-compose up"

 Una volta avviati correttamente i container e la rete nebula è funzionante su puo procedere ad avviare il server k3s agent.
 
3) Si "entra" nei container "host2" (il quale sara l'agent k3s) e nel container "host1"
3.1)Si stabilisce una connessione con il server con i seguendo i seguenti passi:

3.1.1)Nel container "host1" ottengo la configurazione del serve con il comando: kubectl config view -o yaml --merge=true --flatten=true

3.1.2)Copio la configurazione e la incollo nel container "host2" in un file chiamato k3sconfig(se non c'e lo si crea nella radice), modificando l'indirizzo del server da 127.0.0.1 a quello effettivo, in questo caso 192.168.100.2(ip della rete nebula)

3.1.3)Imposto il kubeconfig utilizzando il file appena creato valorizzando la sua variabile d'ambiente con il seguente comando: 
export KUBECONFIG=/k3sconfig

3.2)Ora l' "host2" è configurato correttamente con il server presente sull' "host2", procediamo quindi con la creazione del nodo k3s agent.
3.2.1)Recuperiamo il token-node per l'accesso e autenticazione  dall'host1,  con il seguente comando: "cat /var/lib/rancher/k3s/server/node-token"

3.2.2)Ora si ha tutto l'occorrente per creare il nodo agent nell' "host2", quindi eseguiamo il seguente comando : "k3s agent --server <ip server> --token <node-token>"

4)Il nodo server e il nodo agent sono correttamente configurati.
