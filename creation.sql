DROP SCHEMA homework CASCADE;
CREATE SCHEMA homework;
CREATE TABLE homework.area (
    area_id      integer PRIMARY KEY,
    area_name    text NOT NULL
);
CREATE TABLE homework.employer (
    employer_id      SERIAL PRIMARY KEY,
    employer_name    text NOT NULL,
    area_id          integer NOT NULL REFERENCES homework.area (area_id) ON DELETE CASCADE
);
CREATE TABLE homework.vacancy (
    vacancy_id            SERIAL PRIMARY KEY,
    employer_id           integer NOT NULL REFERENCES homework.employer (employer_id) ON DELETE CASCADE,
    position_name         text NOT NULL,
    compensation_from     integer,
    compensation_to       integer,
    compensation_gross    boolean,
    created_at            timestamp DEFAULT now()
);
CREATE TABLE homework.applicant (
    applicant_id      SERIAL PRIMARY KEY,
    applicant_name    text NOT NULL,
    area_id           integer REFERENCES homework.area (area_id) ON DELETE SET NULL
);
CREATE TABLE homework.resume (
    resume_id             SERIAL PRIMARY KEY,
    applicant_id          integer NOT NULL REFERENCES homework.applicant (applicant_id) ON DELETE CASCADE,
    position_objective    text
);
CREATE TABLE homework.vacancy_resume (
    relation_id    SERIAL PRIMARY KEY,
    vacancy_id     integer NOT NULL REFERENCES homework.vacancy (vacancy_id) ON DELETE CASCADE,
    resume_id      integer NOT NULL REFERENCES homework.resume (resume_id) ON DELETE CASCADE,
    created_at     timestamp DEFAULT now(),
    CONSTRAINT unique_relations UNIQUE(vacancy_id, resume_id)
);
INSERT INTO homework.area
VALUES (1, 'Москва'),
       (104, 'Челябинск'),
       (2, 'Санкт-Петербург'),
       (39, 'Нальчик'),
       (1002, 'Минск'),
       (76, 'Ростов-на-Дону'),
       (1399, 'Магнитогорск'),
       (2759, 'Ташкент'),
       (3, 'Екатеринбург'),
       (117, 'Днепр (Днепропетровск)'),
       (1641, 'Набережные Челны'),
       (78, 'Самара'),
       (41, 'Калининград'),
       (236, 'Кипр'),
       (88, 'Казань'),
       (65, 'Нидерланды'),
       (53, 'Краснодар'),
       (68, 'Омск'),
       (49, 'Киров (Кировская область)'),
       (115, 'Киев'),
       (4, 'Новосибирск'),
       (99, 'Уфа'),
       (130, 'Севастополь'),
       (1007, 'Брест'),
       (98, 'Ульяновск'),
       (19, 'Брянск');
INSERT INTO homework.employer
VALUES (4857606, 'Luminati', 1),
       (2402402, 'Зет-Медиа', 104),
       (5073153, 'Сетап.Ру', 1),
       (1752125, 'Plumsail', 2),
       (2009224, 'Insilico Medicine', 1),
       (3133610, 'ПрограммСистемс', 39),
       (4932875, 'IronMathTeam', 1),
       (3146495, 'Биггико', 1002),
       (4301676, 'Peter Partner', 2),
       (2699976, 'Смартплеер', 1),
       (3832298, 'Convermax', 76),
       (2712047, 'MEDODS', 1399),
       (542183, 'ALM Works', 2),
       (2014495, 'ALEX INFORMATION TECHNOLOGY', 2759),
       (2675795, 'Перформикс', 1),
       (4641786, 'DNA Team', 2),
       (2288307, 'Request Design', 1),
       (1550156, 'Россайт', 2),
       (4596113, 'Фабрика Решений', 1),
       (1760404, 'Ай Пи Секьюритиз', 1),
       (4166575, 'Helastel', 2),
       (4295296, 'Софтвайс', 2),
       (3891965, 'NVI Solutions LLC', 1),
       (17229, 'Абак-Пресс', 3),
       (890621, 'Акушерство.ru, Компания', 1),
       (2639844, 'M2E', 117),
       (4161, 'Группа компаний «Триумф»', 1),
       (3292790, 'Nord.Codes', 2),
       (5074328, 'Leadely', 1641),
       (6198, 'CQG', 78),
       (4151200, 'Метр Квадратный', 1),
       (653937, 'Прикладные технологии', 104),
       (2590553, 'INGURU.RU', 88),
       (3025777, 'ANNA FINANCIAL SERVICES', 1),
       (2675286, 'Хоменко Г.И.', 1),
       (120618, 'ETNA', 2),
       (4482717, '8й Мост', 41),
       (4792339, 'Liepa Limited', 236),
       (3635851, 'МС-ВИАН', 2),
       (3930814, 'Abelohost BV', 65),
       (1536449, '4xxi', 2),
       (1115346, 'Крит', 1),
       (1545815, 'МедРейтинг', 53),
       (683000, 'Николь, Торговая фирма', 68),
       (2600718, 'AdAurum', 2),
       (3361389, 'WAZZUP', 1),
       (4417750, 'Патентное бюро Железно', 49),
       (2569622, 'Ньюити', 1),
       (5042493, 'HUTOVSKA', 115),
       (1738507, 'Soshace', 2),
       (5086502, 'ВИВАДИЯ', 1002),
       (5039640, 'Бсп', 2),
       (1901449, 'ТЕК РАУНД СПБ', 2),
       (4504791, 'Инноскрипта Интернешнл', 2),
       (3266823, 'Tango Me', 2),
       (1570577, 'Алеф ван лтд', 4),
       (2092867, 'BeeJee', 1),
       (1407995, 'Хэндисофт', 1),
       (741772, 'SIMAI', 99),
       (2898081, 'TR Logic LLC', 1),
       (247055, 'Студия Клондайк', 1),
       (5033181, 'VIEWGIN', 2),
       (4006, 'QSOFT', 1),
       (4457782, 'BookedBy', 1),
       (674532, 'CyberHULL (ООО Киберкор)', 1),
       (850334, 'ОнТаргет ЛАБС', 2),
       (78638, 'Тинькофф', 2),
       (5089068, 'Global Staff', 115),
       (4727351, 'Вангард Софт', 53),
       (407, 'Гарант', 1),
       (5068891, 'Граммаков Денис Евгеньевич', 2),
       (2155573, 'ВилайнТв', 4),
       (3598220, 'Нова', 1),
       (28275, 'B2B-Center', 1),
       (1766025, 'Крым Диджитал Груп', 130),
       (1045351, 'И-Экс-Пи Кэпитал', 1002),
       (3362417, 'ГЛОБАЛТРАК МЕНЕДЖМЕНТ', 4),
       (1122654, 'Информационные технологии для жизни', 1007),
       (2500202, 'Комс', 1),
       (2772682, 'Credit.Club', 3),
       (81778, 'Ринет', 4),
       (816284, 'Bright Pattern, Inc', 1),
       (1498795, 'AdvantShop.NET', 98),
       (2433177, 'ANY.RUN', 98),
       (2851774, 'Симпл Технолоджи', 19),
       (49569, 'Расчетные системы', 2),
       (3665152, 'Брефи маркетинг', 1),
       (1528416, 'Perfekt Pty Ltd', 3),
       (2020870, 'Информационные Решения Сибири', 4),
       (219661, 'АРМО, ГК', 1);
INSERT INTO homework.vacancy
VALUES (40628011, 4857606, 'Разработчик full-stack javascript (remote)', 480000, 510000, Null, '2020-12-07T12:02:55+0300'),
       (40778051, 2402402, 'Программист JavaScript (Front-end) Junior / Начинающий JavaScript разработчик', Null, Null, Null, '2020-12-06T12:47:05+0300'),
       (40780678, 5073153, 'Фронтенд-разработчик (Junior, Middle)', 40000, 60000, Null, '2020-12-06T13:59:14+0300'),
       (40679871, 1752125, 'Frontend Developer Vue, JavaScript/TypeScript', 120000, 200000, Null, '2020-12-06T14:06:52+0300'),
       (40287973, 2009224, 'Frontend-разработчик (React)', 160000, 220000, Null, '2020-12-06T11:22:18+0300'),
       (40846545, 3133610, 'Начинающий веб программист \ Junior web developer', 60000, 200000, True, '2020-12-07T18:53:44+0300'),
       (40413472, 4932875, 'Фронтенд/Frontend разработчик на React (JavaScript)', 100000, 180000, Null, '2020-12-06T15:47:35+0300'),
       (40843244, 3146495, 'Junior Frontend Developer', 500, 700, Null, '2020-12-07T16:39:12+0300'),
       (40613847, 4301676, 'JavaScript Developer (Junior)', 40000, 60000, Null, '2020-12-06T16:55:48+0300'),
       (40220759, 2699976, 'JavaScript разработчик', 50000, 200000, Null, '2020-12-07T21:47:57+0300'),
       (40339679, 3832298, 'Начинающий фронтенд разработчик', 35000, Null, Null, '2020-12-08T10:18:21+0300'),
       (39654094, 2712047, 'Junior Frontend Developer', 30000, Null, Null, '2020-12-05T14:38:49+0300'),
       (37250359, 542183, 'Frontend Developer', 200000, Null, Null, '2020-12-08T01:37:25+0300'),
       (40289192, 2014495, 'Front-end разработчик', 4000000, 8000000, Null, '2020-12-06T01:24:45+0300'),
       (40442366, 2675795, 'Javascript разработчик', 140000, 220000, Null, '2020-12-07T19:35:31+0300'),
       (40842599, 4641786, 'Frontend-разработчик (React)', 120000, 160000, Null, '2020-12-07T16:18:38+0300'),
       (38451240, 2288307, 'Junior front-end разработчик', 30000, Null, Null, '2020-12-07T11:38:31+0300'),
       (40723760, 1550156, 'QA тестировщик (web, html, функциональное и ручное тестирование)', 56000, 56000, Null, '2020-12-07T10:26:45+0300'),
       (40557633, 4596113, 'Стажер Frontend - разработчик (Vue.js/Nuxt)', 40000, 80000, Null, '2020-12-08T17:27:20+0300'),
       (40641671, 1760404, 'Front-End Developer (Vue.js)', 2500, Null, Null, '2020-12-07T19:49:01+0300'),
       (40350471, 4166575, 'Front-end developer React JS (удаленно)', 150000, Null, True, '2020-12-08T14:33:30+0300'),
       (39934684, 4295296, 'Middle Frontend Developer / Разработчик JavaScript', 140000, Null, Null, '2020-12-07T15:01:58+0300'),
       (40576398, 3891965, 'Middle Front-end JavaScript Developer', 160000, Null, Null, '2020-12-08T12:07:20+0300'),
       (40854450, 17229, 'HTML-верстальщик', Null, Null, Null, '2020-12-08T09:15:10+0300'),
       (40641624, 1760404, 'Верстальщик', 2500, Null, Null, '2020-12-07T19:43:18+0300'),
       (40828195, 890621, 'PHP-программист (удаленно)', 170000, Null, Null, '2020-12-07T11:00:00+0300'),
       (40505878, 2639844, 'Front End Developer (JavaScript)', Null, Null, Null, '2020-12-06T17:02:14+0300'),
       (36692912, 4161, 'JavaScript-разработчик', 100000, 200000, Null, '2020-12-07T09:28:55+0300'),
       (40436955, 3292790, 'Программист TypeScript / JavaScript', 170000, 300000, True, '2020-12-07T15:05:23+0300'),
       (40829928, 5074328, 'Front-End Разработчик Cтажёр', Null, Null, Null, '2020-12-07T11:36:36+0300'),
       (40792516, 6198, 'Junior Front-end Developer', Null, Null, Null, '2020-12-06T18:13:26+0300'),
       (40629515, 4151200, 'Frontend разработчик (react верстальщик)', 100000, Null, Null, '2020-12-07T12:43:13+0300'),
       (39146059, 653937, 'Разработчик Front-end/JavaScript (Middle)', 90000, Null, True, '2020-12-06T06:38:42+0300'),
       (40830930, 2590553, 'Front-end разработчик (React)', 130000, 190000, Null, '2020-12-07T12:00:17+0300'),
       (40734522, 3025777, 'Frontend-разработчик middle level', 200000, 250000, Null, '2020-12-07T15:34:39+0300'),
       (40618312, 2675286, 'TeamLead JavaScript (React)', 250000, 300000, Null, '2020-12-07T02:12:51+0300'),
       (40615509, 120618, 'Front-end developer', 160000, 230000, True, '2020-12-06T17:54:16+0300'),
       (40358010, 4482717, 'JavaScript разработчик', 100000, Null, Null, '2020-12-08T19:07:39+0300'),
       (39835281, 4792339, 'Frontend-разработчик', 2500, 4000, Null, '2020-12-08T11:04:26+0300'),
       (40839584, 3635851, 'HTML-верстальщик / Web-разработчик', 80000, 1000000, Null, '2020-12-07T15:12:55+0300'),
       (40404479, 3930814, 'PHP Laravel Developer + JS', 1200, 4000, Null, '2020-12-07T16:24:49+0300'),
       (40385675, 1536449, 'Frontend-разработчик (JavaScript)', 140000, Null, Null, '2020-12-06T19:44:44+0300'),
       (40610943, 1115346, 'Web-разработчик React', 200000, Null, Null, '2020-12-06T15:29:11+0300'),
       (40476352, 1545815, 'Junior Python разработчик (Django)', 40000, Null, True, '2020-12-07T09:10:08+0300'),
       (38927786, 683000, 'Frontend web developer', 300000, Null, Null, '2020-12-08T06:17:21+0300'),
       (40812870, 2600718, 'Веб-разработчик (Junior)', 30000, 40000, Null, '2020-12-07T17:55:21+0300'),
       (40604273, 3361389, 'Frontend разработчик (Vue.js)', 80000, Null, Null, '2020-12-06T12:37:03+0300'),
       (40611433, 4417750, 'Верстальщик (frontend-разработчик)', 35000, 40000, Null, '2020-12-06T15:41:06+0300'),
       (40289520, 2569622, 'Senior/Middle frontend-разработчик (Angular 2+)', 180000, 230000, Null, '2020-12-06T11:56:51+0300'),
       (40452293, 5042493, 'Backend Javascript Developer', 3500, 4200, True, '2020-12-07T20:27:32+0300'),
       (40317295, 1738507, 'Front-end developer with experience in React or Angular', 3500, 5000, Null, '2020-12-07T11:16:50+0300'),
       (40317315, 1738507, 'Front-end developer with experience in React or Angular', 3500, 5000, Null, '2020-12-07T11:17:27+0300'),
       (40835739, 5086502, 'JS Разработчик (React/Redux/TS)', 700, 1500, Null, '2020-12-07T14:04:38+0300'),
       (40696030, 5039640, 'Frontend-разработчик (Vue.js + Canvas)', 180000, 200000, True, '2020-12-06T09:09:18+0300'),
       (40555943, 1901449, 'JavaScript developer (front-end and back-end, full stack)', Null, Null, Null, '2020-12-08T16:16:12+0300'),
       (40828065, 4504791, 'Front-end разработчик (React)', 140000, 200000, True, '2020-12-07T10:57:03+0300'),
       (40303804, 3266823, 'Frontend разработчик (JavaScript)', Null, 4500, True, '2020-12-06T17:33:13+0300'),
       (40744960, 1570577, 'Веб-программист', 50000, 70000, Null, '2020-12-08T09:27:18+0300'),
       (40654605, 3266823, 'Frontend разработчик (React.js)', Null, 4500, True, '2020-12-08T13:21:47+0300'),
       (40752049, 2092867, 'Web-разработчик (Node.js, React)', 800, 3000, Null, '2020-12-08T12:17:44+0300'),
       (40575940, 1407995, 'Frontend разработчик (Javascript, React)', Null, Null, Null, '2020-12-08T11:54:56+0300'),
       (40872341, 741772, 'Web-разработчик/Веб-программист', 40500, 78000, True, '2020-12-08T16:35:17+0300'),
       (40793452, 2898081, 'Верстальщик', 1500, Null, Null, '2020-12-06T19:38:31+0300'),
       (40453061, 247055, 'Frontend-разработчик (Vue.js / Bitrix)', 100000, 200000, Null, '2020-12-07T22:31:55+0300'),
       (40404470, 5033181, 'Frontend-разработчик (React)', 80000, 160000, Null, '2020-12-07T16:24:22+0300'),
       (40703684, 4006, 'HTML - верстальщик / Frontend - разработчик', Null, Null, Null, '2020-12-06T12:14:55+0300'),
       (40408494, 4457782, 'Senior Front-end Developer (Ведущий фронт-энд разработчик)', 3500, 5500, True, '2020-12-07T20:47:50+0300'),
       (40875554, 674532, 'JavaScript Frontend Developer', Null, Null, Null, '2020-12-08T18:33:41+0300'),
       (40680608, 850334, 'Full stack (Node.js, React) developer', 3500, 5000, True, '2020-12-06T14:30:58+0300'),
       (40826349, 78638, 'QA Full stack (JavaScript)', Null, Null, Null, '2020-12-07T10:14:49+0300'),
       (40876149, 5089068, 'Full Stack Angular Developer', 2000, 5000, Null, '2020-12-08T18:57:31+0300'),
       (40833368, 4727351, 'Front-end разработчик React', 110000, Null, Null, '2020-12-07T12:57:15+0300'),
       (38314860, 407, 'Web-разработчик (Javascript)', 81000, 115000, True, '2020-12-07T12:57:00+0300'),
       (40684597, 5068891, 'Веб-разработчик', 24000, Null, Null, '2020-12-06T16:52:01+0300'),
       (40384452, 2898081, 'Front-End Developer (Vue.js)', 2000, Null, Null, '2020-12-06T18:00:35+0300'),
       (37250357, 542183, 'Senior Frontend Developer', 239000, Null, Null, '2020-12-08T01:37:24+0300'),
       (39860273, 2155573, 'Frontend-разработчик (React)', 120000, Null, Null, '2020-12-07T12:49:15+0300'),
       (40756734, 3598220, 'Senior Lead Front / Сеньер фронтенд JavaScript (Vue)', 200000, 250000, True, '2020-12-08T14:20:17+0300'),
       (40045135, 28275, 'Front-end разработчик (Vue.js)', Null, 180000, Null, '2020-12-07T17:37:48+0300'),
       (40839585, 3635851, 'HTML-верстальщик / Web-разработчик', 80000, 1000000, Null, '2020-12-07T15:12:55+0300'),
       (40865663, 1766025, 'Junior Front-End (React.js) Developer', Null, Null, Null, '2020-12-08T13:19:42+0300'),
       (40675270, 1045351, 'HTML/CSS разработчик', Null, Null, Null, '2020-12-06T11:40:51+0300'),
       (40732541, 3362417, 'Frontend-разработчик', 140000, Null, Null, '2020-12-07T14:36:49+0300'),
       (40847026, 1122654, 'Web-разработчик', 256, 2560, True, '2020-12-07T19:51:24+0300'),
       (40830947, 2590553, 'Front-end разработчик (React)', 130000, 190000, Null, '2020-12-07T12:00:42+0300'),
       (40697074, 2500202, 'Front-end разработчик (Vue)', 130000, 180000, Null, '2020-12-06T09:42:23+0300'),
       (39806266, 2772682, 'Frontend-разработчик (JavaScript)', Null, Null, Null, '2020-12-07T13:01:03+0300'),
       (40624668, 81778, 'Web-программист (Junior/начинающий)', Null, Null, Null, '2020-12-07T10:33:01+0300'),
       (40424708, 816284, 'Frontend developer (Javascript, React)', Null, Null, Null, '2020-12-07T11:23:14+0300'),
       (40831050, 1498795, 'Стажер Frontend разработчик / Верстальщик (в офисе компании)', Null, 35000, True, '2020-12-07T12:03:23+0300'),
       (34445650, 2433177, 'Backend Javascript Developer (Node.JS)', 130000, 200000, Null, '2020-12-08T08:17:42+0300'),
       (39195280, 2851774, 'Full-stack Web разработчик PHP / JS', 100000, 150000, Null, '2020-12-06T17:37:43+0300'),
       (40313114, 49569, 'Middle JavaScript разработчик', 130000, Null, Null, '2020-12-07T09:58:20+0300'),
       (40612182, 3665152, 'Фронтенд Разработчик / Frontend Developer', 60000, 60000, Null, '2020-12-06T16:04:19+0300'),
       (39145709, 653937, 'Разработчик Front-end/JavaScript (Middle)', 90000, Null, True, '2020-12-06T06:38:42+0300'),
       (40731848, 1528416, 'Middle JavaScript / Frontend Developer', 80000, 180000, Null, '2020-12-07T14:16:51+0300'),
       (40610564, 2020870, 'Программист JS (java script)', 45000, 90000, Null, '2020-12-06T15:19:07+0300'),
       (40820387, 3635851, 'HTML-верстальщик / Web-разработчик', 80000, Null, True, '2020-12-07T00:01:14+0300'),
       (40731777, 1528416, 'Middle JavaScript / Frontend Developer', 80000, 180000, Null, '2020-12-07T14:15:04+0300'),
       (40201445, 219661, 'Junior программист JavaScript', 55000, 70000, Null, '2020-12-07T09:10:20+0300');
INSERT INTO homework.applicant
VALUES (0, 'Harry_S._Truman_Jimmy_Carter', 1),
       (1, 'Barack_Obama_Thomas_Jefferson', 104),
       (2, 'William_Howard_Taft_George_H._W._Bush', 1),
       (3, 'Warren_G._Harding_Woodrow_Wilson', 2),
       (4, 'George_Washington_Gerald_Ford', 1),
       (5, 'Jimmy_Carter_John_F._Kennedy', 39),
       (6, 'Richard_Nixon_James_Madison', 1),
       (7, 'Harry_S._Truman_John_Tyler', 1002),
       (8, 'James_K._Polk_Calvin_Coolidge', 2),
       (9, 'Lyndon_B._Johnson_Franklin_Pierce', 1),
       (10, 'George_W._Bush_Bill_Clinton', 76),
       (11, 'Thomas_Jefferson_Warren_G._Harding', 1399),
       (12, 'Millard_Fillmore_Abraham_Lincoln', 2),
       (13, 'George_W._Bush_James_K._Polk', 2759),
       (14, 'William_Henry_Harrison_Dwight_D._Eisenhower', 1),
       (15, 'Ronald_Reagan_Martin_Van_Buren', 2),
       (16, 'Jimmy_Carter_Barack_Obama', 1),
       (17, 'Chester_A._Arthur_John_F._Kennedy', 2),
       (18, 'Theodore_Roosevelt_Jimmy_Carter', 1),
       (19, 'Ulysses_S._Grant_Thomas_Jefferson', 1),
       (20, 'George_Washington_George_Washington', 2),
       (21, 'Martin_Van_Buren_Grover_Cleveland', 2),
       (22, 'William_Howard_Taft_Andrew_Johnson', 1),
       (23, 'Franklin_D._Roosevelt_William_Henry_Harrison', 3),
       (24, 'Grover_Cleveland_Zachary_Taylor', 1),
       (25, 'Ulysses_S._Grant_Theodore_Roosevelt', 1),
       (26, 'James_K._Polk_Franklin_Pierce', 117),
       (27, 'Lyndon_B._Johnson_Millard_Fillmore', 1),
       (28, 'Bill_Clinton_John_Tyler', 2),
       (29, 'James_Monroe_Woodrow_Wilson', 1641),
       (30, 'James_Buchanan_Jimmy_Carter', 78),
       (31, 'Warren_G._Harding_Woodrow_Wilson', 1),
       (32, 'Benjamin_Harrison_Chester_A._Arthur', 3),
       (33, 'Barack_Obama_John_Quincy_Adams', 1),
       (34, 'Dwight_D._Eisenhower_Thomas_Jefferson', 1),
       (35, 'Thomas_Jefferson_Ulysses_S._Grant', 1),
       (36, 'Theodore_Roosevelt_George_H._W._Bush', 2),
       (37, 'Benjamin_Harrison_Dwight_D._Eisenhower', 41),
       (38, 'George_H._W._Bush_Gerald_Ford', 236),
       (39, 'Franklin_Pierce_Calvin_Coolidge', 88),
       (40, 'Rutherford_B._Hayes_Richard_Nixon', 65),
       (41, 'Richard_Nixon_Chester_A._Arthur', 2),
       (42, 'Warren_G._Harding_Bill_Clinton', 1),
       (43, 'Richard_Nixon_Ulysses_S._Grant', 53),
       (44, 'William_Howard_Taft_Bill_Clinton', 68),
       (45, 'Franklin_Pierce_Ronald_Reagan', 2),
       (46, 'Herbert_Hoover_Herbert_Hoover', 1),
       (47, 'Ronald_Reagan_John_Quincy_Adams', 49),
       (48, 'George_H._W._Bush_Gerald_Ford', 1),
       (49, 'Dwight_D._Eisenhower_William_Howard_Taft', 115);
INSERT INTO homework.resume
VALUES (0, 49, 'Разработчик full-stack javascript (remote)'),
       (1, 48, 'Программист JavaScript (Front-end) Junior / Начинающий JavaScript разработчик'),
       (2, 47, 'Фронтенд-разработчик (Junior, Middle)'),
       (3, 46, 'Frontend Developer Vue, JavaScript/TypeScript'),
       (4, 45, 'Frontend-разработчик (React)'),
       (5, 44, 'Начинающий веб программист \ Junior web developer'),
       (6, 43, 'Фронтенд/Frontend разработчик на React (JavaScript)'),
       (7, 42, 'Junior Frontend Developer'),
       (8, 41, 'JavaScript Developer (Junior)'),
       (9, 40, 'JavaScript разработчик'),
       (10, 39, 'Начинающий фронтенд разработчик'),
       (11, 38, 'Junior Frontend Developer'),
       (12, 37, 'Frontend Developer'),
       (13, 36, 'Front-end разработчик'),
       (14, 35, 'Javascript разработчик'),
       (15, 34, 'Frontend-разработчик (React)'),
       (16, 33, 'Junior front-end разработчик'),
       (17, 32, 'QA тестировщик (web, html, функциональное и ручное тестирование)'),
       (18, 31, 'Стажер Frontend - разработчик (Vue.js/Nuxt)'),
       (19, 30, 'Front-End Developer (Vue.js)'),
       (20, 29, 'Front-end developer React JS (удаленно)'),
       (21, 28, 'Middle Frontend Developer / Разработчик JavaScript'),
       (22, 27, 'Middle Front-end JavaScript Developer'),
       (23, 26, 'HTML-верстальщик'),
       (24, 25, 'Верстальщик'),
       (25, 24, 'PHP-программист (удаленно)'),
       (26, 23, 'Front End Developer (JavaScript)'),
       (27, 22, 'JavaScript-разработчик'),
       (28, 21, 'Программист TypeScript / JavaScript'),
       (29, 20, 'Front-End Разработчик Cтажёр'),
       (30, 19, 'Junior Front-end Developer'),
       (31, 18, 'Frontend разработчик (react верстальщик)'),
       (32, 17, 'Разработчик Front-end/JavaScript (Middle)'),
       (33, 16, 'Front-end разработчик (React)'),
       (34, 15, 'Frontend-разработчик middle level'),
       (35, 14, 'TeamLead JavaScript (React)'),
       (36, 13, 'Front-end developer'),
       (37, 12, 'JavaScript разработчик'),
       (38, 11, 'Frontend-разработчик'),
       (39, 10, 'HTML-верстальщик / Web-разработчик'),
       (40, 9, 'PHP Laravel Developer + JS'),
       (41, 8, 'Frontend-разработчик (JavaScript)'),
       (42, 7, 'Web-разработчик React'),
       (43, 6, 'Junior Python разработчик (Django)'),
       (44, 5, 'Frontend web developer'),
       (45, 4, 'Веб-разработчик (Junior)'),
       (46, 3, 'Frontend разработчик (Vue.js)'),
       (47, 2, 'Верстальщик (frontend-разработчик)'),
       (48, 1, 'Senior/Middle frontend-разработчик (Angular 2+)');
INSERT INTO homework.vacancy_resume(vacancy_id, resume_id, created_at)
VALUES (40628011, 42, '2020-12-10T00:02:55'),
       (40628011, 5, '2020-12-24T04:02:55'),
       (40778051, 3, '2020-12-26T19:47:05'),
       (40778051, 20, '2020-12-17T08:47:05'),
       (40778051, 12, '2020-12-19T16:47:05'),
       (40778051, 38, '2020-12-27T07:47:05'),
       (40780678, 17, '2020-12-15T12:59:14'),
       (40780678, 13, '2020-12-13T21:59:14'),
       (40679871, 34, '2020-12-20T08:06:52'),
       (40679871, 2, '2020-12-22T14:06:52'),
       (40679871, 36, '2020-12-08T13:06:52'),
       (40679871, 21, '2020-12-22T08:06:52'),
       (40287973, 27, '2020-12-24T20:22:18'),
       (40287973, 0, '2020-12-08T05:22:18'),
       (40287973, 35, '2020-12-08T06:22:18'),
       (40287973, 39, '2020-12-06T17:22:18'),
       (40846545, 32, '2020-12-13T07:53:44'),
       (40846545, 29, '2020-12-22T01:53:44'),
       (40413472, 17, '2020-12-18T12:47:35'),
       (40413472, 19, '2020-12-23T23:47:35'),
       (40413472, 7, '2020-12-07T22:47:35'),
       (40413472, 41, '2020-12-22T06:47:35'),
       (40843244, 35, '2020-12-07T16:39:12'),
       (40843244, 20, '2020-12-11T17:39:12'),
       (40843244, 15, '2020-12-14T09:39:12'),
       (40613847, 9, '2020-12-24T15:55:48'),
       (40613847, 18, '2020-12-10T18:55:48'),
       (40613847, 5, '2020-12-10T08:55:48'),
       (40220759, 35, '2020-12-08T14:47:57'),
       (40339679, 25, '2020-12-16T19:18:21'),
       (40339679, 29, '2020-12-09T11:18:21'),
       (39654094, 0, '2020-12-25T10:38:49'),
       (37250359, 33, '2020-12-15T00:37:25'),
       (37250359, 2, '2020-12-14T18:37:25'),
       (37250359, 35, '2020-12-14T12:37:25'),
       (37250359, 1, '2020-12-08T17:37:25'),
       (40289192, 38, '2020-12-06T14:24:45'),
       (40289192, 17, '2020-12-11T03:24:45'),
       (40289192, 1, '2020-12-14T23:24:45'),
       (40442366, 38, '2020-12-22T23:35:31'),
       (40842599, 24, '2020-12-27T10:18:38'),
       (40842599, 40, '2020-12-13T01:18:38'),
       (40842599, 29, '2020-12-20T08:18:38'),
       (38451240, 23, '2020-12-11T19:38:31'),
       (40723760, 32, '2020-12-12T11:26:45'),
       (40723760, 21, '2020-12-11T19:26:45'),
       (40557633, 9, '2020-12-08T18:27:20'),
       (40557633, 11, '2020-12-10T12:27:20'),
       (40557633, 28, '2020-12-26T13:27:20'),
       (40557633, 15, '2020-12-10T05:27:20'),
       (40641671, 25, '2020-12-17T13:49:01'),
       (40350471, 41, '2020-12-19T04:33:30'),
       (39934684, 17, '2020-12-27T14:01:58'),
       (40576398, 10, '2020-12-15T15:07:20'),
       (40576398, 5, '2020-12-13T14:07:20'),
       (40576398, 31, '2020-12-23T06:07:20'),
       (40854450, 27, '2020-12-19T10:15:10'),
       (40854450, 35, '2020-12-17T18:15:10'),
       (40854450, 12, '2020-12-26T14:15:10'),
       (40641624, 24, '2020-12-23T07:43:18'),
       (40641624, 22, '2020-12-24T05:43:18'),
       (40828195, 14, '2020-12-09T12:00:00'),
       (40828195, 15, '2020-12-13T09:00:00'),
       (40505878, 14, '2020-12-21T03:02:14'),
       (36692912, 41, '2020-12-14T11:28:55'),
       (36692912, 42, '2020-12-18T12:28:55'),
       (36692912, 43, '2020-12-13T06:28:55'),
       (36692912, 35, '2020-12-12T05:28:55'),
       (40436955, 18, '2020-12-20T03:05:23'),
       (40436955, 37, '2020-12-08T23:05:23'),
       (40829928, 33, '2020-12-17T16:36:36'),
       (40829928, 12, '2020-12-19T02:36:36'),
       (40829928, 6, '2020-12-24T13:36:36'),
       (40829928, 15, '2020-12-08T01:36:36'),
       (40792516, 20, '2020-12-13T03:13:26'),
       (40792516, 39, '2020-12-13T07:13:26'),
       (40792516, 31, '2020-12-10T12:13:26'),
       (40629515, 26, '2020-12-10T01:43:13'),
       (40629515, 11, '2020-12-20T23:43:13'),
       (39146059, 3, '2020-12-18T03:38:42'),
       (39146059, 36, '2020-12-10T16:38:42'),
       (39146059, 29, '2020-12-26T00:38:42'),
       (39146059, 39, '2020-12-09T02:38:42'),
       (40830930, 32, '2020-12-11T07:00:17'),
       (40830930, 35, '2020-12-19T22:00:17'),
       (40734522, 19, '2020-12-28T00:34:39'),
       (40618312, 1, '2020-12-12T07:12:51'),
       (40618312, 42, '2020-12-12T08:12:51'),
       (40618312, 43, '2020-12-24T16:12:51'),
       (40618312, 6, '2020-12-14T00:12:51'),
       (40615509, 42, '2020-12-13T16:54:16'),
       (40615509, 35, '2020-12-23T12:54:16'),
       (40358010, 41, '2020-12-28T20:07:39'),
       (40358010, 45, '2020-12-20T08:07:39'),
       (39835281, 40, '2020-12-09T01:04:26'),
       (39835281, 12, '2020-12-12T23:04:26'),
       (40839584, 24, '2020-12-16T14:12:55'),
       (40839584, 42, '2020-12-11T15:12:55'),
       (40839584, 3, '2020-12-21T19:12:55'),
       (40404479, 9, '2020-12-16T15:24:49'),
       (40385675, 32, '2020-12-06T23:44:44'),
       (40385675, 43, '2020-12-14T10:44:44'),
       (40385675, 37, '2020-12-20T19:44:44'),
       (40610943, 33, '2020-12-11T20:29:11'),
       (40610943, 43, '2020-12-18T04:29:11'),
       (40476352, 35, '2020-12-08T13:10:08'),
       (38927786, 1, '2020-12-16T04:17:21'),
       (38927786, 17, '2020-12-19T08:17:21'),
       (38927786, 14, '2020-12-18T06:17:21'),
       (40812870, 15, '2020-12-15T18:55:21'),
       (40604273, 11, '2020-12-19T07:37:03'),
       (40604273, 43, '2020-12-16T20:37:03'),
       (40604273, 7, '2020-12-27T03:37:03'),
       (40611433, 24, '2020-12-23T18:41:06'),
       (40289520, 10, '2020-12-26T12:56:51'),
       (40289520, 43, '2020-12-20T01:56:51'),
       (40452293, 33, '2020-12-08T03:27:32'),
       (40452293, 26, '2020-12-16T06:27:32'),
       (40452293, 13, '2020-12-14T03:27:32'),
       (40317295, 19, '2020-12-09T13:16:50'),
       (40317315, 10, '2020-12-17T21:17:27'),
       (40317315, 36, '2020-12-07T14:17:27'),
       (40317315, 34, '2020-12-08T16:17:27'),
       (40317315, 22, '2020-12-14T23:17:27'),
       (40835739, 42, '2020-12-28T05:04:38'),
       (40696030, 14, '2020-12-24T15:09:18'),
       (40555943, 43, '2020-12-27T05:16:12'),
       (40555943, 45, '2020-12-27T12:16:12'),
       (40555943, 15, '2020-12-24T07:16:12'),
       (40828065, 9, '2020-12-20T11:57:03'),
       (40828065, 35, '2020-12-22T13:57:03'),
       (40303804, 29, '2020-12-14T22:33:13'),
       (40303804, 3, '2020-12-19T21:33:13'),
       (40303804, 28, '2020-12-18T14:33:13'),
       (40303804, 37, '2020-12-22T01:33:13'),
       (40744960, 44, '2020-12-21T19:27:18'),
       (40744960, 21, '2020-12-13T16:27:18'),
       (40744960, 15, '2020-12-18T02:27:18'),
       (40654605, 20, '2020-12-28T13:21:47'),
       (40752049, 1, '2020-12-12T00:17:44'),
       (40752049, 13, '2020-12-22T22:17:44'),
       (40752049, 6, '2020-12-12T07:17:44'),
       (40752049, 23, '2020-12-26T04:17:44'),
       (40575940, 1, '2020-12-19T08:54:56'),
       (40575940, 26, '2020-12-25T15:54:56'),
       (40575940, 27, '2020-12-26T16:54:56'),
       (40872341, 9, '2020-12-15T07:35:17'),
       (40872341, 5, '2020-12-21T11:35:17'),
       (40872341, 14, '2020-12-20T15:35:17'),
       (40793452, 16, '2020-12-21T20:38:31'),
       (40793452, 30, '2020-12-24T05:38:31'),
       (40453061, 5, '2020-12-13T17:31:55'),
       (40404470, 8, '2020-12-26T22:24:22'),
       (40404470, 26, '2020-12-08T11:24:22'),
       (40404470, 39, '2020-12-09T00:24:22'),
       (40703684, 5, '2020-12-09T06:14:55'),
       (40703684, 27, '2020-12-12T13:14:55'),
       (40703684, 45, '2020-12-21T13:14:55'),
       (40703684, 15, '2020-12-25T08:14:55'),
       (40408494, 42, '2020-12-21T02:47:50'),
       (40408494, 27, '2020-12-13T10:47:50'),
       (40408494, 44, '2020-12-27T06:47:50'),
       (40408494, 23, '2020-12-08T17:47:50'),
       (40875554, 32, '2020-12-24T07:33:41'),
       (40875554, 18, '2020-12-27T04:33:41'),
       (40875554, 43, '2020-12-16T00:33:41'),
       (40875554, 22, '2020-12-09T01:33:41'),
       (40680608, 34, '2020-12-11T17:30:58'),
       (40680608, 21, '2020-12-09T04:30:58'),
       (40826349, 8, '2020-12-22T01:14:49'),
       (40826349, 33, '2020-12-14T10:14:49'),
       (40826349, 43, '2020-12-19T06:14:49'),
       (40826349, 13, '2020-12-20T13:14:49'),
       (40876149, 16, '2020-12-23T09:57:31'),
       (40876149, 12, '2020-12-14T04:57:31'),
       (40876149, 30, '2020-12-12T05:57:31'),
       (40833368, 40, '2020-12-13T14:57:15'),
       (38314860, 19, '2020-12-16T01:57:00'),
       (40684597, 41, '2020-12-12T03:52:01'),
       (40684597, 2, '2020-12-12T11:52:01'),
       (40684597, 27, '2020-12-20T14:52:01'),
       (40684597, 20, '2020-12-17T23:52:01'),
       (40384452, 7, '2020-12-20T15:00:35'),
       (37250357, 41, '2020-12-21T00:37:24'),
       (37250357, 39, '2020-12-21T04:37:24'),
       (39860273, 24, '2020-12-09T17:49:15'),
       (39860273, 3, '2020-12-12T20:49:15'),
       (39860273, 28, '2020-12-11T13:49:15'),
       (40756734, 9, '2020-12-14T23:20:17'),
       (40756734, 35, '2020-12-27T20:20:17'),
       (40045135, 40, '2020-12-14T18:37:48'),
       (40045135, 19, '2020-12-18T22:37:48'),
       (40045135, 21, '2020-12-21T20:37:48'),
       (40045135, 31, '2020-12-13T16:37:48'),
       (40839585, 8, '2020-12-24T12:12:55'),
       (40839585, 6, '2020-12-08T01:12:55'),
       (40839585, 15, '2020-12-17T07:12:55'),
       (40865663, 34, '2020-12-11T21:19:42'),
       (40865663, 26, '2020-12-20T10:19:42'),
       (40865663, 30, '2020-12-25T23:19:42'),
       (40675270, 38, '2020-12-24T01:40:51'),
       (40732541, 16, '2020-12-09T20:36:49'),
       (40732541, 7, '2020-12-11T13:36:49'),
       (40847026, 9, '2020-12-12T07:51:24'),
       (40847026, 19, '2020-12-15T19:51:24'),
       (40830947, 0, '2020-12-22T02:00:42'),
       (40830947, 44, '2020-12-16T22:00:42'),
       (40697074, 25, '2020-12-14T03:42:23'),
       (39806266, 17, '2020-12-08T06:01:03'),
       (39806266, 2, '2020-12-09T14:01:03'),
       (39806266, 3, '2020-12-18T05:01:03'),
       (39806266, 12, '2020-12-23T09:01:03'),
       (40624668, 16, '2020-12-23T14:33:01'),
       (40624668, 0, '2020-12-08T13:33:01'),
       (40624668, 44, '2020-12-13T13:33:01'),
       (40624668, 39, '2020-12-22T14:33:01'),
       (40424708, 17, '2020-12-10T22:23:14'),
       (40424708, 4, '2020-12-28T06:23:14'),
       (40831050, 30, '2020-12-07T22:03:23'),
       (34445650, 28, '2020-12-15T10:17:42'),
       (34445650, 22, '2020-12-21T22:17:42'),
       (39195280, 38, '2020-12-18T01:37:43'),
       (40313114, 0, '2020-12-27T21:58:20'),
       (40313114, 42, '2020-12-22T09:58:20'),
       (40313114, 4, '2020-12-09T05:58:20'),
       (40612182, 40, '2020-12-15T04:04:19'),
       (40612182, 8, '2020-12-22T03:04:19'),
       (39145709, 9, '2020-12-16T07:38:42'),
       (40731848, 10, '2020-12-18T04:16:51'),
       (40731848, 6, '2020-12-08T02:16:51'),
       (40610564, 8, '2020-12-23T09:19:07'),
       (40610564, 5, '2020-12-11T08:19:07'),
       (40610564, 30, '2020-12-20T03:19:07'),
       (40610564, 39, '2020-12-15T15:19:07'),
       (40820387, 1, '2020-12-23T00:01:14'),
       (40820387, 26, '2020-12-26T10:01:14'),
       (40820387, 6, '2020-12-10T11:01:14'),
       (40731777, 24, '2020-12-08T03:15:04'),
       (40731777, 11, '2020-12-20T09:15:04'),
       (40731777, 35, '2020-12-11T09:15:04'),
       (40201445, 8, '2020-12-25T07:10:20'),
       (40201445, 0, '2020-12-11T15:10:20'),
       (40201445, 10, '2020-12-13T07:10:20'),
       (40201445, 37, '2020-12-18T21:10:20');
