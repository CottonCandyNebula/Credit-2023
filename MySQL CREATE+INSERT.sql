-- СОЗДАНИЕ БД --
CREATE TABLE `Students` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(100) DEFAULT 'null',
	`date_of_birth` DATE NOT NULL,
	`address` varchar(100) DEFAULT 'null',
	`email` varchar(100) DEFAULT 'null',
	`id_group` INT NOT NULL,
	`budget_place` bool NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Group` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`designation` varchar(50) DEFAULT 'null',
	`direction_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Direction` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(200) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Phone_numbers` (
	`id` INT NOT NULL,
	`number` varchar(50) NOT NULL
);

CREATE TABLE `teachers_and_subjects` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`subject_id` INT NOT NULL,
	`teacher_id` INT NOT NULL,
	`direction_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Teachers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name_t` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Subjects` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`subject` varchar(150) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Marks` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`student_id` INT NOT NULL,
	`tas_id` INT NOT NULL,
	`mark` INT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Timetable` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`start_t` TIME NOT NULL,
	`end_t` TIME NOT NULL,
	`number_lesson` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Study_schedule` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`subj_id` INT NOT NULL,
	`time_id` INT NOT NULL,
	`date_lesson` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Attendance` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`stud_id` INT NOT NULL,
	`schedule_id` INT NOT NULL,
	`attend` bool NOT NULL,
	`teach_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Students` ADD CONSTRAINT `Students_fk0` FOREIGN KEY (`id_group`) REFERENCES `Group`(`id`);

ALTER TABLE `Group` ADD CONSTRAINT `Group_fk0` FOREIGN KEY (`direction_id`) REFERENCES `Direction`(`id`);

ALTER TABLE `Phone_numbers` ADD CONSTRAINT `Phone_numbers_fk0` FOREIGN KEY (`id`) REFERENCES `Students`(`id`);

ALTER TABLE `teachers_and_subjects` ADD CONSTRAINT `teachers_and_subjects_fk0` FOREIGN KEY (`subject_id`) REFERENCES `Subjects`(`id`);

ALTER TABLE `teachers_and_subjects` ADD CONSTRAINT `teachers_and_subjects_fk1` FOREIGN KEY (`teacher_id`) REFERENCES `Teachers`(`id`);

ALTER TABLE `teachers_and_subjects` ADD CONSTRAINT `teachers_and_subjects_fk2` FOREIGN KEY (`direction_id`) REFERENCES `Direction`(`id`);

ALTER TABLE `Marks` ADD CONSTRAINT `Marks_fk0` FOREIGN KEY (`student_id`) REFERENCES `Students`(`id`);

ALTER TABLE `Marks` ADD CONSTRAINT `Marks_fk1` FOREIGN KEY (`tas_id`) REFERENCES `teachers_and_subjects`(`id`);

ALTER TABLE `Study_schedule` ADD CONSTRAINT `Study_schedule_fk0` FOREIGN KEY (`time_id`) REFERENCES `Timetable`(`id`);

ALTER TABLE `Attendance` ADD CONSTRAINT `Attendance_fk0` FOREIGN KEY (`stud_id`) REFERENCES `Students`(`id`);

ALTER TABLE `Attendance` ADD CONSTRAINT `Attendance_fk1` FOREIGN KEY (`schedule_id`) REFERENCES `Study_schedule`(`id`);

ALTER TABLE `Attendance` ADD CONSTRAINT `Attendance_fk2` FOREIGN KEY (`teach_id`) REFERENCES `Teachers`(`id`);

-- ВВОД ДАННЫХ ----
INSERT INTO
	`Direction`(title)
VALUES
	('ОПТИЧЕСКИЕ И БИОТЕХНИЧЕСКИЕ СИСТЕМЫ И ТЕХНОЛОГИИ'),
    ('МАШИНОСТРОЕНИЕ'),
    ('АВИАЦИОННАЯ И РАКЕТНО-КОСМИЧЕСКАЯ ТЕХНИКА');

INSERT INTO
    `Group`(designation,direction_id)
VALUES
    ('ОБСТ203', 1),
    ('ОБСТ201', 1),
    ('ОБСТ202', 1),
    ("М201", 2),
    ("М202", 2),
    ("М203", 2),
    ("АРКТ201", 3),
    ("АРКТ202", 3),
    ("АРКТ203", 3);

INSERT INTO
    `Students`(name, date_of_birth, address, email, id_group,budget_place)
VALUES
	('Масленников Николай Павлович','2004-10-21','Воронеж, ул. Карла Маркса, 10','MaslennikovNikolai@yandex.ru', 1, 1),
	('Горшкова Арина Михайловна','2004-08-25','Саратов, ул. Железнодорожная, 48','Arina.Gorshkova@gmail.com', 1, 1),
	('Гришин Семён Ильич','2005-12-19','Саратов, ул. Нагорная, 1','Semen.Grishin@gmail.com', 1, 0),
	('Козлов Даниил Михайлович','2005-10-30','Новосибирск, ул. Степная, 15','KozlovDaniil@yandex.ru', 1, 1),
	('Ефимова Ева Ильинична','2004-04-20','Красноярск, ул. Коммунистическая, 1','EfimovaEva@yandex.ru', 1, 1),
	('Семенова Александра Алексеевна','2004-09-25','Саратов, ул. Советская, 44','Aleksandra.Semenova@gmail.com', 1, 0),
	('Нечаева Елизавета Егоровна','2005-10-27','Воронеж, ул. Рабочая, 50','NechaEva@example.com', 1, 1),
	('Семенова Варвара Богдановна','2002-04-07','Тюмень, ул. Зеленая, 20','VarS_B@example.com',2,1),
	('Беликов Григорий Андреевич','2002-08-08','Челябинск, ул. Вишневая, 18','Gregori.Belikov@yandex.ru',2,0),
	('Кравцов Святослав Макарович','2003-10-30','Саратов, ул. Андреева, 16','Kravtsov_Svyat@gmail.com',2,1),
	('Рудакова Мирослава Тимофеевна','2003-03-31','Саратов, ул. Арановой, 8','Miroslava.R@yandex.ru',2,1),
	('Зайцева Милана Алексеевна','2002-03-04','Саратов, ул. Арбатская, 57','Zaitsev_Milan@gmail.com',2,1),
	('Тихонова Виктория Владимировна','2002-08-28','Саратов, ул. Байкальская, 3','Viktoria.Tikhonova@yandex.ru',2,1),
	('Князев Степан Кириллович','2002-08-21','Саратова, ул. Байкальская, 12','Stepan.Knyazev@yandex.ru',2,1),
	('Филатов Никита Ярославович','2004-11-12','Саратов, ул. Андреева, 13','Filatov_Nikita@yandex.ru',3,0),
	('Софронов Борис Андреевич','2004-05-01','Саратов, ул. Арановой, 6','Sofronov_Boris@yandex.ru',3,0),
	('Леонова София Глебовна','2004-11-12','Саратов, ул. Артиллерийская, 8','Leonova_Sofia@yandex.ru',3,0),
	('Петров Николай Тимофеевич','2004-05-04','Саратов, ул. Арановой, 9','Petrov_Nikolai@yandex.ru',3,0),
	('Нестерова Ульяна Михайловна','2004-01-18','Саратов, ул. Балашовская, 37','Nesterova_Uliana@yandex.ru',3,0),
	('Коновалов Владислав Владимирович','2003-02-15','Саратов, ул. Бардина, 4','Konovalov_Vladislav@yandex.ru',3,0),
	('Виноградова Милослава Дмитриевна','2003-01-25','Саратов, ул. Бардина, 2','Vinogradova_Miloslava@yandex.ru',3,0),
	('Березина Анна Даниловна','2003-05-14','Саратов, ул. Бардина, 6','Berezina_Anna@gmail.ru',4,1),
	('Григорьева Яна Арсентьевна','2002-08-22','Саратов, ул. Бахметьевская, 9','Grigorieva_Yana@yandex.ru',4,0),
	('Макаров Михаил Никитич','2002-07-28','Саратов, ул. Андреева, 21','Makarov_Mikhail@yandex.ru',4,1),
	('Лебедев Игорь Павлович','2003-01-02','Саратов, ул. Белинского, 16','Lebedev_Igor@mail.ru',4,0),
	('Латышева Полина Артемьевна','2002-03-25','Саратов, ул. Чкалова, 86','Latysheva_Polina@yandex.ru',4,1),
	('Носова Стефания Алексеевна','2002-05-05','Самара, ул. Трудовая, 24','Nosova_Stefaniya@yandex.ru',4,0),
	('Иванов Иван Макарович','2002-12-10',' Саратов, ул. Бардина, 8','Ivanov_Ivan@gmail.ru',4,1),
	('Левин Роман Фёдорович','2003-06-02','Саратов, ул. Большешуберская, 13','Levin_Roman@yandex.ru',5,1),
	('Афанасьева Виктория Ильинична','2003-12-23','Саратов, ул. Дружбы, 6','Afanasyeva_Viktoria@yandex.ru',5,1),
	('Руднев Эрик Дамирович','2004-11-29','Саратов, ул. Солнечная, 10','Rudnev_Erik@gmail.ru',5,0),
	('Золотарев Лев Ильич','2004-12-19','Саратов, ул. Тихая, 26','Zolotarev_Lev@mail.ru',5,1),
	('Трофимова Кира Ивановна','2003-12-11','Саратов, ул. Луговая, 11','Trofimova_Kira@yandex.ru',5,1),
	('Матвеева Арина Михайловна','2004-11-18','Саратов, ул. Лесная, 4','Matveeva_Arina@yandex.ru',5,0),
	('Морозов Кирилл Константинович','2004-09-26','Саратов, ул. Кузнечная, 33','Morozov_Kirill@yandex.ru
',5,1),
	('Тарасова Варвара Юрьевна','2004-07-21','Саратов, ул. Новая, 14','Varya_Tarasova@yandex.ru',6,1),
	('Сидоров Никита Константинович','2004-01-29','Саратов, ул. Сергиево-Владимирская, 26','Sidorov_Nik@gmail.com',6,1),
	('Захаров Ярослав Артёмович','2004-01-01','Саратов, ул. Радужная, 23','Yaro_Zak@hotmail.com',6,1),
	('Жуков Тимофей Максимович','2004-12-11','Саратов, ул. Селляхская, 4','Zhukov_Tim@gmail.com',6,1),
	('Щербаков Даниил Михайлович','2005-05-08','Солнечногорск, ул. Косиора, 70','DMScherbakov@gmail.com',6,1),
	('Исаков Иван Андреевич','2004-10-22','Саратов, ул. Молокова, 7','Isakov_Ivan@mail.ru',6,1),
	('Суслова София Александровна','2004-06-13','Саратов, ул. Набережная, 12','Suslova_Sofia@mail.ru',6,1),
	('Рыбаков Андрей Романович','2003-09-30','Нижний Новгород, ул. Полевая, 19','Andrey_Rybakov@yandex.ru',7,1),
	('Иванов Лев Михайлович','2002-09-15','Щёлково, ул. Новая, 13','leo.ivanov@gmail.com',7,0),
	('Фокина Юлия Максимовна','2002-03-25','Саратов, ул. Молокова, 8','Yulia_Fokina@yandex.ru',7,1),
	('Емельянова Диана Дмитриевна','2002-02-11','Саратов, ул. Лесная, 14','diana.emelyanova@gmail.com',7,1),
	('Семенов Георгий Тимофеевич','2002-04-15','Саратов, ул. Центральная, 3','Georgy_Semenov@yandex.ru',7,1),
	('Золотов Леонид Семёнович','2003-02-20','Саратов, ул. Новая, 18','Leonid_Zolotov@yandex.ru',7,0),
	('Суслова Анна Макаровна','2003-02-13','Саратов, ул. Дачная, 33','anna.suslova@gmail.com',7,1),
	('Попов Максим Маркович','2004-09-27','Саратов, ул. Ленина, 10','Maksim_Popov@yandex.ru',8,1),
	('Ильин Илья Михайлович','2004-08-06','Саратов, ул. Полевая, 13','ilya.ilyin@gmail.com',8,1),
	('Успенский Кирилл Львович','2003-02-07','Саратов, ул. Доллунская, 29','Kirill_Uspensky@yandex.ru',8,0),
	('Белов Богдан Георгиевич','2003-03-18','Саратов, ул. Строительная, 22','bogdan.belov@gmail.com',8,1),
	('Самсонова Элина Эмировна','2003-02-23','Саратов, ул. Асиновская, 15','Elina_Samsonova@yandex.ru',8,1),
	('Павлов Андрей Ильич','2004-04-30','Саратов, ул. Северная, 1','Andrey_Pavlov@yandex.ru',8,0),
	('Белова Николь Максимовна','2003-02-08','Саратов, ул. Дачная, 32','belova_n@gmail.com',8,0),
	('Назарова Алиса Тихоновна','2004-07-29','Пенза, ул. Радужная, 14',' Alisa_Nazarova@yandex.ru',9,0),
	('Соколова Аврора Марковна','2005-07-03','Самара, ул. Партизанская, 14','avrora.sokolova@gmail.com',9,0),
	('Дубровин Дмитрий Ярославович','2004-01-09','Саратов, ул. Асиновская, 16','Dmitry_Dubrovin@yandex.ru',9,1),
	('Парфенова Ева Александровна','2005-03-10','Саратов, ул. Дружбы, 8','Eva_Parfenova@yandex.ru',9,1),
	('Седов Александр Владимирович','2005-08-30','Саратов, ул. Арановой, 8','Aleksandr_Sedov@yandex.ru',9,1),
	('Орлов Юрий Артёмович','2004-03-26','Саратов, ул. Андреева, 16','Yuri_Orlov@yandex.ru',9,0),
	('Титов Даниил Егорович','2004-11-17','Саратов, ул. Чкалова, 87','daniil.titov@gmail.com',9,1);

INSERT INTO
	`Phone_numbers`(id,number)
VALUES
	(1, '89921721781'),
    (1, '84244155652'),
    (2, '80694224027'),
    (3, '81170716596'),
    (4, '81741869980'),
    (5, '84062073875'),
    (6, '86636090378'),
    (6, '80112029383'),
    (7, '89258586000'),
    (8, '84969009891'),
    (8, '82848566494'),
    (9, '80774706721'),
    (10, '87547085928'),
    (11, '86368827033'),
    (12, '85735744110'),
    (12, '82638729871'),
    (13, '89449728484'),
    (14, '84035425621'),
    (15, '82874718537'),
    (16, '80983072123'),
    (17, '85623426908'),
    (18, '88119541532'),
    (19, '82162977456'),
    (19, '82351259654'),
    (20, '88591279826'),
    (21, '84917053398'),
    (22, '87595430933'),
    (23, '85302075529'),
    (24, '82712608717'),
    (25, '82399260327'),
    (26, '84044499331'),
    (27, '83425007358'),
    (28, '88673469002'),
    (29, '89305685437'),
    (29, '86399454129'),
    (29, '82626799931'),
    (30, '89364884777'),
    (31, '87896720465'),
    (32, '88055626388'),
    (33, '82489729629'),
    (34, '80060080346'),
    (35, '81018844595'),
    (36, '88547829932'),
    (37, '84623989840'),
    (38, '89904022873'),
    (39, '80271509449'),
    (40, '89314682905'),
    (41, '83911245621'),
    (42, '87197306589'),
    (43, '85328320375'),
    (44, '85654364896'),
    (45, '89055354969'),
    (46, '88664377861'),
    (47, '88252034142'),
    (48, '84385986421'),
    (49, '80366030012'),
    (50, '80408408431'),
    (51, '86922356187'),
    (52, '88684149433'),
    (53, '85559566776'),
    (54, '81759806559'),
    (55, '85354513045'),
    (56, '85354513045'),
    (57, '82005529213'),
    (57, '85761455476'),
    (58, '80018218220'),
    (59, '80647655349'),
    (59, '87320732569'),
    (60, '80244446970'),
    (61, '83076323452'),
    (62, '81858444125'),
    (63, '83609857717');

INSERT INTO
    `Subjects`(subject)
VALUES
    ("Техническая механика"),
    ("Высшая математика"),
    ("Метрология"),
    ("Техническая эксплуатация летательных аппаратов и двигателей"),
    ("Электроэнергетика и энергоснабжение"),
    ("Приборы, системы и изделия медицинского назначения"),
    ("Радиометрия и спектрометрия");

INSERT INTO
    `Teachers`(name_t)
VALUES
    ("Данилов Константин Русланович"),
    ("Пономарева Елизавета Данииловна"),
    ("Григорьев Павел Павлович"),
    ("Судаков Даниил Алексеевич"),
    ("Карпов Михаил Максимович");

INSERT INTO
    `teachers_and_subjects`(id,subject_id,teacher_id,direction_id)
VALUES
    (1,1,1,2),
    (2,2,2,2),
    (3,3,3,2),
    (4,2,2,3),
    (5,4,4,3),
    (6,5,4,3),
    (7,6,5,1),
    (8,2,2,1),
    (9,7,3,1);

INSERT INTO
    `Timetable`(id,start_t,end_t,number_lesson)
VALUES
    (1,"08:00:00","9:30:00",1),
    (2,"09:40:00","11:10:00",2),
    (3,"11:25:00","12:55:00",3),
    (4,"13:20:00","14:50:00",4),
    (5,"15:05:00","16:35:00",5),
    (6,"16:50:00","18:20:00",6),
    (7,"18:30:00","20:00:00",7),
    (8,"20:05:00","21:35:00",8);

INSERT INTO
    `Study_schedule`(id,subj_id,time_id,date_lesson)
VALUES
-- оптика ОБСТ201
    (1,6,1,"2023-10-15"),
    (2,6,2,"2023-10-15"),
    (3,2,3,"2023-10-15"),
    (4,7,1,"2023-10-16"),
-- машиностроение  М202    
    (5,1,3,"2023-10-15"),
    (6,2,4,"2023-10-15"),
    (7,2,5,"2023-10-15"),
-- авиация АРКТ203   
    (8,2,1,"2023-10-15"),
    (9,4,1,"2023-10-16"),
    (10,5,2,"2023-10-16");

INSERT INTO
    `Attendance`(id,stud_id,schedule_id,attend,teach_id)
VALUES
-- ОПТИКА ОБСТ201
-- Семенова
    (1,8,1,1,5),
    (2,8,2,1,5),
    (3,8,3,1,2),
    (4,8,4,1,3),
-- Беликов
    (5,9,1,0,5),
    (6,9,2,0,5),
    (7,9,3,1,2),
    (8,9,4,1,3),
-- Кравцов
    (9,10,1,1,5),
    (10,10,2,1,5),
    (11,10,3,1,2),
    (12,10,4,1,3),
-- Рудакова
    (13,11,1,1,5),
    (14,11,2,1,5),
    (15,11,3,1,2),
    (16,11,4,1,3),
-- Зайцева
    (17,12,1,0,5),
    (18,12,2,0,5),
    (19,12,3,0,2),
    (20,12,4,0,3),
-- Тихонова
    (21,13,1,1,5),
    (22,13,2,1,5),
    (23,13,3,1,2),
    (24,13,4,1,3),
-- Князев
    (25,14,1,1,5),
    (26,14,2,1,5),
    (27,14,3,1,2),
    (28,14,4,1,3),
    
-- МАШИНОСТРОЕНИЕ М202    
-- Левин
    (29,29,5,1,1),
    (30,29,6,1,2),
    (31,29,7,1,2),
-- Афанасьева
    (32,30,5,1,1),
    (33,30,6,1,2),
    (34,30,7,1,2),
-- Руднев
    (35,31,5,0,1),
    (36,31,6,1,2),
    (37,31,7,1,2),
-- Золотарев
    (38,32,5,0,1),
    (39,32,6,0,2),
    (40,32,7,0,2),
-- Трофимова
    (41,33,5,1,1),
    (42,33,6,0,2),
    (43,33,7,0,2),
-- Матвеева
    (44,34,5,1,1),
    (45,34,6,1,2),
    (46,34,7,1,2),
-- Морозов
    (47,35,5,1,1),
    (48,35,6,1,2),
    (49,35,7,1,2),
    
-- АВИАЦИЯ АРКТ203   
 -- Назарова
    (50,57,8,1,2),
    (51,57,9,1,4),
    (52,57,10,1,4),
-- Соколова
    (53,58,8,1,2),
    (54,58,9,1,4),
    (55,58,10,1,4),
-- Дубровин
    (56,59,8,1,2),
    (57,59,9,1,4),
    (58,59,10,1,4),
-- Парфенова
    (59,60,8,1,2),
    (60,60,9,1,4),
    (61,60,10,1,4),
-- Седов
    (62,61,8,1,2),
    (63,61,9,1,4),
    (64,61,10,1,4),
-- Орлов
    (65,62,8,1,2),
    (66,62,9,1,4),
    (67,62,10,1,4),
 -- Титов
    (68,63,8,1,2),
    (69,63,9,1,4),
    (70,63,10,1,4);



INSERT INTO
    `Marks`(id,student_id,tas_id,mark)
VALUES
-- группа ОБСТ203
-- Масленников
    (1,1,7,5),
    (2,1,8,5),
    (3,1,9,5),
-- Горшкова
    (4,2,7,5),
    (5,2,8,5),
    (6,2,9,5),
-- Гришин
    (7,3,7,4),
    (8,3,8,3),
    (9,3,9,5),
-- Козлов нет одной оценки
    (10,4,7,0),
    (11,4,8,3),
    (12,4,9,3),
-- Ефимова 
    (13,5,7,4),
    (14,5,8,4),
    (15,5,9,4),
-- Семенова
    (16,6,7,4),
    (17,6,8,4),
    (18,6,9,5),
-- Нечаева
    (19,7,7,4),
    (20,7,8,5),
    (21,7,9,5),
-- группа ОБСТ 201
-- Семенова
    (22,8,7,4),
    (23,8,8,5),
    (24,8,9,5),
-- Беликов
    (25,9,7,3),
    (26,9,8,3),
    (27,9,9,2),
-- Кравцов 
    (28,10,7,4),
    (29,10,8,3),
    (30,10,9,4),
-- Рудакова
    (31,11,7,3),
    (32,11,8,3),
    (33,11,9,3),
-- Зайцева нет 1 оценки
    (34,12,7,3),
    (35,12,8,0),
    (36,12,9,2),
-- Тихонова 
    (37,13,7,5),
    (38,13,8,5),
    (39,13,9,5),
-- Князев
    (40,14,7,4),
    (41,14,8,5),
    (42,14,9,5),
-- группа ОБСТ 202
-- Филатов
    (43,15,7,5),
    (44,15,8,5),
    (45,15,9,5),
-- Софронов нет 3 оценок
    (46,16,7,0),
    (47,16,8,0),
    (48,16,9,0),
-- Леонова
    (49,17,7,2),
    (50,17,8,5),
    (53,17,9,5),
-- Петров
    (54,18,7,4),
    (55,18,8,3),
    (56,18,9,5),
-- Нестерова
    (57,19,7,3),
    (58,19,8,5),
    (59,19,9,5),
-- Коновалов
    (60,20,7,4),
    (61,20,8,5),
    (62,20,9,2),
-- Виноградова
    (63,21,7,5),
    (64,21,8,5),
    (65,21,9,5),
-- Группа М201
-- Березина 
    (66,22,1,5),
    (67,22,2,5),
    (68,22,3,5),
-- Григорьева
    (69,23,1,5),
    (70,23,2,4),
    (71,23,3,5),
-- Макаров (нет 1 оценки)
    (72,24,1,3),
    (73,24,2,0),
    (74,24,3,3),
-- Лебедев (нет оценок)
    (75,25,1,0),
    (76,25,2,0),
    (77,25,3,0),
-- Латышева
    (78,26,1,4),
    (79,26,2,4),
    (80,26,3,4),
-- Носова
    (81,27,1,3),
    (82,27,2,4),
    (83,27,3,3),
-- Иванов
    (84,28,1,5),
    (85,28,2,5),
    (86,28,3,5),
-- Группа М202
-- Левин
    (87,29,1,5),
    (88,29,2,5),
    (89,29,3,5),
-- Афанасьева
    (90,30,1,4),
    (91,30,2,4),
    (92,30,3,4),
-- Руднев
    (93,31,1,3),
    (94,31,2,4),
    (95,31,3,4),
-- Золотарев
    (96,32,1,4),
    (97,32,2,4),
    (98,32,3,5),
-- Трофимова
    (99,33,1,4),
    (100,33,2,5),
    (101,33,3,4),
-- Матвеева
    (102,34,1,3),
    (103,34,2,4),
    (104,34,3,4),
-- Морозов
    (105,35,1,5),
    (106,35,2,5),
    (107,35,3,5),
-- Группа М203
-- Тарасова
    (108,36,1,4),
    (109,36,2,4),
    (110,36,3,3),
-- Сидоров
    (111,37,1,4),
    (112,37,2,3),
    (113,37,3,4),
-- Захаров
    (114,38,1,3),
    (115,38,2,5),
    (116,38,3,4),
-- Жуков
    (117,39,1,4),
    (118,39,2,4),
    (119,39,3,2),
-- Щербаков
    (120,40,1,4),
    (121,40,2,5),
    (122,40,3,4),
-- Исаков
    (123,41,1,3),
    (124,41,2,2),
    (125,41,3,4),
-- Суслова
    (126,42,1,5),
    (127,42,2,4),
    (128,42,3,5),
-- Группа АРКТ201
-- Рыбаков
    (129,43,4,5),
    (130,43,5,5),
    (131,43,6,5),
-- Иванов
    (132,44,4,4),
    (133,44,5,5),
    (134,44,6,5),
-- Фокина
    (135,45,4,3),
    (136,45,5,3),
    (137,45,6,3),
-- Емельянова
    (138,46,4,3),
    (139,46,5,5),
    (140,46,6,3),
-- Семенов 
    (141,47,4,4),
    (142,47,5,2),
    (143,47,6,4),
-- Золотов
    (144,48,4,4),
    (145,48,5,4),
    (146,48,6,4),
-- Суслова
    (147,49,4,3),
    (148,49,5,4),
    (149,49,6,5),
-- Группа АРКТ202
-- Попов
    (150,50,4,3),
    (151,50,5,4),
    (152,50,6,5),
-- Ильин
    (153,51,4,5),
    (154,51,5,5),
    (155,51,6,5),
-- Успенский
    (156,52,4,5),
    (157,52,5,5),
    (158,52,6,5),
-- Белов 
    (159,53,4,4),
    (160,53,5,4),
    (161,53,6,5),
-- Самсонова
    (162,54,4,4),
    (163,54,5,5),
    (164,54,6,5),
-- Павлов
    (165,55,4,3),
    (166,55,5,4),
    (167,55,6,3),
-- Белова
    (168,56,4,5),
    (169,56,5,5),
    (170,56,6,5),
-- Группа АРКТ203
-- Назарова
    (171,57,4,5),
    (172,57,5,2),
    (173,57,6,5),
-- Соколова 
    (174,58,4,5),
    (175,58,5,5),
    (176,58,6,5),
-- Дубровин
    (177,59,4,3),
    (178,59,5,4),
    (179,59,6,2),
-- Парфенова
    (180,60,4,4),
    (181,60,5,5),
    (182,60,6,4),
-- Седов
    (183,61,4,2),
    (184,61,5,3),
    (185,61,6,4),
-- Орлов
    (186,62,4,5),
    (187,62,5,5),
    (188,62,6,5),
-- Титов
    (189,63,4,4),
    (190,63,5,4),
    (191,63,6,4);

-- Функции 
DELIMITER //
CREATE FUNCTION count_attendance(thisteach_id INT)
    RETURNS INT
BEGIN
    DECLARE total_attendance INT;
    SELECT COUNT(DISTINCT stud_id) INTO total_attendance
    FROM Attendance
    WHERE attend = 1 AND thisteach_id = teach_id;
    RETURN total_attendance;
END //
DELIMITER ;

-- SELECT count_attendance(2);

DELIMITER //
CREATE FUNCTION calculate_average_mark(subject_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE avg_mark FLOAT;
    SELECT AVG(mark) INTO avg_mark
    FROM Marks
    JOIN teachers_and_subjects ON Marks.tas_id = teachers_and_subjects.id
    WHERE teachers_and_subjects.subject_id = subject_id;
    RETURN avg_mark;
END //
DELIMITER ;

-- SELECT calculate_average_mark(1);

-- триггеры

DROP TRIGGER IF EXISTS Students_insert;
DELIMITER //
CREATE TRIGGER Students_insert BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
	IF NEW.name NOT REGEXP '^[А-ЯЁа-яё]+' or NEW.name = null THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат имени студента';
	END IF;
    IF NEW.date_of_birth NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' or NEW.date_of_birth = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат даты рождения';
	END IF;
	IF NEW.address NOT REGEXP '^[А-ЯЁа-яё]+' or NEW.address = null THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат адреса регистрации';
	END IF;
	IF NEW.email NOT REGEXP "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$" OR NEW.email = null THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат email';
	END IF;
    IF NEW.id_group <= 0 or NEW.id_group = null THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недопустимое значение группы обучения';
	END IF;
	If NEW.budget_place != 0 AND NEW.budget_place != 1 or NEW.budget_place = null THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недопустимое значение бюджетного места';
	END IF;
END//
DELIMITER ;

-- INSERT INTO
--    `Students`(name, date_of_birth, address, email, id_group,budget_place)
-- VALUES
--    ('Eva', '2024-01-01','dfgr','abc@mail', 0,3);

DELIMITER //
CREATE TRIGGER Students_delete
BEFORE DELETE ON Students
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Нельзя удалить эти данные';
END//
DELIMITER ;

-- DELETE FROM Students
-- WHERE id = 1;


DROP TRIGGER IF EXISTS Students_update;
DELIMITER //
CREATE TRIGGER Students_update
BEFORE UPDATE ON Students
FOR EACH ROW
BEGIN
	SET NEW.name = IFNULL(NEW.name, OLD.date_of_birth, OLD.email, OLD.address, OLD.id_group, OLD.budget_place );
	SET NEW.date_of_birth = IFNULL(NEW.date_of_birth, OLD.name, OLD.address, OLD.id_group, OLD.email, OLD.budget_place );
    SET NEW.address = IFNULL(NNEW.address, OLD.name, OLD.date_of_birth,  OLD.email, OLD.id_group, OLD.budget_place );
    SET NEW.email = IFNULL(NEW.email, OLD.name, OLD.date_of_birth,  OLD.address, OLD.id_group, OLD.budget_place );
    SET NEW.id_group = IFNULL(NEW.id_group, OLD.name, OLD.date_of_birth, OLD.budget_place, OLD.email, OLD.address);
    SET NEW.budget_place = IFNULL(NEW.budget_place, OLD.name, OLD.date_of_birth, OLD.address, OLD.id_group, OLD.email);
END IF;
END//
DELIMITER ;

-- UPDATE Students
-- SET id_group = 2
-- WHERE id = 3;