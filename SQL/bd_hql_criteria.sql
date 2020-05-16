-- remoção dos dados
delete from tb_disciplina_aluno;
delete from tb_aluno;
delete from tb_disciplina;
delete from tb_professor;
delete from tb_sala;

-- listar as sequences
SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';

-- deleção das sequences
drop sequence if exists tb_aluno_aluno_id_seq cascade;
drop sequence if exists tb_disciplina_disc_id_seq cascade;
drop sequence if exists tb_professor_prof_id_seq cascade;
drop sequence if exists tb_sala_sala_id_seq cascade;

-- deleção das tabelas
drop table if exists tb_disciplina_aluno cascade;
drop table if exists tb_aluno cascade;
drop table if exists tb_disciplina cascade;
drop table if exists tb_professor cascade;
drop table if exists tb_sala cascade;


-- criação das tabelas
create table tb_professor (
   prof_id serial primary key,
   prof_cpf character varying(11) not null,
   prof_nm character varying(50) not null,
   prof_salario numeric(10,2) not null,
   prof_dt date not null
);

create table tb_sala (
   sala_id serial primary key,
   sala_nr integer not null,
   sala_ar boolean not null
);

create table tb_disciplina (
    disc_id serial primary key,
    disc_cod character varying(5) not null,
    disc_nm character varying(50) not null,
    disc_carga integer not null
);

create table tb_aluno (
    aluno_id serial primary key,
    aluno_cpf character varying(11) not null,
    aluno_nm character varying(50) not null
);

create table tb_disciplina_aluno (
    disc_id integer references tb_disciplina(disc_id),
    aluno_id integer references tb_aluno(aluno_id)
);
 
alter table tb_professor add sala_id integer null REFERENCES tb_sala(sala_id);

alter table tb_disciplina add prof_id integer not null REFERENCES tb_professor(prof_id);

-- Inserção de dados na tabela tb_sala
insert into tb_sala (sala_nr, sala_ar)
values (200, true);
insert into tb_sala (sala_nr, sala_ar)
values (201, false);
insert into tb_sala (sala_nr, sala_ar)
values (202, true);
insert into tb_sala (sala_nr, sala_ar)
values (203, false);
insert into tb_sala (sala_nr, sala_ar)
values (204, true);
insert into tb_sala (sala_nr, sala_ar)
values (205, false);
insert into tb_sala (sala_nr, sala_ar)
values (206, false);

-- Inserção de dados na tabela tb_professor
insert into tb_professor (prof_cpf, prof_nm, prof_salario, prof_dt, sala_id)
values ('11111111111', 'João', 500.00, to_date('01/01/2009', 'DD/MM/YYYY'), 1);
insert into tb_professor (prof_cpf, prof_nm, prof_salario, prof_dt, sala_id)
values ('22222222222', 'Maria', 800.00, to_date('02/02/2009', 'DD/MM/YYYY'), 2);
insert into tb_professor (prof_cpf, prof_nm, prof_salario, prof_dt, sala_id)
values ('33333333333', 'José', 1000.00, to_date('03/03/2009', 'DD/MM/YYYY'), 3);
insert into tb_professor (prof_cpf, prof_nm, prof_salario, prof_dt, sala_id)
values ('44444444444', 'Pedro', 1500.00, to_date('04/04/2009', 'DD/MM/YYYY'), 4);
insert into tb_professor (prof_cpf, prof_nm, prof_salario, prof_dt, sala_id)
values ('55555555555', 'Paulo', 2000.00, to_date('05/05/2009', 'DD/MM/YYYY'), 5);
insert into tb_professor (prof_cpf, prof_nm, prof_salario, prof_dt, sala_id)
values ('66666666666', 'Gabriel', 300.00, to_date('06/06/2009', 'DD/MM/YYYY'), 6);
insert into tb_professor (prof_cpf, prof_nm, prof_salario, prof_dt, sala_id)
values ('77777777777', 'Antonio', 2500.00, to_date('10/10/2009', 'DD/MM/YYYY'), 7);
insert into tb_professor (prof_cpf, prof_nm, prof_salario, prof_dt, sala_id)
values ('88888888888', 'Jair', 650.00, to_date('11/11/2009', 'DD/MM/YYYY'), NULL);


-- Inserção de dados na tabela tb_disciplina
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('JAV01', 'Linguagem Java I', 60, 1);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('JAV02', 'Linguagem Java II', 40, 2);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('JAV03', 'Linguagem Java III', 80, 3);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('JAV04', 'Linguagem Java IV', 40, 4);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('JAV05', 'Linguagem Java V', 60, 5);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('JAV06', 'Linguagem Java VI', 20, 6);

insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('PHP01', 'Linguagem PHP I', 30, 1);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('PHP02', 'Linguagem PHP II', 20, 2);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('PHP03', 'Linguagem PHP III', 40, 3);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('PHP04', 'Linguagem PHP IV', 20, 4);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('PHP05', 'Linguagem PHP V', 30, 5);
insert into tb_disciplina (disc_cod, disc_nm, disc_carga, prof_id)
values ('PHP06', 'Linguagem PHP VI', 10, 6);


-- Inserção de dados na tabela tb_aluno
insert into tb_aluno (aluno_cpf, aluno_nm) values('42401630139', 'Odette');
insert into tb_aluno (aluno_cpf, aluno_nm) values('41483700593', 'Abrahão');
insert into tb_aluno (aluno_cpf, aluno_nm) values('78056471600', 'Fabiano');
insert into tb_aluno (aluno_cpf, aluno_nm) values('84530717640', 'Paloma');
insert into tb_aluno (aluno_cpf, aluno_nm) values('62430554186', 'Nailah');
insert into tb_aluno (aluno_cpf, aluno_nm) values('82160508870', 'Tábata');
insert into tb_aluno (aluno_cpf, aluno_nm) values('20857384350', 'Waldemir');
insert into tb_aluno (aluno_cpf, aluno_nm) values('60074770454', 'Mafalda');
insert into tb_aluno (aluno_cpf, aluno_nm) values('11234460327', 'Lana');
insert into tb_aluno (aluno_cpf, aluno_nm) values('26171548235', 'Jacó');
insert into tb_aluno (aluno_cpf, aluno_nm) values('77351624488', 'Adalberto');
insert into tb_aluno (aluno_cpf, aluno_nm) values('53670585745', 'Rajesh');
insert into tb_aluno (aluno_cpf, aluno_nm) values('31373167580', 'Karine');
insert into tb_aluno (aluno_cpf, aluno_nm) values('34314351306', 'Laerte');
insert into tb_aluno (aluno_cpf, aluno_nm) values('67454563112', 'Tadeu');
insert into tb_aluno (aluno_cpf, aluno_nm) values('11620784564', 'Quitéria');
insert into tb_aluno (aluno_cpf, aluno_nm) values('81802817522', 'George');
insert into tb_aluno (aluno_cpf, aluno_nm) values('58871525167', 'Kaio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('50106536800', 'Halima');
insert into tb_aluno (aluno_cpf, aluno_nm) values('68506543304', 'Waldo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('48522504563', 'Cacilda');
insert into tb_aluno (aluno_cpf, aluno_nm) values('65010731894', 'Rafaella');
insert into tb_aluno (aluno_cpf, aluno_nm) values('16660383000', 'Jacqueline');
insert into tb_aluno (aluno_cpf, aluno_nm) values('17362545886', 'Adalgisa');
insert into tb_aluno (aluno_cpf, aluno_nm) values('63457214255', 'Idalina');
insert into tb_aluno (aluno_cpf, aluno_nm) values('76850426060', 'Nádia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('77014136690', 'Hector');
insert into tb_aluno (aluno_cpf, aluno_nm) values('54162114820', 'Gabriela');
insert into tb_aluno (aluno_cpf, aluno_nm) values('18234422260', 'Abraão');
insert into tb_aluno (aluno_cpf, aluno_nm) values('07500245424', 'Urbano');
insert into tb_aluno (aluno_cpf, aluno_nm) values('14858267563', 'Barbie');
insert into tb_aluno (aluno_cpf, aluno_nm) values('60428337589', 'Raimundo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('28618415839', 'Jacira');
insert into tb_aluno (aluno_cpf, aluno_nm) values('21177536471', 'Maiara');
insert into tb_aluno (aluno_cpf, aluno_nm) values('67185124514', 'Ganesh');
insert into tb_aluno (aluno_cpf, aluno_nm) values('75172606181', 'Sabrina');
insert into tb_aluno (aluno_cpf, aluno_nm) values('27501471070', 'Sacha');
insert into tb_aluno (aluno_cpf, aluno_nm) values('60238644731', 'Valentina');
insert into tb_aluno (aluno_cpf, aluno_nm) values('40434141704', 'Olímpio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('45530567045', 'Haidê');
insert into tb_aluno (aluno_cpf, aluno_nm) values('11615802711', 'Naomi');
insert into tb_aluno (aluno_cpf, aluno_nm) values('73602226301', 'Edmundo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('08500321644', 'Valdir');
insert into tb_aluno (aluno_cpf, aluno_nm) values('63307647008', 'Larissa');
insert into tb_aluno (aluno_cpf, aluno_nm) values('70225760258', 'Jacy');
insert into tb_aluno (aluno_cpf, aluno_nm) values('30121172708', 'Genji');
insert into tb_aluno (aluno_cpf, aluno_nm) values('70670384801', 'Naila');
insert into tb_aluno (aluno_cpf, aluno_nm) values('60337664404', 'Iemanjá');
insert into tb_aluno (aluno_cpf, aluno_nm) values('37223341440', 'Raísa');
insert into tb_aluno (aluno_cpf, aluno_nm) values('54383825494', 'Nadir');
insert into tb_aluno (aluno_cpf, aluno_nm) values('22007884445', 'Maíra');
insert into tb_aluno (aluno_cpf, aluno_nm) values('36456208009', 'Waldyr');
insert into tb_aluno (aluno_cpf, aluno_nm) values('85064050410', 'Wallace');
insert into tb_aluno (aluno_cpf, aluno_nm) values('17106524700', 'Rani');
insert into tb_aluno (aluno_cpf, aluno_nm) values('62748500822', 'Raíssa');
insert into tb_aluno (aluno_cpf, aluno_nm) values('43821331577', 'Fábia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('42626387070', 'Abelardo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('43223658173', 'Odete');
insert into tb_aluno (aluno_cpf, aluno_nm) values('86441425858', 'Balbina');
insert into tb_aluno (aluno_cpf, aluno_nm) values('26585544196', 'Waldir');
insert into tb_aluno (aluno_cpf, aluno_nm) values('32355700044', 'Indra');
insert into tb_aluno (aluno_cpf, aluno_nm) values('82513868455', 'Ignácio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('51484302656', 'Gaetano');
insert into tb_aluno (aluno_cpf, aluno_nm) values('53118624752', 'Kaori');
insert into tb_aluno (aluno_cpf, aluno_nm) values('18845356159', 'Hadrián');
insert into tb_aluno (aluno_cpf, aluno_nm) values('77882503177', 'Valdemar');
insert into tb_aluno (aluno_cpf, aluno_nm) values('70546282334', 'Jaci');
insert into tb_aluno (aluno_cpf, aluno_nm) values('56760700058', 'Edite');
insert into tb_aluno (aluno_cpf, aluno_nm) values('50014304708', 'Fabíola');
insert into tb_aluno (aluno_cpf, aluno_nm) values('53181671444', 'Edgar');
insert into tb_aluno (aluno_cpf, aluno_nm) values('14665100721', 'Gabriele');
insert into tb_aluno (aluno_cpf, aluno_nm) values('82721213369', 'Dafne');
insert into tb_aluno (aluno_cpf, aluno_nm) values('60635082870', 'Camélia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('58342102106', 'Calixto');
insert into tb_aluno (aluno_cpf, aluno_nm) values('23535423015', 'Rafael');
insert into tb_aluno (aluno_cpf, aluno_nm) values('50271142065', 'Laércio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('76861838667', 'Safira');
insert into tb_aluno (aluno_cpf, aluno_nm) values('20515757462', 'Dália');
insert into tb_aluno (aluno_cpf, aluno_nm) values('37074867888', 'Baltazar');
insert into tb_aluno (aluno_cpf, aluno_nm) values('36116730485', 'Jade');
insert into tb_aluno (aluno_cpf, aluno_nm) values('01526151642', 'Magda');
insert into tb_aluno (aluno_cpf, aluno_nm) values('20327615648', 'Karen');
insert into tb_aluno (aluno_cpf, aluno_nm) values('67482722386', 'Nair');
insert into tb_aluno (aluno_cpf, aluno_nm) values('04156148300', 'Olímpia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('37875224179', 'Bartolomeu');
insert into tb_aluno (aluno_cpf, aluno_nm) values('31288077360', 'Fábio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('68543852617', 'Valdemir');
insert into tb_aluno (aluno_cpf, aluno_nm) values('18686027105', 'Rachel');
insert into tb_aluno (aluno_cpf, aluno_nm) values('60514185201', 'Salomé');
insert into tb_aluno (aluno_cpf, aluno_nm) values('83781664570', 'Ulisses');
insert into tb_aluno (aluno_cpf, aluno_nm) values('21758017724', 'Ada');
insert into tb_aluno (aluno_cpf, aluno_nm) values('64620858005', 'Ilsa');
insert into tb_aluno (aluno_cpf, aluno_nm) values('84748007494', 'Kalil');
insert into tb_aluno (aluno_cpf, aluno_nm) values('50882762656', 'Elaine');
insert into tb_aluno (aluno_cpf, aluno_nm) values('20322187397', 'Waldemiro');
insert into tb_aluno (aluno_cpf, aluno_nm) values('68856164434', 'Salim');
insert into tb_aluno (aluno_cpf, aluno_nm) values('07585553854', 'Larisa');
insert into tb_aluno (aluno_cpf, aluno_nm) values('88703174557', 'Eduardo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('88454437282', 'Najma');
insert into tb_aluno (aluno_cpf, aluno_nm) values('11315824620', 'Haideé');
insert into tb_aluno (aluno_cpf, aluno_nm) values('01358381003', 'Dagmar');
insert into tb_aluno (aluno_cpf, aluno_nm) values('77255688756', 'Tancredo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('51451423233', 'Pascoal');
insert into tb_aluno (aluno_cpf, aluno_nm) values('76043711320', 'Calista');
insert into tb_aluno (aluno_cpf, aluno_nm) values('65668378098', 'Nadine');
insert into tb_aluno (aluno_cpf, aluno_nm) values('73806161372', 'Daiane');
insert into tb_aluno (aluno_cpf, aluno_nm) values('63382135094', 'Octávia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('17584310087', 'Dalton');
insert into tb_aluno (aluno_cpf, aluno_nm) values('78761540692', 'Tamara');
insert into tb_aluno (aluno_cpf, aluno_nm) values('83487811537', 'Iara');
insert into tb_aluno (aluno_cpf, aluno_nm) values('10631275487', 'Karina');
insert into tb_aluno (aluno_cpf, aluno_nm) values('41172446806', 'Odila');
insert into tb_aluno (aluno_cpf, aluno_nm) values('07364316248', 'Ícaro');
insert into tb_aluno (aluno_cpf, aluno_nm) values('58132440420', 'Fabrizio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('84572401292', 'Fanny');
insert into tb_aluno (aluno_cpf, aluno_nm) values('26540836244', 'Dalila');
insert into tb_aluno (aluno_cpf, aluno_nm) values('81125873027', 'Heidi');
insert into tb_aluno (aluno_cpf, aluno_nm) values('77763344725', 'Bárbara');
insert into tb_aluno (aluno_cpf, aluno_nm) values('88040678021', 'Gabrielle');
insert into tb_aluno (aluno_cpf, aluno_nm) values('88053113249', 'Valentino');
insert into tb_aluno (aluno_cpf, aluno_nm) values('04401580605', 'Daisy');
insert into tb_aluno (aluno_cpf, aluno_nm) values('04888713014', 'Pamela');
insert into tb_aluno (aluno_cpf, aluno_nm) values('25381282770', 'Paola');
insert into tb_aluno (aluno_cpf, aluno_nm) values('12078146790', 'Dagmara');
insert into tb_aluno (aluno_cpf, aluno_nm) values('03415373819', 'Ugo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('20755740491', 'Olavo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('01564012662', 'Jaime');
insert into tb_aluno (aluno_cpf, aluno_nm) values('64666576398', 'Camellia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('21313867454', 'Tales');
insert into tb_aluno (aluno_cpf, aluno_nm) values('72061073468', 'Camile');
insert into tb_aluno (aluno_cpf, aluno_nm) values('64320627644', 'Abílio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('83763705708', 'Lara');
insert into tb_aluno (aluno_cpf, aluno_nm) values('17210615504', 'Magno');
insert into tb_aluno (aluno_cpf, aluno_nm) values('15707313656', 'Ubaldo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('00110163290', 'Nadya');
insert into tb_aluno (aluno_cpf, aluno_nm) values('23020256283', 'Walmir');
insert into tb_aluno (aluno_cpf, aluno_nm) values('51538031639', 'Olga');
insert into tb_aluno (aluno_cpf, aluno_nm) values('73275351281', 'Salma');
insert into tb_aluno (aluno_cpf, aluno_nm) values('51162010150', 'Ulrika');
insert into tb_aluno (aluno_cpf, aluno_nm) values('28565614115', 'Magdalena');
insert into tb_aluno (aluno_cpf, aluno_nm) values('32701851890', 'Beata');
insert into tb_aluno (aluno_cpf, aluno_nm) values('24006622821', 'Barbra');
insert into tb_aluno (aluno_cpf, aluno_nm) values('44747070877', 'Paolo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('26615041413', 'Xavier');
insert into tb_aluno (aluno_cpf, aluno_nm) values('33786747849', 'Ofélia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('44557485391', 'Jacob');
insert into tb_aluno (aluno_cpf, aluno_nm) values('52761635531', 'Lailah');
insert into tb_aluno (aluno_cpf, aluno_nm) values('65133233205', 'Laísa');
insert into tb_aluno (aluno_cpf, aluno_nm) values('15135745238', 'Abel');
insert into tb_aluno (aluno_cpf, aluno_nm) values('45880707385', 'Babette');
insert into tb_aluno (aluno_cpf, aluno_nm) values('47515275847', 'Salvador');
insert into tb_aluno (aluno_cpf, aluno_nm) values('43068586852', 'Hamilton');
insert into tb_aluno (aluno_cpf, aluno_nm) values('68015208572', 'Calixta');
insert into tb_aluno (aluno_cpf, aluno_nm) values('23674463776', 'Laila');
insert into tb_aluno (aluno_cpf, aluno_nm) values('25011332349', 'Valdo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('70432227296', 'Valentim');
insert into tb_aluno (aluno_cpf, aluno_nm) values('18172564830', 'Samanta');
insert into tb_aluno (aluno_cpf, aluno_nm) values('12305140070', 'Hannah');
insert into tb_aluno (aluno_cpf, aluno_nm) values('57270175489', 'Edith');
insert into tb_aluno (aluno_cpf, aluno_nm) values('28333165508', 'Ieda');
insert into tb_aluno (aluno_cpf, aluno_nm) values('27487242676', 'Gabriella');
insert into tb_aluno (aluno_cpf, aluno_nm) values('74725710830', 'Vagner');
insert into tb_aluno (aluno_cpf, aluno_nm) values('54038160629', 'Umberto');
insert into tb_aluno (aluno_cpf, aluno_nm) values('55001284007', 'Haydê');
insert into tb_aluno (aluno_cpf, aluno_nm) values('44587450189', 'Abrão');
insert into tb_aluno (aluno_cpf, aluno_nm) values('10654107009', 'Raj');
insert into tb_aluno (aluno_cpf, aluno_nm) values('31583736700', 'Nancy');
insert into tb_aluno (aluno_cpf, aluno_nm) values('60213805413', 'Jacyra');
insert into tb_aluno (aluno_cpf, aluno_nm) values('03174683327', 'Georgia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('50221571523', 'Pasqual');
insert into tb_aluno (aluno_cpf, aluno_nm) values('85561304372', 'Mabel');
insert into tb_aluno (aluno_cpf, aluno_nm) values('11024277305', 'Fabrícia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('88343322100', 'Kaila');
insert into tb_aluno (aluno_cpf, aluno_nm) values('74618883316', 'Kalila');
insert into tb_aluno (aluno_cpf, aluno_nm) values('23355562076', 'Talita');
insert into tb_aluno (aluno_cpf, aluno_nm) values('14451183863', 'Salomão');
insert into tb_aluno (aluno_cpf, aluno_nm) values('63632346461', 'Balraj');
insert into tb_aluno (aluno_cpf, aluno_nm) values('50851858708', 'Taciana');
insert into tb_aluno (aluno_cpf, aluno_nm) values('31404622551', 'Basílio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('65674726507', 'Úrsula');
insert into tb_aluno (aluno_cpf, aluno_nm) values('08382670415', 'Karim');
insert into tb_aluno (aluno_cpf, aluno_nm) values('41000542033', 'Úlrica');
insert into tb_aluno (aluno_cpf, aluno_nm) values('27287368714', 'Paco');
insert into tb_aluno (aluno_cpf, aluno_nm) values('66755482200', 'Quincas');
insert into tb_aluno (aluno_cpf, aluno_nm) values('21523554231', 'Cameron');
insert into tb_aluno (aluno_cpf, aluno_nm) values('63271343195', 'Édison');
insert into tb_aluno (aluno_cpf, aluno_nm) values('88020754091', 'Fabiana');
insert into tb_aluno (aluno_cpf, aluno_nm) values('02038266395', 'Laís');
insert into tb_aluno (aluno_cpf, aluno_nm) values('78756604831', 'Valdomiro');
insert into tb_aluno (aluno_cpf, aluno_nm) values('11181555728', 'Patrício');
insert into tb_aluno (aluno_cpf, aluno_nm) values('64603708505', 'Édson');
insert into tb_aluno (aluno_cpf, aluno_nm) values('22508665207', 'Wagner');
insert into tb_aluno (aluno_cpf, aluno_nm) values('22031645579', 'Dalva');
insert into tb_aluno (aluno_cpf, aluno_nm) values('03716448010', 'Igor');
insert into tb_aluno (aluno_cpf, aluno_nm) values('13855211558', 'Waldomiro');
insert into tb_aluno (aluno_cpf, aluno_nm) values('75302258048', 'Takashi');
insert into tb_aluno (aluno_cpf, aluno_nm) values('67864474144', 'Caio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('32884430741', 'Magali');
insert into tb_aluno (aluno_cpf, aluno_nm) values('80842188754', 'Patrícia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('32580124748', 'Pablo');
insert into tb_aluno (aluno_cpf, aluno_nm) values('20744300789', 'Edna');
insert into tb_aluno (aluno_cpf, aluno_nm) values('26186404110', 'Caetano');
insert into tb_aluno (aluno_cpf, aluno_nm) values('04846710491', 'Éder');
insert into tb_aluno (aluno_cpf, aluno_nm) values('36266602652', 'Fabrício');
insert into tb_aluno (aluno_cpf, aluno_nm) values('40068032811', 'Adão');
insert into tb_aluno (aluno_cpf, aluno_nm) values('75755212678', 'Waldemar');
insert into tb_aluno (aluno_cpf, aluno_nm) values('21826442375', 'Sálvio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('43610507160', 'Madalena');
insert into tb_aluno (aluno_cpf, aluno_nm) values('26452136429', 'Gabriel');
insert into tb_aluno (aluno_cpf, aluno_nm) values('35463680370', 'Hebe');
insert into tb_aluno (aluno_cpf, aluno_nm) values('08547337440', 'Daiana');
insert into tb_aluno (aluno_cpf, aluno_nm) values('32416065700', 'Fátima');
insert into tb_aluno (aluno_cpf, aluno_nm) values('15744078487', 'Taís');
insert into tb_aluno (aluno_cpf, aluno_nm) values('17303634150', 'Jacques');
insert into tb_aluno (aluno_cpf, aluno_nm) values('54865135855', 'Tabita');
insert into tb_aluno (aluno_cpf, aluno_nm) values('45053521107', 'Maia');
insert into tb_aluno (aluno_cpf, aluno_nm) values('04781214231', 'Xaviera');
insert into tb_aluno (aluno_cpf, aluno_nm) values('47315855629', 'Rafaela');
insert into tb_aluno (aluno_cpf, aluno_nm) values('01216052565', 'Karla');
insert into tb_aluno (aluno_cpf, aluno_nm) values('58361534857', 'Inácio');
insert into tb_aluno (aluno_cpf, aluno_nm) values('42852384540', 'Octávio');

-- alunos matriculados
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 1);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 2);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 3);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 4);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 5);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 6);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 7);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 8);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 9);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 10);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 11);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 12);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 13);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 14);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 15);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 16);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 17);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 18);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 19);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 20);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(1, 21);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 22);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 23);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 24);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 25);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 26);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 27);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 28);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 29);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 30);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 31);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 32);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 33);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 34);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 35);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 36);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 37);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 38);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 39);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 40);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 41);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 42);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 43);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 44);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 45);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 46);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 47);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 48);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 49);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 50);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(2, 51);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 52);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 53);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 54);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 55);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 56);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 57);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 58);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 59);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 60);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 61);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 62);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 63);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 64);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 65);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 66);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 67);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 68);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 69);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 70);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 71);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 72);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 73);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 74);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 75);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 76);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 77);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 78);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 79);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 80);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 81);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 82);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 83);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 84);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 85);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 86);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 87);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 88);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 89);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 90);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 91);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 92);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(3, 93);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 94);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 95);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 96);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 97);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 98);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 99);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 100);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 101);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 102);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 103);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 104);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 105);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 106);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 107);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 108);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 109);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 110);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 111);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 112);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 113);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 114);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 115);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 116);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 117);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 118);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 119);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 120);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 121);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 122);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 123);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 124);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 125);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 126);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 127);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 128);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 129);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 130);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 131);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 132);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 133);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 134);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 135);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 136);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 137);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 138);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 139);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 140);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 141);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 142);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 143);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 144);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 145);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 146);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 147);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 148);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(4, 149);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 150);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 151);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 152);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 153);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 154);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 155);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 156);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 157);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 158);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 159);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 160);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 161);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 162);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 163);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 164);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 165);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 166);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 167);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 168);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 169);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 170);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 171);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 172);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 173);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 174);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 175);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 176);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 177);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 178);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 179);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 180);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 181);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 182);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 183);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 184);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 185);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 186);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 187);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 188);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 189);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 190);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 191);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 192);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 193);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 194);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 195);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 196);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 197);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 198);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 199);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(5, 200);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 201);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 202);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 203);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 204);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 205);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 206);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 207);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 208);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 209);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 210);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 211);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 212);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 213);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 214);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 215);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 216);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 217);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 218);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 219);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 220);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(6, 221);

insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 1);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 2);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 3);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 4);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 5);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 6);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 7);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 8);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 9);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 10);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 11);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 12);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 13);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 14);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 15);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 16);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 17);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 18);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 19);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 20);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(7, 21);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 22);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 23);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 24);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 25);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 26);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 27);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 28);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 29);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 30);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 31);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 32);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 33);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 34);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 35);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 36);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 37);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 38);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 39);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 40);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 41);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 42);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 43);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 44);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 45);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 46);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 47);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 48);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 49);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 50);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(8, 51);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 52);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 53);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 54);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 55);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 56);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 57);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 58);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 59);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 60);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 61);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 62);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 63);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 64);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 65);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 66);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 67);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 68);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 69);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 70);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 71);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 72);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 73);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 74);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 75);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 76);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 77);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 78);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 79);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 80);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 81);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 82);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 83);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 84);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 85);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 86);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 87);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 88);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 89);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 90);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 91);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 92);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(9, 93);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 94);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 95);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 96);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 97);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 98);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 99);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 100);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 101);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 102);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 103);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 104);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 105);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 106);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 107);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 108);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 109);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 110);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 111);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 112);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 113);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 114);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 115);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 116);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 117);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 118);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 119);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 120);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 121);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 122);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 123);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 124);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 125);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 126);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 127);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 128);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 129);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 130);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 131);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 132);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 133);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 134);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 135);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 136);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 137);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 138);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 139);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 140);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 141);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 142);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 143);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 144);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 145);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 146);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 147);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 148);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(10, 149);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 150);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 151);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 152);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 153);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 154);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 155);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 156);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 157);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 158);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 159);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 160);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 161);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 162);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 163);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 164);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 165);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 166);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 167);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 168);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 169);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 170);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 171);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 172);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 173);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 174);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 175);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 176);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 177);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 178);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 179);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 180);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 181);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 182);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 183);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 184);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 185);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 186);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 187);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 188);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 189);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 190);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 191);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 192);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 193);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 194);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 195);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 196);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 197);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 198);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 199);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(11, 200);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 201);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 202);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 203);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 204);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 205);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 206);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 207);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 208);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 209);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 210);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 211);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 212);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 213);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 214);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 215);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 216);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 217);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 218);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 219);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 220);
insert into tb_disciplina_aluno (disc_id, aluno_id) values(12, 221);