% Evaluación Crediticia
% Se evalua la información de un cliente para saber si es apto para un crédito detemrinado
%%%%%%
% ====> Creditos de acuerdo al máximo de monto: K5 (hasta $5000), K10 (hasta $10000), K10X (hasta $100000), K50X (hasta $500000), KXX (Sin Tope a Evaluación Gerencial)
% ====> Condiciones para cada crédito se detallan en las siguientes tablas.
%%% 		                                    K5	    K10	        K10X	    K50X	KXX
%%% Solteros y Casado s/hijos	Ingresos	A,B,C,D,E	A,B,C,D	    A,B,C,D	    A,B,C	A
%%% Casado c Hijos	            Ingresos	A,B,C,D	    A,B,C	    A,B	        A	    -
%%% Categoria crediticia		            A,B,C	    A,B,C	    A,B	A	    A
%%% Rango de Edad		                    A,B,C,D,E	A,B,C,D,E	B,C,D	    B,C	    B,C
%%%%%%%%%%%%%% Teniendo en cuenta que
%%%Ingresos categorias por ganancias mensuales
%%% E = 10000 - 15000 = cat1
%%% D = 15000 - 20000 = cat2
%%% C = 20000 - 25000 = cat3
%%% B = 25000 - 30000 = cat4
%%% A = 30000 - 50000 = cat5
%%% 
%%% Categoria crediticia
%%% D = Malo
%%% C = Regular
%%% B = Bueno
%%% A = Excelente

%%% Rango de Edad
%%% E = + 65 = alta
%%% D = 50 - 65 = media3
%%% C = 30 - 50 = media2
%%% B = 24 - 30 = media1
%%% A = 18 - 24 = baja


%%% Base de conocimiento.
ingresos(cat5).
ingresos(cat4).
ingresos(cat3).
ingresos(cat2).
ingresos(cat1).
categoria_credi(excelente).
categoria_credi(bueno).
categoria_credi(regular).
categoria_credi(malo).
edad(baja).
edad(media1).
edad(media2).
edad(media3).
edad(alta).
estado_civil(casado).
estado_civil(soltero).
hijos(si).
hijos(no).

%%%%%%%%%%%%%%%%%%%%%%%%%5
%% Personas de ejemplo para evaluar
%% 	        Casado	Hijos	Ingreso	    CatCred	Rango Edad
%% 	Juan	No	    No	        cat5	b	    baja
%% 	Marcelo	Si	    no	        cat1	c	    medio2
%% 	Silvia	no	    si	        cat3	a	    medio1
%% 	Leo	    si	    si	        cat2	a	    medio3
%% 	Antonio	si	    si	        cat2	a	    alto
%casado(juan,no).
%hijos(juan,no).
solicitante(juan,estado_civil(soltero),hijos(no),ingresos(cat5),categoria_credi(bueno),edad(baja)).
solicitante(marcelo,estado_civil(casado),hijos(no),ingresos(cat1),categoria_credi(regular),edad(media2)).
solicitante(silvia,estado_civil(soltero),hijos(si),ingresos(cat3),categoria_credi(excelente),edad(media1)).
solicitante(leo,estado_civil(si),hijos(si),ingresos(cat2),categoria_credi(excelente),edad(medio3)).
solicitante(antonio,estado_civil(si),hijos(si),ingresos(cat2),categoria_credi(excelente),edad(alto)).

apto_para_credito(X,k5) :- 
    solicitante(X,estado_civil(soltero),hijos(no),ingresos(cat5),categoria_credi(bueno),edad(baja)).
apto_para_credito(X,k10).
apto_para_credito(X,k10x).
apto_para_credito(X,k50x).
apto_para_credito(X,kxx).

mirando(test,b).
mirando(test2,d).
probando(X) :- 
    mirando(X,Y),member(Y,[a,b,c]).