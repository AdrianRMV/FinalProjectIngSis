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
	insert into equipos(email,pass)values(email,pass);
end $$
DELIMITER ;

-- ---------------------------------------------
create table equipos(
	id_equipo int primary key auto_increment,
    imagen varchar(30),
    nombre varchar(30),
    pais varchar(30),
    director_deportivo varchar(30),
    jefe_tecnico varchar(30),
    chasis_actual varchar(30),
    motor varchar(30),
    debut int,
    campeonatos int,
    puntos int default 0,
    constraint ck_campeonatos_equipos check (campeonatos >= 0)
)Engine = innodb;

DELIMITER $$
create procedure insert_equipos(
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
	insert into equipos(nombre,pais,director_deportivo,jefe_tecnico,chasis_actual,motor,debut,campeonatos)values(nombre,pais,director_deportivo,jefe_tecnico,chasis_actual,motor,debut,campeonatos);
end $$
DELIMITER ;

call insert_equipos("FERRARI","Maranello, Italia","Mattia Binotto","Enrico Cardile / Enrico Gualtieri","F1-75","Ferrari",1950,16);
call insert_equipos("RED BULL","Milton Keynes, Reino Unido","Christian Horner","Pierre Waché","RB18","Red Bull Powertrains",1997,4);
call insert_equipos("MERCEDES","Brackley, Reino Unido","Toto Wolff","Mike Elliott","W13","Mercedes",1970,8);
call insert_equipos("MCLAREN","Woking, Reino Unido","Andreas Seidl","James Key","MCL36","Mercedes",1966,8);
call insert_equipos("ALFA ROMEO","Hinwil, Suiza","Frédéric Vasseur","Jan Monchaux","C42","Ferrari",1993,0);
call insert_equipos("HAAS","Kannapolis, Estados Unidos","Guenther Steiner","Simone Resta","VF-22","Ferrari",2016,0);
call insert_equipos("ALPINE","Enstone, Reino Unido","Otmar Szafnauer","Pat Fry","A522","Renault",1986,2);
call insert_equipos("ALPHATAURI","Faenza, Italia","Franz Tost","Jody Egginton","AT03","Red Bull Powertrains",1985,0);
call insert_equipos("ASTON MARTIN","Silverstone, Reino Unido","Mike Krack","Andrew Green","AMR22","Mercedes",2018,0);
call insert_equipos("WILLIAMS","Grove, Reino Unido","Jost Capito","François-Xavier Demaison","FW44","Mercedes",1978,9);
select * from equipos order by campeonatos;

-- ------------------------------------------------------------

create table pilotos(
	id_piloto int primary key auto_increment,
    imagen varchar(30),
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
	insert into pilotos(nombre,numero,nacionalidad,nacimiento,locacion_nacimiento,campeonatos,grandespremios,victorias,podios,puntos,poles,vueltas_rapidas,id_equipo)values(nombre,numero,nacionalidad,nacimiento,locacion_nacimiento,campeonatos,grandespremios,victorias,podios,puntos,poles,vueltas_rapidas,id_equipo);
end $$
DELIMITER ;

call insert_pilotos("Lewis Hamilton",44,"Reino Unido","1985-01-07","Stevenage, Reino Unido",0,0,0,0,0,0,0,3);
call insert_pilotos("George Russell",63,"Reino Unido","1998-02-15","King's Lynn, Reino Unido",0,0,0,0,0,0,0,3);
call insert_pilotos("Fernando Alonso",14,"España","1981-07-29","Oviedo, España",0,0,0,0,0,0,0,7);
call insert_pilotos("Esteban Ocon",31,"Francia","1996-09-17","Évreux, Normandía, Francia",0,0,0,0,0,0,0,7);
call insert_pilotos("Mick Schumacher",47,"Alemania","1999-03-22","Vufflens-le-Château, Suiza",0,0,0,0,0,0,0,6);
call insert_pilotos("Kevin Magnussen",20,"Dinamarca","1992-10-05","Roskilde, Dinamarca",0,0,0,0,0,0,0,6);
call insert_pilotos("Lando Norris",4,"Reino Unido","1999-11-13","Bristol, Reino Unido",0,0,0,0,0,0,0,4);
call insert_pilotos("Daniel Ricciardo",3,"Australia","1989-07-01","Perth, Australia",0,0,0,0,0,0,0,4);
call insert_pilotos("Guanyu Zhou",24,"China","1999-05-30","Shanghai, China",0,0,0,0,0,0,0,5);
call insert_pilotos("Valtteri Bottas",77,"Finlandia","1989-08-28","Nastola, Finlandia",0,0,0,0,0,0,0,5);
call insert_pilotos("Sergio Pérez",11,"México","1990-01-26","Guadalajara, México",0,0,0,0,0,0,0,2);
call insert_pilotos("Max Verstappen",1,"Holanda","1997-09-30","Hasselt, Bélgica",0,0,0,0,0,0,0,2);
call insert_pilotos("Lance Stroll",18,"Canada","1998-10-29","Montreal, Canadá",0,0,0,0,0,0,0,9);
call insert_pilotos("Sebastian Vettel",5,"Alemania","1987-04-03","Heppenheim, Alemania",0,0,0,0,0,0,0,9);
call insert_pilotos("Carlos Sainz",55,"España","1994-09-01","Madrid, España",0,0,0,0,0,0,0,1);
call insert_pilotos("Charles Leclerc",16,"Mónaco","1997-10-16","Montecarlo, Mónaco",0,0,0,0,0,0,0,1);
call insert_pilotos("Yuki Tsunoda",22,"Japón","2000-05-11","Sagamihara, Japón",0,0,0,0,0,0,0,8);
call insert_pilotos("Pierre Gasly",10,"Francia","1996-02-07","Rouen, Francia",0,0,0,0,0,0,0,8);
call insert_pilotos("Nicholas Latifi",6,"Canadá","1995-06-29","Montreal, Canadá",0,0,0,0,0,0,0,10);
call insert_pilotos("Alexander Albon",23,"Tailandia","1996-03-23","Londres, Inglaterra",0,0,0,0,0,0,0,10);

select pilotos.nombre, equipos.nombre from pilotos inner join equipos where pilotos.id_equipo = equipos.id_equipo;
select* from pilotos;
-- ------------------------------------------------------------

create table circuitos(
	id_circuito int primary key auto_increment,
    imagen varchar(30),
    nombre varchar(30),
    pais varchar(30),
    longitud varchar(30),
    vueltas int,
    distancia_total varchar(30),
    record_vuelta varchar(30),
    constraint ck_vueltas_circuitos check (vueltas >= 0)
)Engine = innodb;

DELIMITER $$
create procedure insert_circuito(IN nombre varchar(30), IN pais varchar(30), IN longitud varchar(30),IN vueltas int,IN distancia_total varchar(30),IN record_vuelta varchar(30))
begin
	insert into circuitos(nombre,pais,longitud,vueltas,distancia_total,record_vuelta) values(nombre,pais,longitud,vueltas,distancia_total,record_vuelta);
end $$
DELIMITER ;

call insert_circuito("Sakhir","Bahréin","5.412 km",57,"308.484 km","1:31.447");
call insert_circuito("Jeddah","Arabia Saudí","6.174 km",50,"308.700 km","1:30.734");
call insert_circuito("Melbourne","Australia","5.303 km",58,"307.574 km","1:24.125");
call insert_circuito("Imola","Italia","4.909 km",63,"309.267 km","1:15.484");
call insert_circuito("Miami","Estados Unidos","5.41 km",57,"308.370 km","1:31.361");
call insert_circuito("Barcelona","España","4.675 km",66,"308.550 km","1:18:149");
call insert_circuito("Montecarlo","Mónaco","3.337 km",78,"260.286 km","1.12:909");
call insert_circuito("Bakú","Azerbaiyán","6.003 km",51,"306.153 km","1:43.009");
call insert_circuito("Montreal","Canadá","4.361 km",70,"305.270 km","1:13.078");
call insert_circuito("Silverstone","Reino Unido","5.891 km",52,"306.332 km","1:27.097");
call insert_circuito("Spielberg","Austria","4.318 km",71,"306.578 km","1:05.619");
call insert_circuito("Le Castellet","Francia","5.842 km",53,"309.626 km","1:32.740");
call insert_circuito("Budapest","Hungría","4.381 km",70,"306.670 km","1:16.627");
call insert_circuito("Spa","Bélgica","7.004 km",44 ,"308.176 km","1:46.286");
call insert_circuito("Zandvoort","Países Bajos","4.259 km",72,"306.648 km","1:11.097");
call insert_circuito("Monza","Italia","5.793 km",53,"307.029 km","1:21.046");
call insert_circuito("Singapur","Singapur","5.063 km",61,"308.843 km","1:41.905");
call insert_circuito("Suzuka","Japón","5.807 km",53,"307.771 km","1:30.983");
call insert_circuito("Austin","Estados Unidos","5.513 km",56,"308.728 km","1:36.169");
call insert_circuito("Hermanos Rodríguez","México","4.304 km",71,"305.584 km","1:17.774");
call insert_circuito("São Paulo","Brasil","4.309 km",71,"305.939 km","1:10.540");
call insert_circuito("Abu Dabi","Emiratos Árabes","5.281 km",58,"306.298 km","1:26.103");

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
    constraint fk_p20 foreign key (p20) references pilotos(id_piloto) on delete cascade on update cascade,
    constraint ck_p1_posiciones check (p1 > 0),
    constraint ck_p2_posiciones check (p2 > 0),
    constraint ck_p3_posiciones check (p3 > 0),
    constraint ck_p4_posiciones check (p4 > 0),
    constraint ck_p5_posiciones check (p5 > 0),
    constraint ck_p6_posiciones check (p6 > 0),
    constraint ck_p7_posiciones check (p7 > 0),
    constraint ck_p8_posiciones check (p8 > 0),
    constraint ck_p9_posiciones check (p9 > 0),
    constraint ck_p10_posiciones check (p10 > 0),
    constraint ck_p11_posiciones check (p11 > 0),
    constraint ck_p12_posiciones check (p12 > 0),
    constraint ck_p13_posiciones check (p13 > 0),
    constraint ck_p14_posiciones check (p14 > 0),
    constraint ck_p15_posiciones check (p15 > 0),
    constraint ck_p16_posiciones check (p16 > 0),
    constraint ck_p17_posiciones check (p17 > 0),
    constraint ck_p18_posiciones check (p18 > 0),
    constraint ck_p19_posiciones check (p19 > 0),
    constraint ck_p20_posiciones check (p20 > 0)
)Engine = innodb;

DELIMITER $$
create procedure insert_posiciones(IN id_carrera int,IN id_circuito int, IN p1 int, IN p2 int, IN p3 int, IN p4 int, IN p5 int, IN p6 int, IN p7 int, IN p8 int, IN p9 int, IN p10 int,
    IN p11 int, IN p12 int, IN p13 int, IN p14 int, IN p15 int, IN p16 int, IN p17 int, IN p18 int, IN p19 int, IN p20 int,IN vuelta_rapida varchar(30))
begin
	call insert_carrera(id_circuito,round(1 + rand()*(19)));
	insert into posiciones(id_carreras, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, vuelta_rapida) 
	values (id_carrera, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, vuelta_rapida);
end $$
DELIMITER ;

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
call insert_posiciones(1,1,9,1,8,2,7,3,6,4,5,10,11,12,13,14,15,16,17,18,19,20,"1:25.234");

select pilotos.numero,pilotos.nombre,pilotos.nacionalidad from posiciones inner join pilotos;

select * from equipos order by puntos desc;

select * from pilotos order by puntos desc;
