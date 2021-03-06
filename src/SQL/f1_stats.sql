drop database if exists f1_stats;
create database f1_stats;
use f1_stats;
set SQL_SAFE_UPDATES = 0;
-- ---------------------------------------------
drop table if exists campeonato_constructores;
drop table if exists campeonato_pilotos;
drop table if exists posiciones;
drop table if exists carreras;
drop table if exists circuitos;
drop table if exists pilotos;
drop table if exists equipos;
-- ---------------------------------------------
drop table if exists usuarios;
create table usuarios(
	id_usuario int primary key auto_increment,
    email varchar(30),
    pass varchar(30)
)Engine = innodb;

drop procedure if exists insert_usuarios;
DELIMITER $$
create procedure insert_usuarios(
	IN email varchar(30),
    IN pass varchar(30)
)
begin
	insert into usuarios(email,pass)values(email,pass);
end $$
DELIMITER ;

-- ---------------------------------------------
create table equipos(
	id_equipo int primary key auto_increment,
    imagen varchar(100),
    nombre varchar(30),
    pais varchar(30),
    director_deportivo varchar(30),
    jefe_tecnico varchar(100),
    chasis_actual varchar(30),
    motor varchar(30),
    debut int,
    campeonatos int,
    puntos int default 0,
    constraint ck_campeonatos_equipos check (campeonatos >= 0)
)Engine = innodb;

DELIMITER $$
create procedure insert_equipos(
	IN imagen varchar(100),
	IN nombre varchar(30),
    IN pais varchar(30),
    IN director_deportivo varchar(30),
    IN jefe_tecnico varchar(30),
    IN chasis_actual varchar(30),
    IN motor varchar(30),
    IN debut int,
    IN campeonatos int
)
begin
	insert into equipos(imagen,nombre,pais,director_deportivo,jefe_tecnico,chasis_actual,motor,debut,campeonatos)
    values(imagen,nombre,pais,director_deportivo,jefe_tecnico,chasis_actual,motor,debut,campeonatos);
end $$
DELIMITER ;

call insert_equipos("https://i.imgur.com/TTNA5uM.png","FERRARI","Maranello, Italia","Mattia Binotto","Enrico Cardile / Enrico Gualtieri","F1-75","Ferrari",1950,16);
call insert_equipos("https://i.imgur.com/QahYLIP.png","RED BULL","Milton Keynes, Reino Unido","Christian Horner","Pierre Wach??","RB18","Red Bull Powertrains",1997,4);
call insert_equipos("https://i.imgur.com/Gcsywii.png","MERCEDES","Brackley, Reino Unido","Toto Wolff","Mike Elliott","W13","Mercedes",1970,8);
call insert_equipos("https://i.imgur.com/pYK3o0s.png","MCLAREN","Woking, Reino Unido","Andreas Seidl","James Key","MCL36","Mercedes",1966,8);
call insert_equipos("https://i.imgur.com/pMg9nbk.png","ALFA ROMEO","Hinwil, Suiza","Fr??d??ric Vasseur","Jan Monchaux","C42","Ferrari",1993,0);
call insert_equipos("https://i.imgur.com/X0mCuIf.png","HAAS","Kannapolis, Estados Unidos","Guenther Steiner","Simone Resta","VF-22","Ferrari",2016,0);
call insert_equipos("https://i.imgur.com/zDRrEjt.png","ALPINE","Enstone, Reino Unido","Otmar Szafnauer","Pat Fry","A522","Renault",1986,2);
call insert_equipos("https://i.imgur.com/y3pDl9B.png","ALPHATAURI","Faenza, Italia","Franz Tost","Jody Egginton","AT03","Red Bull Powertrains",1985,0);
call insert_equipos("https://i.imgur.com/aPmbdVB.png","ASTON MARTIN","Silverstone, Reino Unido","Mike Krack","Andrew Green","AMR22","Mercedes",2018,0);
call insert_equipos("https://i.imgur.com/VzQm6Y1.png","WILLIAMS","Grove, Reino Unido","Jost Capito","Fran??ois-Xavier Demaison","FW44","Mercedes",1978,9);
select * from equipos order by campeonatos;

-- ------------------------------------------------------------

create table pilotos(
	id_piloto int primary key auto_increment,
    imagen varchar(100),
    nombre varchar(30),
    numero int,
    nacionalidad varchar(30),
    nacimiento date,
    locacion_nacimiento varchar(50),
    campeonatos int default 0,
    grandespremios int default 0,	
    victorias int default 0,
    podios int default 0,
    puntos int default 0,
    poles int default 0,
    vueltas_rapidas int default 0,
    id_equipo int,
    constraint ck_campeonatos_pilotos check (campeonatos >= 0),
    constraint fk_idEquipo foreign key (id_equipo) references equipos(id_equipo)
)Engine = innodb;
DELIMITER $$
create procedure insert_pilotos(
	IN imagen varchar(100),
	IN nombre varchar(30),
    IN numero int,
    IN nacionalidad varchar(30),
    IN nacimiento date,
    IN locacion_nacimiento varchar(50),
    IN campeonatos int,
    IN grandespremios int,	
    IN victorias int,
    IN podios int,
    IN puntos int,
    IN poles int,
    IN vueltas_rapidas int,
    IN id_equipo int)
begin
	insert into pilotos(imagen,nombre,numero,nacionalidad,nacimiento,locacion_nacimiento,campeonatos,grandespremios,victorias,podios,puntos,poles,vueltas_rapidas,id_equipo)
    values(imagen,nombre,numero,nacionalidad,nacimiento,locacion_nacimiento,campeonatos,grandespremios,victorias,podios,puntos,poles,vueltas_rapidas,id_equipo);
end $$
DELIMITER ;

call insert_pilotos("https://i.imgur.com/Wg4WwGg.png","Lewis Hamilton",44,"Reino Unido","1985-01-07","Stevenage, Reino Unido",0,0,0,0,0,0,0,3);
call insert_pilotos("https://i.imgur.com/P9Odll3.png","George Russell",63,"Reino Unido","1998-02-15","King's Lynn, Reino Unido",0,0,0,0,0,0,0,3);
call insert_pilotos("https://i.imgur.com/qX0Dmnb.png","Fernando Alonso",14,"Espa??a","1981-07-29","Oviedo, Espa??a",0,0,0,0,0,0,0,7);
call insert_pilotos("https://i.imgur.com/qLF8Cks.png","Esteban Ocon",31,"Francia","1996-09-17","??vreux, Normand??a, Francia",0,0,0,0,0,0,0,7);
call insert_pilotos("https://i.imgur.com/yOAQHhD.png","Mick Schumacher",47,"Alemania","1999-03-22","Vufflens-le-Ch??teau, Suiza",0,0,0,0,0,0,0,6);
call insert_pilotos("https://i.imgur.com/F5n6uoh.png","Kevin Magnussen",20,"Dinamarca","1992-10-05","Roskilde, Dinamarca",0,0,0,0,0,0,0,6);
call insert_pilotos("https://i.imgur.com/b6yO6OU.png","Lando Norris",4,"Reino Unido","1999-11-13","Bristol, Reino Unido",0,0,0,0,0,0,0,4);
call insert_pilotos("https://i.imgur.com/KBFF6C1.png","Daniel Ricciardo",3,"Australia","1989-07-01","Perth, Australia",0,0,0,0,0,0,0,4);
call insert_pilotos("https://i.imgur.com/6xPtS8r.png","Guanyu Zhou",24,"China","1999-05-30","Shanghai, China",0,0,0,0,0,0,0,5);
call insert_pilotos("https://i.imgur.com/ISG7Yci.png","Valtteri Bottas",77,"Finlandia","1989-08-28","Nastola, Finlandia",0,0,0,0,0,0,0,5);
call insert_pilotos("https://i.imgur.com/ytUV6Vc.png","Sergio P??rez",11,"M??xico","1990-01-26","Guadalajara, M??xico",0,0,0,0,0,0,0,2);
call insert_pilotos("https://i.imgur.com/pQPdwr0.png","Max Verstappen",1,"Holanda","1997-09-30","Hasselt, B??lgica",0,0,0,0,0,0,0,2);
call insert_pilotos("https://i.imgur.com/CWcMCaQ.png","Lance Stroll",18,"Canada","1998-10-29","Montreal, Canad??",0,0,0,0,0,0,0,9);
call insert_pilotos("https://i.imgur.com/NSItlMS.png","Sebastian Vettel",5,"Alemania","1987-04-03","Heppenheim, Alemania",0,0,0,0,0,0,0,9);
call insert_pilotos("https://i.imgur.com/vXvbTLU.png","Carlos Sainz",55,"Espa??a","1994-09-01","Madrid, Espa??a",0,0,0,0,0,0,0,1);
call insert_pilotos("https://i.imgur.com/3JRScEX.png","Charles Leclerc",16,"M??naco","1997-10-16","Montecarlo, M??naco",0,0,0,0,0,0,0,1);
call insert_pilotos("https://i.imgur.com/MGWnY6P.png","Yuki Tsunoda",22,"Jap??n","2000-05-11","Sagamihara, Jap??n",0,0,0,0,0,0,0,8);
call insert_pilotos("https://i.imgur.com/nnCIa8b.png","Pierre Gasly",10,"Francia","1996-02-07","Rouen, Francia",0,0,0,0,0,0,0,8);
call insert_pilotos("https://i.imgur.com/T5U0cN3.png","Nicholas Latifi",6,"Canad??","1995-06-29","Montreal, Canad??",0,0,0,0,0,0,0,10);
call insert_pilotos("https://i.imgur.com/2HoIDUy.png","Alexander Albon",23,"Tailandia","1996-03-23","Londres, Inglaterra",0,0,0,0,0,0,0,10);

select pilotos.nombre, equipos.nombre from pilotos inner join equipos where pilotos.id_equipo = equipos.id_equipo;
select* from pilotos;
-- ------------------------------------------------------------

create table circuitos(
	id_circuito int primary key auto_increment,
    imagen varchar(100),
    nombre varchar(30),
    pais varchar(30),
    longitud varchar(30),
    vueltas int,
    distancia_total varchar(30),
    record_vuelta varchar(30),
    constraint ck_vueltas_circuitos check (vueltas >= 0)
)Engine = innodb;

DELIMITER $$
create procedure insert_circuito(IN imagen varchar(100),IN nombre varchar(30), IN pais varchar(30), IN longitud varchar(30),IN vueltas int,IN distancia_total varchar(30),IN record_vuelta varchar(30))
begin
	insert into circuitos(imagen,nombre,pais,longitud,vueltas,distancia_total,record_vuelta) values(imagen,nombre,pais,longitud,vueltas,distancia_total,record_vuelta);
end $$
DELIMITER ;

call insert_circuito("https://i.imgur.com/uH3y19W.png","Sakhir","Bahr??in","5.412 km",57,"308.484 km","1:31.447");
call insert_circuito("https://i.imgur.com/c59OnfE.png","Jeddah","Arabia Saud??","6.174 km",50,"308.700 km","1:30.734");
call insert_circuito("https://i.imgur.com/dgmaTX1.png","Melbourne","Australia","5.303 km",58,"307.574 km","1:24.125");
call insert_circuito("https://i.imgur.com/aAAvTrj.png","Imola","Italia","4.909 km",63,"309.267 km","1:15.484");
call insert_circuito("https://i.imgur.com/IBPjEYA.png","Miami","Estados Unidos","5.41 km",57,"308.370 km","1:31.361");
call insert_circuito("https://i.imgur.com/M24gRah.png","Barcelona","Espa??a","4.675 km",66,"308.550 km","1:18:149");
call insert_circuito("https://i.imgur.com/64GwK4V.png","Montecarlo","M??naco","3.337 km",78,"260.286 km","1.12:909");
call insert_circuito("https://i.imgur.com/ZlxxIL9.png","Bak??","Azerbaiy??n","6.003 km",51,"306.153 km","1:43.009");
call insert_circuito("https://i.imgur.com/5LM1LTB.png","Montreal","Canad??","4.361 km",70,"305.270 km","1:13.078");
call insert_circuito("https://i.imgur.com/DVf5Q0G.png","Silverstone","Reino Unido","5.891 km",52,"306.332 km","1:27.097");
call insert_circuito("https://i.imgur.com/vIFzljO.png","Spielberg","Austria","4.318 km",71,"306.578 km","1:05.619");
call insert_circuito("https://i.imgur.com/E9iez2x.png","Le Castellet","Francia","5.842 km",53,"309.626 km","1:32.740");
call insert_circuito("https://i.imgur.com/kNk8ihA.png","Budapest","Hungr??a","4.381 km",70,"306.670 km","1:16.627");
call insert_circuito("https://i.imgur.com/9JVJomH.png","Spa Francorchamps","B??lgica","7.004 km",44 ,"308.176 km","1:46.286");
call insert_circuito("https://i.imgur.com/AkYGRKx.png","Zandvoort","Pa??ses Bajos","4.259 km",72,"306.648 km","1:11.097");
call insert_circuito("https://i.imgur.com/hn62omV.png","Monza","Italia","5.793 km",53,"307.029 km","1:21.046");
call insert_circuito("https://i.imgur.com/HnvImWI.png","Singapur","Singapur","5.063 km",61,"308.843 km","1:41.905");
call insert_circuito("https://i.imgur.com/0pX5ymz.png","Suzuka","Jap??n","5.807 km",53,"307.771 km","1:30.983");
call insert_circuito("https://i.imgur.com/tymvfpZ.png","Austin","Estados Unidos","5.513 km",56,"308.728 km","1:36.169");
call insert_circuito("https://i.imgur.com/q1Rz4tG.png","Hermanos Rodr??guez","M??xico","4.304 km",71,"305.584 km","1:17.774");
call insert_circuito("https://i.imgur.com/arefJiZ.png","S??o Paulo","Brasil","4.309 km",71,"305.939 km","1:10.540");
call insert_circuito("https://i.imgur.com/FjVejw6.png","Abu Dabi","Emiratos ??rabes","5.281 km",58,"306.298 km","1:26.103");

select * from circuitos;

-- ---------------------------------------------------------------
create table carreras(
	id_carrera int primary key auto_increment,
    id_circuito int,
    piloto_vuelta_rapida int,
    constraint fk_idCircuito foreign key (id_circuito) references circuitos(id_circuito) on delete cascade on update cascade
)Engine = innodb;

DELIMITER $$
create procedure insert_carrera(IN id_circuito int,IN piloto_vuelta_rapida int)
begin
	insert into carreras(id_circuito,piloto_vuelta_rapida) values (id_circuito,piloto_vuelta_rapida);
end $$
DELIMITER ;

select * from carreras;

-- ---------------------------------------------------------------

create table posiciones(
	id_posiciones int primary key auto_increment,
    id_carreras int,
    p1 int, p2 int, p3 int, p4 int, p5 int, p6 int, p7 int, p8 int, p9 int, p10 int,
    p11 int, p12 int, p13 int, p14 int, p15 int, p16 int, p17 int, p18 int, p19 int, p20 int,
    vuelta_rapida varchar(30),
    constraint fk_p1 foreign key (p1) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p2 foreign key (p2) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p3 foreign key (p3) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p4 foreign key (p4) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p5 foreign key (p5) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p6 foreign key (p6) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p7 foreign key (p7) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p8 foreign key (p8) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p9 foreign key (p9) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p10 foreign key (p10) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p11 foreign key (p11) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p12 foreign key (p12) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p13 foreign key (p13) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p14 foreign key (p14) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p15 foreign key (p15) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p16 foreign key (p16) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p17 foreign key (p17) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p18 foreign key (p18) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p19 foreign key (p19) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint fk_p20 foreign key (p20) references pilotos(id_piloto) on delete cascade on update cascade
)Engine = innodb;

DELIMITER $$
create procedure insert_posiciones(IN id_circuito int, IN p1 int, IN p2 int, IN p3 int, IN p4 int, IN p5 int, IN p6 int, IN p7 int, IN p8 int, IN p9 int, IN p10 int,
    IN p11 int, IN p12 int, IN p13 int, IN p14 int, IN p15 int, IN p16 int, IN p17 int, IN p18 int, IN p19 int, IN p20 int,IN vuelta_rapida varchar(30))
begin
	declare _id_carrera int;
	call insert_carrera(id_circuito,round(1 + rand()*(19)));
    select id_carrera from carreras order by id_carrera desc limit 1 into _id_carrera;
	insert into posiciones(id_carreras,p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, vuelta_rapida) 
	values (_id_carrera,p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, vuelta_rapida);
end $$
DELIMITER ;
-- ------------------------------------------------
-- ----------------------------------------------
drop trigger if exists tg_insert_posiciones;
DELIMITER $$
create trigger tg_insert_posiciones
after insert on posiciones for each row
begin
	declare vuelta_rapida int;
    select piloto_vuelta_rapida from carreras where id_carrera = new.id_carreras into vuelta_rapida;
    update pilotos set vueltas_rapidas = vueltas_rapidas + 1  where id_piloto = vuelta_rapida;
	update pilotos set grandespremios = grandespremios + 1, victorias = victorias + 1, podios = podios + 1 ,puntos = puntos + 25 where id_piloto = new.p1;
    update pilotos set grandespremios = grandespremios + 1, podios = podios + 1, puntos = puntos + 18 where id_piloto = new.p2;
    update pilotos set grandespremios = grandespremios + 1, podios = podios + 1, puntos = puntos + 15 where id_piloto = new.p3;
    update pilotos set grandespremios = grandespremios + 1, puntos = puntos + 12 where id_piloto = new.p4;
    update pilotos set grandespremios = grandespremios + 1, puntos = puntos + 10 where id_piloto = new.p5;
    update pilotos set grandespremios = grandespremios + 1, puntos = puntos + 8 where id_piloto = new.p6;
    update pilotos set grandespremios = grandespremios + 1, puntos = puntos + 6 where id_piloto = new.p7;
    update pilotos set grandespremios = grandespremios + 1, puntos = puntos + 4 where id_piloto = new.p8;
    update pilotos set grandespremios = grandespremios + 1, puntos = puntos + 2 where id_piloto = new.p9;
    update pilotos set grandespremios = grandespremios + 1, puntos = puntos + 1 where id_piloto = new.p10;
end $$
DELIMITER ;
-- ----------------------------------------------------

drop function if exists obtener_Campeon_pilotos;
DELIMITER $$
create function obtener_Campeon_pilotos()
returns int
begin
	declare id_campeon int;
    select id_piloto from pilotos where puntos = (select max(puntos) from pilotos) into id_campeon;
    return id_campeon;
end $$
DELIMITER ;


-- ---------------------------------------------------
drop function if exists obtener_Campeon_equipos;
DELIMITER $$
create function obtener_Campeon_equipos()
returns int
begin
	declare id_campeon int;
    select id_equipo from equipos where puntos = (select max(puntos) from equipos) into id_campeon;
    return id_campeon;
end $$
DELIMITER ;

-- ---------------------------------------------------
-- ----------------------------------------------------
-- ----------------------------------------------------

drop function if exists obtener_piloto_mas_campeonatos;
DELIMITER $$
create function obtener_piloto_mas_campeonatos()
returns int
begin
	declare id_campeon int;
    select id_piloto from pilotos where campeonatos = (select max(campeonatos) from pilotos) into id_campeon;
    return id_campeon;
end $$
DELIMITER ;

-- ----------------------------------------------------

drop trigger if exists tg_insert_equipos;
DELIMITER $$
create trigger tg_insert_equipos
after insert on posiciones for each row
begin
	update equipos set puntos = puntos + 25 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p1);
	update equipos set puntos = puntos + 18 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p2);
	update equipos set puntos = puntos + 15 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p3);
	update equipos set puntos = puntos + 12 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p4);
	update equipos set puntos = puntos + 10 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p5);
	update equipos set puntos = puntos + 8 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p6);
	update equipos set puntos = puntos + 6 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p7);
	update equipos set puntos = puntos + 4 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p8);
	update equipos set puntos = puntos + 2 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p9);
	update equipos set puntos = puntos + 1 where id_equipo = (select id_equipo from pilotos where id_piloto = new.p10);
end $$
DELIMITER ;
-- ----------------------------------------------------
-- ----------------------------------------------------
call insert_posiciones(1,9,1,8,2,7,3,6,4,5,10,11,12,13,14,15,16,17,18,19,20,"1:25.234");
call insert_posiciones(2,10,20,9,19,8,18,7,17,16,6,15,5,13,14,4,3,12,2,11,1,"1:15.534");
call insert_posiciones(3,9,1,8,2,7,3,6,4,5,10,11,12,13,14,15,16,17,18,19,20,"1:25.234");
call insert_posiciones(4,11,20,9,19,8,18,7,17,16,6,15,5,13,14,4,3,12,2,10,1,"1:15.534");
call insert_posiciones(5,12,1,8,2,7,3,6,4,5,10,11,9,13,14,15,16,17,18,19,20,"1:25.234");
call insert_posiciones(6,9,20,9,19,8,18,7,17,16,10,15,5,13,14,4,3,12,2,11,1,"1:15.534");


select * from posiciones;


drop view if exists resultados_carrera ;
create view resultados_carrera as select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,25 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p1 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,18 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p2 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,15 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p3 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,12 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p4 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,10 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p5 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,8 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p6 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,6 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p7 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,4 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p8 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,2 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p9 = id_piloto
	union all
	select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,1 as 'puntos' from posiciones inner join pilotos where id_posiciones = 1 and p10 = id_piloto and id_carreras = 2;
    
-- --------------------------------------------------------------------------------------------------------

select circuitos.nombre as 'circuito',pilotos.nombre,equipos.nombre as 'equipo',case
when pilotos.id_piloto = posiciones.p1 then 25 
when pilotos.id_piloto = posiciones.p2 then 18 
when pilotos.id_piloto = posiciones.p3 then 15 
when pilotos.id_piloto = posiciones.p4 then 12 
when pilotos.id_piloto = posiciones.p5 then 10 
when pilotos.id_piloto = posiciones.p6 then 8 
when pilotos.id_piloto = posiciones.p7 then 6 
when pilotos.id_piloto = posiciones.p8 then 4 
when pilotos.id_piloto = posiciones.p9 then 2 
when pilotos.id_piloto = posiciones.p10 then 1 
else 0 
end as 'puntos'
from posiciones 
inner join carreras on carreras.id_carrera = posiciones.id_carreras
inner join circuitos on circuitos.id_circuito = carreras.id_circuito
inner join pilotos on pilotos.id_piloto = 8
inner join equipos on pilotos.id_equipo = equipos.id_equipo;
    
-- --------------------------------------------------------------------------

select circuitos.nombre as 'circuito',pilotos.nombre,equipos.nombre as 'equipo',case
when pilotos.id_piloto = posiciones.p1 then 25 
when pilotos.id_piloto = posiciones.p2 then 18 
when pilotos.id_piloto = posiciones.p3 then 15 
when pilotos.id_piloto = posiciones.p4 then 12 
when pilotos.id_piloto = posiciones.p5 then 10 
when pilotos.id_piloto = posiciones.p6 then 8 
when pilotos.id_piloto = posiciones.p7 then 6 
when pilotos.id_piloto = posiciones.p8 then 4 
when pilotos.id_piloto = posiciones.p9 then 2 
when pilotos.id_piloto = posiciones.p10 then 1 
else 0 
end as 'puntos'
from posiciones 
inner join carreras on carreras.id_carrera = posiciones.id_carreras
inner join circuitos on circuitos.id_circuito = carreras.id_circuito
inner join pilotos on pilotos.nombre = 'Guanyu Zhou'
inner join equipos on pilotos.id_equipo = equipos.id_equipo;


-- ------------------------------------------------------------------

select circuitos.nombre as 'circuito',equipos.nombre,equipos.chasis_actual as 'equipo',case
when pilotos.id_piloto = posiciones.p1 then 25 
when pilotos.id_piloto = posiciones.p2 then 18 
when pilotos.id_piloto = posiciones.p3 then 15 
when pilotos.id_piloto = posiciones.p4 then 12 
when pilotos.id_piloto = posiciones.p5 then 10 
when pilotos.id_piloto = posiciones.p6 then 8 
when pilotos.id_piloto = posiciones.p7 then 6 
when pilotos.id_piloto = posiciones.p8 then 4 
when pilotos.id_piloto = posiciones.p9 then 2 
when pilotos.id_piloto = posiciones.p10 then 1 
else 0 
end as 'puntos'
from posiciones 
inner join carreras on carreras.id_carrera = posiciones.id_carreras
inner join circuitos on circuitos.id_circuito = carreras.id_circuito
inner join pilotos on pilotos.id_equipo = 7
inner join equipos on pilotos.id_equipo = equipos.id_equipo group by circuitos.nombre;


-- ----------------------------------------------------------------------
    
SELECT * FROM pilotos WHERE nombre = "Guanyu Zhou";

select * from resultados_carrera;

select * from equipos order by puntos desc;

select * from pilotos order by puntos desc