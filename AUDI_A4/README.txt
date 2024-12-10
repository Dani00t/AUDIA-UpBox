DATI AUDIA4 A4
AudiA4  L = 4,709 m; 
        H = 1.457 m; 
        W = 1.983 m;
	Aref = 1.15 m^2;

4 mesh diverse per studiare la convergenza.
- snappyHexMesh sempre uguale

- blockMesh:
RISULTATI: Aref = 1.15, 2000 iterazioni

	- MESH3: (100 20 20) --> Lv0 = 0.45 m
		celle = 
		log.checkMesh 
		CD = 
		Cd MEDIO =

- controlDict: 2000 iterazioni; medio ultime 500

- forceCoeffs:
	rho = 1 perché incomprimibile (ho letto su internet);
	Se voglio calcolare le forze metti rho = 1.225;
	p = 0;
	Aref = 1.15; 
	U = 30;