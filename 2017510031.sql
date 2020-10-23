CREATE TABLE university
(
  university_id integer NOT NULL,
  university_name character varying(30) NOT NULL,
  address character varying(60),
  e_mail character varying(25) DEFAULT 'default@default.com',
  city character varying(25),
  university_type character varying(10),
  year_of_foundation integer,
  CONSTRAINT pk_university_id PRIMARY KEY (university_id),
  CONSTRAINT un_university_id UNIQUE(university_id)
);
CREATE TABLE faculty
(
  faculty_id integer NOT NULL,
  faculty_name character varying(30) NOT NULL,
  e_mail character varying(25) DEFAULT 'default@default.com',
  university_id integer,
  CONSTRAINT pk_faculty_id PRIMARY KEY (faculty_id),
  CONSTRAINT fk_university_id FOREIGN KEY (university_id)
  REFERENCES university (university_id) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE department
(
  faculty_id integer,
  department_id integer NOT NULL,
  department_name character varying(50) NOT NULL,
  e_mail character varying(25) DEFAULT 'default@default.com',
  department_language character varying(10),
  education_type character varying(2),
  quota integer,
  the_quota_for_top_ranked_students integer,
  period integer,
  min_score_in_2019 double precision,
  min_order_in_2019 integer,
  CONSTRAINT pk_department_id PRIMARY KEY (department_id),
  CONSTRAINT fk_faculty_id FOREIGN KEY (faculty_id)
  REFERENCES faculty (faculty_id) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE,
  department_code integer
);
CREATE TABLE student
(
  student_id integer NOT NULL,
  student_name character varying(30) NOT NULL,
  student_surname character varying(30) NOT NULL,
  examination_score double precision,
  order_of_student_in_exam integer,
  position_of_student_in_high_school character varying(10),
  CONSTRAINT pk_student_id PRIMARY KEY (student_id),
  CONSTRAINT un_student_id UNIQUE(student_id)

);
CREATE TABLE university_preference
(
  student_id integer NOT NULL,
  preference1 integer,
  preference2 integer,
  preference3 integer,
  CONSTRAINT fk_student_id FOREIGN KEY (student_id)
  REFERENCES student(student_id) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE
);


--INSERTION OPERATIONS

Insert into university("university_id","university_name","address","e_mail","city","university_type","year_of_foundation")
values(1001,'Dokuz Eylül University','Alsancak, No: 144 35210, Cumhuriyet Blv, 35220 Konak','deu@deu.com','İzmir','State','1982');

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100101, 'Faculty Of Engineering',  1001);

INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100101, 10010101, 'Department of Computer Engineering', 'English', 
            'öö', 4, 1, 4, 
            440.142, 39,1);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100101, 10010102, 'Department of Machine Engineering', 'English', 
            'iö', 3, 0, 4, 
            420.142, 44,2);



    
INSERT INTO public.faculty(
            faculty_id, faculty_name,  university_id)
    VALUES (100102, 'Faculty Of Medicine',  1001);

INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100102, 10010201, 'Department Of Medicine', 'Turkish', 
            'öö', 4, 0, 6, 
            480, 18,3);

    
INSERT INTO public.faculty(
            faculty_id, faculty_name,  university_id)
    VALUES (100103, 'Faculty Of Law',  1001);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100103, 10010301, 'Department Of Law', 'Turkish', 
            'öö', 4, 0, 5, 
            460, 25,4);

--********

Insert into university("university_id","university_name","address","e_mail","city","university_type","year_of_foundation")
values(1002,'Ege University','Gençlik Cd. No:12, 35040 Bornova','ege@ege.com','İzmir','State','1956');

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100201, 'Faculty Of Engineering',  1002);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100201, 10020101, 'Department Of Computer Engineering', 'English', 
            'öö', 4, 1, 4, 
            436, 41,1);


INSERT INTO public.faculty(
            faculty_id, faculty_name,  university_id)
    VALUES (100202, 'Faculty Of Literature',  1002);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100202, 10020201, 'Department Of Literature', 'Turkish', 
            'iö', 5, 1, 4, 
            399, 53,5);

 
INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100203, 'Faculty Of Law',  1002);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100203, 10020301, 'Department Of Law', 'Turkish', 
            'öö', 5, 1, 5, 
            475, 20,4);

--********

Insert into university("university_id","university_name","address","e_mail","city","university_type","year_of_foundation")
values(1003,'Hacettepe University','Hacettepe Üniversitesi Rektörlüğü Sıhhiye','hacettepe@hacettepe.com','Ankara','State','1967');

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100301, 'Faculty Of Engineering',1003);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100301, 10030101, 'Department of Computer Engineering', 'English', 
            'öö', 3, 0, 4, 
            484.3, 15,1);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100301, 10030102, 'Department of Machine Engineering', 'English', 
            'öö', 3, 0, 4, 
            470.2, 17,2);


 
INSERT INTO public.faculty(
            faculty_id, faculty_name,  university_id)
    VALUES (100302, 'Faculty Of Medicine',  1003);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100302, 10030201, 'Department Of Medicine', 'Turkish', 
            'öö', 4, 0, 6, 
            483, 17,3);
    
INSERT INTO public.faculty(
            faculty_id, faculty_name,  university_id)
    VALUES (100303, 'Faculty Of Pharmacy',  1003);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100303, 10030301, 'Department Of Pharmacy', 'Turkish', 
            'öö', 4, 1, 4, 
            450, 33,6);
            
--********

Insert into university("university_id","university_name","address","e_mail","city","university_type","year_of_foundation")
values(1004,'Ankara University','Emniyet, Dögol Cd. 6A, 06560 Yenimahalle','au@au.com','Ankara','State','1946');

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100401, 'Faculty Of Engineering', 1004);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100401, 10040101, 'Department Of Machine Engineering', 'English', 
            'öö', 4, 1, 4, 
            430, 43,2);
    
INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100402, 'Faculty Of Literature',  1004);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100402, 10040201, 'Department Of Literature', 'Turkish', 
            'öö', 5, 1, 4, 
            390, 55,5);

INSERT INTO public.faculty(
            faculty_id, faculty_name,university_id)
    VALUES (100403, 'Faculty Of Law',  1004);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100403, 10040301, 'Department Of Law', 'English', 
            'öö', 3, 0, 5, 
            466, 23,4);


--********

Insert into university("university_id","university_name","address","e_mail","city","university_type","year_of_foundation")
values(1005,'İzmir Technical University','35213 Balçova','itü@itü.com','İzmir','State','1988');

INSERT INTO public.faculty(
            faculty_id, faculty_name,  university_id)
    VALUES (100501, 'Faculty Of Medicine',  1005);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100501, 10050101, 'Department Of Medicine', 'English', 
            'öö', 4, 0, 6, 
            473, 19,3);
 
INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100502, 'Faculty Of Economics',  1005);

INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100502, 10050201, 'Department Of Economics', 'Turkish', 
            'iö', 4, 0, 4, 
            400, 54,7);

--********

Insert into university("university_id","university_name","address","e_mail","city","university_type","year_of_foundation")
values(1006,'İzmir University','35513 Bornova','iü@iü.com','İzmir','State','2003');

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100601, 'Faculty Of Economics', 1006);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100601, 10060101, 'Department Of Economics', 'Turkish', 
            'öö', 4, 0, 4, 
            410, 49,7);

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (100602, 'Faculty Of Literature',  1006);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (100602, 10060201, 'Department Of Literature', 'Turkish', 
            'öö', 3, 1, 4, 
            391, 54,5);


--********

Insert into university("university_id","university_name","address","e_mail","city","university_type","year_of_foundation")
values(2001,'Koç University','Rumelifeneri, Sarıyer Rumeli Feneri Yolu, 34450 Sarıyer','ku@ku.com','İstanbul','Private','1993');

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (200101, 'Faculty Of Engineering', 2001);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (200101, 20010101, 'Department of Computer Engineering', 'English', 
            'iö', 2, 1, 4, 
            450.42, 33,1);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (200101, 20010102, 'Department of Machine Engineering', 'English', 
            'öö', 2, 0, 4, 
            454, 32,2);

    
INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (200102, 'Faculty Of Medicine',2001);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (200102, 20010201, 'Department Of Medicine', 'English', 
            'öö', 2, 0, 6, 
            489, 14,3);

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (200103, 'Faculty Of Law',  2001);

INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (200103, 20010301, 'Department Of Law', 'English', 
            'iö', 2, 0, 5, 
            490, 13,4);

--********

Insert into university("university_id","university_name","address","e_mail","city","university_type","year_of_foundation")
values(2002,'Bilkent University','06800 Çankaya','bu@bu.com','Ankara','Private','1984');

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (200201, 'Faculty Of Engineering', 2002);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (200201, 20020101, 'Department of Computer Engineering', 'Turkish', 
            'iö', 2, 1, 4, 
            497.322, 10,1);
    
INSERT INTO public.faculty(
            faculty_id, faculty_name,  university_id)
    VALUES (200202, 'Faculty Of Medicine',  2002);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (200202, 20020201, 'Department Of Medicine', 'English', 
            'öö', 2, 0, 6, 
            495.212, 11,3);

INSERT INTO public.faculty(
            faculty_id, faculty_name, university_id)
    VALUES (200203, 'Faculty of Pharmacy',  2002);
INSERT INTO public.department(
            faculty_id, department_id, department_name,  department_language, 
            education_type, quota, the_quota_for_top_ranked_students, period, 
            min_score_in_2019, min_order_in_2019,department_code)
    VALUES (200203, 20020301, 'Department Of Pharmacy', 'Turkish', 
            'öö', 2, 1, 4, 
            455, 31,6);
            


--********

-- INSERTING STUDENTS


INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (101, 'Hüseyin','Erdoğan', 445,38);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (101, 10010101, 10010102, 10030101);



INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (102, 'Ahmet','Gündoğan', 430,43);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (102, 20010101, 10020101, 10050201);




INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (103, 'Ayça','Gül', 350,120);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (103, 10050201, 10040201, 10010102);



INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam,position_of_student_in_high_school)
    VALUES (104, 'Semra','Beyaz', 422,46,'Top Ranked');
INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (104, 20010102, 20010101, 10040101);



INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (105, 'Kemal','Şafak', 460,25);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (105, 20010102, 20010101, 10040101);

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (106, 'Yasemin','Güler', 343,140);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (106, 10050201, 10060201, 10040201);

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam,position_of_student_in_high_school)
    VALUES (107, 'Zeynep','Yılmaz', 490,13,'Top Ranked');

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (107, 10030101, 10010201, 10050101);
 
INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (108, 'Burak','Şener', 430,42);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (108, 10040101, 10010102, 10060101);   

 
INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (109, 'Yusuf','Arslan', 415,47);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (109, 10010101, 10040101, 10050201);   

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (110, 'Emre','Yıkılmaz', 445,37);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (110, 10010101, 10020101, 10060201);   

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (111, 'Eda','Sarı', 505,7);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (111, 20020101, 20010301, 10030101);   

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (112, 'Ahmetcan','Özünlü', 354,133);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (112, 10010101, 10010102, 10050201);   

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (113, 'Sibel','Gülcan', 470,17);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (113, 10010101, 10010102, 10060101); 

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (114, 'Sarp','Osman', 476,15);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (114, 20010101, 10010102, 10060101); 

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (115, 'Bulut','Çıracı', 424,44);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (115, 10010101, 10020201, 10040201); 

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam, position_of_student_in_high_school)
    VALUES (116, 'Selami','Akyol', 380,66,'Top Ranked');

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (116, 20010201, 10030201, 10050101); 

INSERT INTO public.student(
            student_id, student_name, student_surname, examination_score, 
            order_of_student_in_exam)
    VALUES (117, 'Ozan','Eren', 433,41);

INSERT INTO public.university_preference(
            student_id, preference1, preference2, preference3)
    VALUES (117, 10030301, 10040101, 10060101);







--QUERIES------------------

--1-Find the university names which are located in the cities whose name starts with “İ” and founded after 1990.

select * from university where (city like 'İ%' or city like 'i%' )and year_of_foundation>=1990;

--2-Find the universities which include “Engineering” and “Medicine” Faculties

select * from university inner join 
(select university.university_id from 
(select university.university_id,university.university_name from faculty inner join university on university.university_id=faculty.university_id where faculty.faculty_name like '%Engineering%'
)university,
(select university.university_id,university.university_name from faculty inner join university on university.university_id=faculty.university_id where faculty.faculty_name like '%Medicine%' 
)faculty where university.university_id=faculty.university_id) faculty on university.university_id= faculty.university_id;

--3-Find the count of faculties according to university types. 

select university_type,count(*)from university group by university_type;

--4-Find the departments that contain “engineering” and are the type of “iö”.  

select * from department where department_name like '%Engineering%' and education_type='iö';

--5-Find the top five departments with the longest education period and the highest score.

select * from (select * from department order by period desc limit 5) department order by min_score_in_2019 desc ;

--6-Find the most preferred 4-year departments.

select department_name, count as preference_number from
 (select department_name , count(*) from 
(select department_name from (select * from department where period=4)department inner join (select preference1,preference2,preference3
from university_preference group by preference1,preference2,preference3) 
university_preference on department.department_id=preference1 or department.department_id=preference2 or department.department_id=preference3) 
department 
group by department_name order by count desc) department limit 4 ;
 
--7-List the students who prefer the Department of Computer Engineering as their first choice according to their exam score in a descending order.

select student.student_id, student.student_name ,student.student_surname, student.examination_score , student.order_of_student_in_exam, student.position_of_student_in_high_school,department.department_name from student inner join 
(select student_id,department_name from 
(select department_name,student_id from department inner join (select student_id,preference1 from university_preference) university_preference on department.department_id= preference1)
department where department.department_name='Department of Computer Engineering')
department on student.student_id=department.student_id order by student.examination_score desc ;

--8-Update the Faculty of Engineering in Dokuz Eylül University to be located in Izmir Technical University. 

UPDATE public.faculty
   SET faculty_id=(select faculty_id from faculty where university_id = (select university_id from university where university_name like '%zmir Technical University%')
    order by faculty_id desc limit 1)+1
   ,university_id= (select university_id from university where university_name like '%zmir Technical University%')
 WHERE faculty_id = (select faculty_id from faculty where university_id=(select university_id from university where university_name = 'Dokuz Eylül University') and faculty_name like '%Engineering%');

--9-Extend the current education period of the departments under the Faculty of Law by one year.

UPDATE department
   SET period=period+1
WHERE 'Faculty Of Law' = (select faculty_name from faculty where department.faculty_id = faculty.faculty_id);

--10-Delete the faculties and departments in İzmir University. 

DELETE FROM department
 WHERE faculty_id > (select university_id*100 from university where university_name='İzmir University') 
 and faculty_id < (select university_id*100+100 from university where university_name='İzmir University');
DELETE FROM faculty
 WHERE university_id=(select university_id from university where university_name='İzmir University');

