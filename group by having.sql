-- GROUP BY -- HAVING --
/*
HAVING ifadesinin islevi where ifadesininkine cok benziyor. Ancak kumeleme fonksiyonlari ile
WHERE ifadsi birlikte kullanilmadiginda HAVING ifadesine ihtiyac duyulmustur
GROUP BY ile kullenilir. Gruplamadan sonraki sart icin GROUP BY dan sonra HAVING kullanilir
*/
--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, round(avg(maas)) as maas_ortelamasi from personel1  -- as ile gecici stun olusturduk
where cinsiyet='E' -- yalniz erkek olanlari getir
group by ulke  -- ulkeye gore grupla
having avg(maas)>3000; -- yalniz maas ortalamasi 3000'den fazla olanlari getir
-- odev sorulari
--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
select ulke, round(avg(maas)) as maas_ortalamasi from personel1
where cinsiyet ='E'
group by ulke
having count('E')>2;
 -- 30 .08
CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;
--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.
select name, sum(salary) as "Total Salary"
from workers
group by name
having sum(salary)>=2500; -- group by dan sonra where kullanilmaz bu yuzden onunla ayni fonksiyona sahip having kullanilir
--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
select state, count(state) AS number_of_employess
from workers
GROUP BY state
HAVING COUNT(state) >1; -- HAVING, group by ardindan filtreleme icin kullanilir.
--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
select state, max(salary)
from workers
Group by state
having max(salary)<3000;
--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company, min(salary) as min_salary
from workers
group by company
having min(salary)>2000;
--Tekrarsız isimleri çağırın.
select distinct name -- distinct clause, cagrilan terimlerden tekrarlo olanlarin sadece brincisin alir
from workers;
--Name değerlerini company kelime uzunluklarına göre sıralayın.
select name, company
from workers
order by LENGTH(company); -- length company uzunluguna gore siralar
--Name değerlerini company kelime uzunluklarına göre buyukten kucuge dogru sıralayın.
select name, company
from workers
order by LENGTH(company)desc;
--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
SELECT CONCAt(name,' ', state) AS name_and_state
from workers
ORDER BY length(name) + length(state);
-- 2. yol
SELECT CONCAt(name,' ', state) AS name_and_state
from workers
ORDER BY length(CONCAt(name,' ', state));
-- 3. yol
select name || ' ' || state || ' ' || LENGTH(name) +LENGTH(state) as "Name and States"
from workers
order by length(name) + length(state);
SELECT * FROM workers;
