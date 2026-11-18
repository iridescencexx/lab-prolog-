%Codigo base
% Roles de agente. Solo el orquestador puede supervisar.
roles([orquestador, analista, comunicador, ejecutor, generico]).
rol(R) :- roles(Rs), member(R, Rs).

% Estados de un agente y de una tarea
estadosAgente([disponible, ocupado, agotado]).
estadosTarea([pendiente, asignada, completada, fallida]).

% Constantes de la plataforma
umbralCalidad(20).       % bajo este valor la respuesta es insatisfactoria
complejidadMaxima(20).   % sobre este valor una tarea se planifica en subtareas
costoDelegacion(2).      % tokens que gasta el agente que delega

% Generador pseudoaleatorio puro
randomPuro(Xn, Xn1) :- Xn1 is (Xn * 1103515245 + 12345) mod 2147483648.

% Calidad de una respuesta: entero entre 0 y 99.
calidad(Seed, IdTarea, Ciclo, Intento, Q) :-
    X is Seed * (IdTarea + 2 * Ciclo + Intento) + IdTarea,
    randomPuro(X, R),
    Q is (R // 65536) mod 100.

%TDA TAREA

% Constructor
herramienta(Nombre, Rol, Costo, Predicado, [Nombre, Rol, Costo, Predicado]).

% Selectores
herramientaNombre([Nombre, _, _, _], Nombre).
herramientaRol([_, Rol, _, _], Rol).
herramientaCosto([_, _, Costo, _], Costo).
herramientaPredicado([_, _, _, Predicado], Predicado).

% Funcion de pertenencia
