Fiecare cod bash incepe cu comanda "#!/bin/bash"

Sarcina 1
backup.sh este un cod care copiaza toate fisierele si directoarele intr-un .tar.gz respectiv daca v-om rula linia comanda data in screenshotul mai jos intr-un director care contine (ex. 2 fisiere), acesta va face un backup la (ex. 2 fisiere) in .tar.gz.
![screenshot](image.png)

![screenshot](image2.png)

Sarcina 2
cleanup.sh este un cod care sterge toate fisierele si directoarele (la dorinta).
Ca exemplu v-om sterge backup-ul care l-am creeat in sarcina precedenta folosind cleanup.sh, utilizand urmatoarele linii de comanda.
![screenshot](image3.png)
Observam ca .tar.gz facut precedent este sters. Aceasta comanda poate fi utilizata cu orice tip de extensie (.txt, .zip, .rar, etc)

chmod +x cleanup.sh, l-am folosit pentru a face fisierul executabil.
