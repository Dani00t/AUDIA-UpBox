DATI AUDIA4 UP BOX
AudiA4  L = 4,709 m; 
        H = 1.457 m; 
        W = 1.983 m;
	Aref = 1.24 m^2;

4 mesh diverse per studiare la convergenza.

- snappyHexMesh sempre uguale

- blockMesh:
	MESH1 (60 12 12)	--> Lv0 = 0.75 m
	MESH2 (90 18 18)	--> Lv0 = 0.5 m
	MESH3 (100 20 20)	--> Lv0 = 0.45 m
	MESH4 (120 24 24 )	--> Lv0 = 0.375 m

- controlDict: 1500 iterazioni; medio ultime 500

- forceCoeffs:
	rho = 1 perché incomprimibile (ho letto su internet);
	Se voglio calcolare le forze metti rho = 1.225;
	p = 0;
	Aref = 1.24; 
	U = 30;

PER RUNNARE ESEGUIRE ./Allrun. C'E' DA CAMBIARE SOLO IL FILE .OBJ E L'AREA FRONTALE per ogni configurazione di box (Aref con box = 1.24 m^2, Aref no box o back = 1.15 m^2).
Codici matlab per plottare Cd vs iterazioni e residui -- da implementare su openfoam solverInfo.







RISULTATI: Aref = 1.24, 1500 iterazioni

- MESH1: (60 12 12)
	celle = 960049//
	log.checkMesh 2 CELLE CON SKEWNESS > 4//
	CD = 0.342027//
 
- MESH2: (90 18 18)
	celle = 3068987
	log.checkMesh OK
	CD = 0.33321

- MESH3: (100 20 20)
	celle = 4221399
	log.checkMesh OK
	CD = 0.337323

- MESH4: (120 24 24)
	celle = 7480250
	log.checkMesh 1 cella con skewness 4.16926
	CD = 0.337113
	


