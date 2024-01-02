-- СОЗДАНИЕ БАЗЫ ДАННЫХ

CREATE TABLE `Customers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`client_name` varchar(50) NOT NULL,
	`phone_number` varchar(12) NOT NULL,
	`email` varchar(60) NOT NULL,
	`benefit` bool NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Orders` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_client` INT NOT NULL,
	`id_product` INT NOT NULL,
	`date_regist` DATE NOT NULL,
	`quantity` INT NOT NULL,
	`sum` DECIMAL NOT NULL,
	`id_department` INT NOT NULL,
	`status` bool NOT NULL,
	`deadline` DATE NOT NULL,
	`id_executor` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Departments` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Workers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name_work` varchar(50) NOT NULL,
	`post` varchar(50) NOT NULL,
	`id_dep` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Products` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_name` varchar(50) NOT NULL,
	`material` varchar(50) NOT NULL,
	`price` DECIMAL NOT NULL DEFAULT '0.0',
	`availability` bool NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk0` FOREIGN KEY (`id_client`) REFERENCES `Customers`(`id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk1` FOREIGN KEY (`id_product`) REFERENCES `Products`(`id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk2` FOREIGN KEY (`id_department`) REFERENCES `Departments`(`id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk3` FOREIGN KEY (`id_executor`) REFERENCES `Workers`(`id`);

ALTER TABLE `Workers` ADD CONSTRAINT `Workers_fk0` FOREIGN KEY (`id_dep`) REFERENCES `Departments`(`id`);

-- ВВОД ДАННЫХ

INSERT INTO
    `Customers`(client_name,phone_number,email,benefit)
VALUES
    ('Типикина Валерия Юрьевна', '+79536043363', 'lepka_valeri@mail.ru', 1),
    ('Линевич Александр Семенович', '+79955477814', 'linsevich_alexandr@mail.ru', 0),
    ('Кубанев Виктор Русланович', '+79012312975', 'kubanev_victor@inbox.ru', 0),
    ('Маршалков Эдуард Марселевич', '+79527416159', 'marshallkov_eduard@gmail.com', 0),
    ('Зачесломская Екатерина Викторовна', '+79521885628', 'zachesomskaya_ekaterina@yahoo.com', 0),
    ('Дятлов Георгий Вячеславович', '+79016846806', 'dyatlov_georgiy@outlook.com', 0),
    ('Бурдаева Лидия Николаевна', '+77640692758', 'burdaeva_lidiya@bk.ru', 0),
    ('Долин Марсель Васильевич', '+79585556327', 'dolin_marcel@yandex.ru', 0),
    ('Черановская Екатерина Леонидовна', '+79002183525', 'cheranovskaya_ekaterina@facebook.com', 0),
    ('Войкова Оксана Маратовна', '+79521447344', 'voykova_oksana@twitter.com', 0),
    ('Султанский Владислав Глебович', '+79011247120', 'sultanskiy_vladislav@instagram.com', 0),
    ('Серебряников Евгений Антонович', '+79782976931', 'serebryannikov_evgeniy@linkedin.com', 1);

INSERT INTO
    `Departments`(title)
VALUES
    ('Цифровая, офсетная печать'),
    ('Post материалы'),
    ('Наружная реклама'),
    ('Сувенирная продукция'),
    ('Текстиль'),
    ('Услуги дизайнера'),
    ('Широкоформатная печать'),
    ('Фотопродукция'),
    ('Упаковочные материалы'),
    ('Коробки');

INSERT INTO
    `Workers`(name_work,post,id_dep)
VALUES
    ('Семенов Егор Андреевич','Главный бухгалтер', 9),
    ('Семенов Егор Андреевич','Главный бухгалтер', 10),
    ('Орлов Михаил Тимурович','Менеджер по продажам', 9),
    ('Орлов Михаил Тимурович','Менеджер по продажам', 10),
    ('Соколов Демид Артёмович','Оператор цифровой и широкоформатной печати', 1),
    ('Соколов Демид Артёмович','Оператор цифровой и широкоформатной печати', 7),
    ('Семенова Виктория Вадимовна','Директор', 2),
    ('Семенова Виктория Вадимовна','Директор', 3),
    ('Маркова Полина Александровна','Специалист по наружной рекламе', 2),
    ('Маркова Полина Александровна','Специалист по наружной рекламе', 3),
    ('Маслов Артём Павлович','Печатник-принтист', 4),
    ('Маслов Артём Павлович','Печатник-принтист', 5),
    ('Иванова Ника Ильинична','Дизайнер-верстальщик', 6),
    ('Кожевникова Виктория Фёдоровна','Художник-принтист', 4),
    ('Кожевникова Виктория Фёдоровна','Художник-принтист', 5),
    ('Еремин Иван Алексеевич','Специалист по цифровой печати',1),
    ('Лаврентьев Максим Никитич','Оператор цифровой фотопечати',8);

INSERT INTO
    `Products`(product_name,material,price,availability)
VALUES
    ('Визитки','Матовая бумага',6.853,1),
    ('Календари','Бумага мелованная 300 г',52.5,1),
    ('Книги и блокноты','Бумага от 80 - 300гр/м2',550.0,1),
    ('Брошюры и каталоги','Бумага 115 г',270.0,1),
    ('Офсетная печать','Бумага от 65- 300гр/м2',4.0,1),
    ('X-Стенд','Конструкция+рекламное поле',1350.0,1),
    ('Ростовая фигура','Гофрокартон, пластик',1990.0,1),
    ('Ширма','Фанера, пластик',27000.0,0),
    ('Таблички','Пластик 3 мм',250.0,1),
    ('Баннеры','Баннер ламинированный
330 г',540.5,1),
    ('Неоновая вывеска','Неоновые лампы',4300.0,1),
    ('Кружки','Белая кружка, принт',233.0,1),
    ('Значки','Закатный значок',80.0,1),
    ('Брелоки','Подвеска, пластик, металл',54.0,1),
    ('Медали','Акрил, пластик под золото или серебро',380.0,1),
    ('Футболки','Ткань (хлопок)',850.0,1),
    ('Флаги','Габардин
двухсторонний',302.0,1),
    ('Термонаклейки','Флекс, бархат, атлас',1500.0,0),
    ('Разработка дизайна','Консультация + разработка дизайна',9000.0,1),
    ('Внесение правок','Внесение правок после утверждения дизайна',2700.0,1),
    ('Интерьерная печать','Баннер литой 520 гр.',540.5,1),
    ('Холст','Холст, принт',890.0,1),
    ('Печать широкого формата','Баннер литой 520 гр.', 290.0,1),
    ('Фотоальбомы','2 разворота, фотобумага',500.0,1),
    ('Печать на досках','Дерево, белая подложка',1900.0,1),
    ('Фотографии на пенокартоне','Пенокартон',2100.0,0),
    ('Пакеты','Бумага, полиэтилен',82.5,1),
    ('Бирки и этикетки','Бумага мелованная',5.5,1),
    ('Дой-пак','Пакет металлизированный черный матовый',32.0,1),
    ('Печать на стекле и пластике','Банки, флаконы, цилиндрические тары',200.0,0),
    ('Упаковка под кондитерское изделие','Плотный картон',62.0,1),
    ('Кашированная коробка','Переплетный материал
эфалин с УФ печатью',480.0,1),
    ('Коробка крышка-дно','Картон 250-270 гр',85.1,1);

INSERT INTO
    `Orders`(id_client, id_product,date_regist, quantity,sum,id_department,status,deadline,id_executor)
VALUES
    (3,31,'2023-02-20',200,12400.0,10,1,'2023-03-01',2),
    (9,19,'2023-03-06',1,9000.0,6,1,'2023-03-19',7),
    (7,6,'2023-03-20',4,5400.0,2,1,'2023-04-01',4),
    (2,9,'2023-04-04',30,7500.0,3,1,'2023-04-07',4),
    (4,29,'2023-04-25',300,9600.0,9,1,'2023-05-10',1),
    (11,24,'2023-05-04',19,9500.0,8,1,'2023-05-20',10),
    (9,11,'2023-05-12',3,12900.0,3,1,'2023-05-22',5),
    (8,2,'2023-05-14',13,682.5,1,1,'2023-05-17',9),
    (5,1,'2023-06-10',150,1028.0,1,1,'2023-06-12',3),
    (11,16,'2023-06-11',1,850.0,5,1,'2023-06-18',6),
    (6,7,'2023-07-02',1,1990.0,2,1,'2023-07-09',5),
    (10,21, '2023-07-15',1,540.5,7,1,'2023-07-30',3),
    (12,13,'2023-07-17',6,450.5,4,0,'2023-07-21',6),
    (1,12,'2023-07-20',2,400.0,4,0,'2023-07-25',8);

-- ФУНКЦИИ
-- функция общей выручки за месяц

DELIMITER //
CREATE FUNCTION MonthlyRevenue(monthDate DATE)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE totalRevenue DECIMAL(10, 2);
    SET totalRevenue = (SELECT SUM(`sum`) FROM `Orders` WHERE MONTH(`date_regist`) = MONTH(monthDate));
    IF totalRevenue IS NULL THEN
        SET totalRevenue = 0;
    END IF;
    RETURN totalRevenue;
END //
DELIMITER ;

-- функция вывода ID заказов за указанный период времени

DELIMITER //
CREATE FUNCTION Ordersperiod(start_date DATE, end_date DATE)
RETURNS VARCHAR(255)
BEGIN
    DECLARE order_ids VARCHAR(255);
    SELECT GROUP_CONCAT(id) INTO order_ids
    FROM Orders
    WHERE date_regist >= start_date AND date_regist <= end_date;
    RETURN order_ids;
END //
DELIMITER ;

-- функция расчета средней стоимости заказа за всё время 
DELIMITER //
CREATE FUNCTION AverageOrderCost()
RETURNS DECIMAL(10,2)
BEGIN
  DECLARE average DECIMAL(10,2);
  SELECT AVG(`sum`) INTO average FROM `Orders`;
  RETURN average;
END //
DELIMITER ;

-- ТРИГГЕРЫ

-- -----------INSERT Customers
DROP TRIGGER IF EXISTS Customers_insert;
DELIMITER //
CREATE TRIGGER Customers_insert BEFORE INSERT ON Customers
FOR EACH ROW
BEGIN
	IF NEW.client_name NOT REGEXP '^[А-ЯЁа-яё]+' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат имени клиента';
	END IF;
	IF (!(NEW.phone_number REGEXP "^[+]7(9[0-9]{9})$")) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат номера телефона';
	END IF;
	IF NEW.email NOT REGEXP "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$" THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат email';
	END IF;
	If NEW.benefit != 0 AND NEW.benefit != 1 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недопустимое значение наличия или отсутствия льготы';
	END IF;
END//
DELIMITER ;

-- -----------DELETE Customers
DELIMITER //
CREATE TRIGGER Customers_delete
BEFORE DELETE ON Customers
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Нельзя удалить эти данные';
END//
DELIMITER ;

-- -----------INSERT Workers
DROP TRIGGER IF EXISTS Workers_insert;
DELIMITER //
CREATE TRIGGER Workers_insert BEFORE INSERT ON Workers
FOR EACH ROW
BEGIN
	IF NEW.name_work NOT REGEXP '^[А-ЯЁ][а-яё]+' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат имени сотрудника';
	END IF;
	IF NEW.post NOT REGEXP '^[А-ЯЁ][а-яё]+' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат должности сотрудника';
	END IF;
    IF NEW.id_dep <= 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Укажите ID отдела, где числится сотрудник';
	END IF;
END//
DELIMITER ;

-- -----------DELETE Workers
DELIMITER //
CREATE TRIGGER Workers_delete
BEFORE DELETE ON Workers
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Нельзя удалить эти данные';
END//
DELIMITER ;

-- -----------INSERT Departments
DROP TRIGGER IF EXISTS Departments_insert;
DELIMITER //
CREATE TRIGGER Departments_insert BEFORE INSERT ON Departments
FOR EACH ROW
BEGIN
IF NEW.title NOT REGEXP '^[А-ЯЁ][а-яё]+' THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат названия отдела';
END IF;
END//
DELIMITER ;

-- -----------DELETE Departments
DELIMITER //
CREATE TRIGGER Departments_delete
BEFORE DELETE ON Departments
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Нельзя удалить эти данные';
END//
DELIMITER ;

-- -----------INSERT Products
DELIMITER //
DROP TRIGGER IF EXISTS Products_insert;
CREATE TRIGGER Products_insert BEFORE INSERT ON Products
FOR EACH ROW
BEGIN
IF NEW.product_name NOT REGEXP '^[А-ЯЁ][а-яё]+' OR NEW.product_name = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат названия продукта или услуги';
END IF;
IF NEW.material NOT REGEXP '^[А-ЯЁ][а-яё]+' OR NEW.material = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат данных о материале продукта';
END IF;
IF NEW.price <= 0 OR NEW.price = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недопустимое значение цены товара';
END IF;
IF NEW.availability != 0 AND NEW.availability != 1 OR NEW.availability = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недопустимое значение наличия товара';
END IF;
END//
DELIMITER ;

-- -----------DELETE Products
DELIMITER //
CREATE TRIGGER Products_delete
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Нельзя удалить эти данные';
END//
DELIMITER ;

-- -----------INSERT Orders
DELIMITER //
DROP TRIGGER IF EXISTS Orders_insert;
CREATE TRIGGER Orders_insert BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
DECLARE product_avail INT;
SELECT availability INTO product_avail FROM Products WHERE id = NEW.id_product;
IF product_avail = false THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Товар не доступен';
END IF;
IF NEW.id_client = 0 or NEW.id_client = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Укажите ID клиента';
END IF;
IF NEW.id_product = 0 or NEW.id_product = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Укажите ID товара';
END IF;
IF NEW.date_regist NOT REGEXP '^2[0-9]{3}-[0-9]{2}-[0-9]{2}$' or NEW.date_regist = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный формат даты регистрации заказа';
END IF;
IF NEW.quantity < 1 or NEW.quantity = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Укажите количество необходимого товара';
END IF;
IF NEW.sum <= 0 or NEW.sum = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Укажите общую сумму заказа';
END IF;
IF NEW.id_department <= 0 or NEW.id_product = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Укажите отдел реализации заказа';
END IF;
IF NEW.status != 0 AND NEW.status != 1 or NEW.status = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недопустимое значение статуса готовности товара';
END IF;
IF NEW.date_regist > NEW.deadline OR NEW.deadline = null OR NEW.date_regist NOT REGEXP '^2[0-9]{3}-[0-9]{2}-[0-9]{2}$' THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недопустимое значение крайнего срока';
END IF;
IF NEW.id_product <= 0 or NEW.id_product = null THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Укажите ID исполнителя';
END IF;
END//
DELIMITER ;

-- -----------DELETE Orders
DELIMITER //
CREATE TRIGGER Orders_delete
BEFORE DELETE ON Orders
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Нельзя удалить эти данные';
END//
DELIMITER ;

-- -----------UPDATE Customers
DROP TRIGGER IF EXISTS Customers_update;
DELIMITER //
CREATE TRIGGER Customers_update
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
	SET NEW.client_name = IFNULL(NEW.client_name, OLD.phone_number, OLD.email, OLD.benefit);
	SET NEW.phone_number = IFNULL(NEW.phone_number, OLD.client_name, OLD.email, OLD.benefit);
    SET NEW.email = IFNULL(NEW.email, OLD.client_name, OLD.phone_number, OLD.benefit);
    SET NEW.benefit = IFNULL(NEW.benefit, OLD.client_name, OLD.phone_number, OLD.email);
END//
DELIMITER ;

-- -----------UPDATE Workers
DROP TRIGGER IF EXISTS Workers_update;
DELIMITER //
CREATE TRIGGER  Workers_update
BEFORE UPDATE ON Workers
FOR EACH ROW
BEGIN
	SET NEW.name_work = IFNULL(NEW.name_work, OLD.post, OLD.id_dep);
	SET NEW.post = IFNULL(NEW.post, OLD.name_work, OLD.id_dep);
    SET NEW.id_dep = IFNULL(NEW.id_dep, OLD.name_work, OLD.post);
END//
DELIMITER ;

-- -----------UPDATE Departments
DROP TRIGGER IF EXISTS Departments_update;
DELIMITER //
CREATE TRIGGER  Departments_update
BEFORE UPDATE ON Departments
FOR EACH ROW
BEGIN
	SET NEW.title = IFNULL(NEW.title);
END//
DELIMITER ;

-- -----------UPDATE Products
DROP TRIGGER IF EXISTS Products_update;
DELIMITER //
CREATE TRIGGER  Products_update
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
	SET NEW.product_name = IFNULL(NEW.product_name, OLD.material, OLD.price, OLD.availability);
    SET NEW.material = IFNULL(NEW.material, OLD.product_name, OLD.price, OLD.availability);
    SET NEW.price = IFNULL(NEW.price, OLD.product_name, OLD.material, OLD.availability);
    SET NEW.availability = IFNULL(NEW.availability, OLD.product_name, OLD.material, OLD.price);
END//
DELIMITER ;

-- -----------UPDATE Orders
DROP TRIGGER IF EXISTS Orders_update;
DELIMITER //
CREATE TRIGGER Orders_update
BEFORE UPDATE ON Orders
FOR EACH ROW
BEGIN
    SET NEW.status = IFNULL(NEW.status, OLD.id_product, OLD.date_regist, OLD.quantity, OLD.sum, OLD.id_department, OLD.id_client, OLD.deadline, OLD.id_executor);
    SET NEW.deadline = IFNULL(NEW.deadline, OLD.id_client, OLD.date_regist, OLD.quantity, OLD.sum, OLD.id_department, OLD.status, OLD.id_product, OLD.id_executor);
    SET NEW.id_executor = IFNULL(NEW.id_executor, OLD.id_client, OLD.date_regist, OLD.quantity, OLD.sum, OLD.id_department, OLD.status, OLD.id_product, OLD.deadline);
END//
DELIMITER ;
