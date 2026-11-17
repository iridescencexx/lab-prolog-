roles([orquestador, analista, comunicador, ejecutor, generico]).
rol(R):- roles(Rs), member(R, Rs).

estadosAgente([disponible, ocupado, agotado]).
estadosTarea([pendiente, asignada, completada, fallida]).

umbralCalidad(20).
complejidadMaxima(20).
costoDelegacion(20).

