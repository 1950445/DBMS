SELECT 
	Disciplines.discipline_name AS 'Дисциплина',
	Students.last_name		AS 'Фамилия',
	Students.first_name		AS 'Имя',
	Students.middle_name	AS 'Отчество',
	DATEDIFF(hour,Students.birth_date,GETDATE())/8766 AS 'Возраст',
	Groups.group_name		AS 'Группа'
FROM
	Students, Groups, Directions
WHERE 
	Students.[group]=Groups.group_id
AND Groups.group_name='PD_212'
AND Groups.direction = Directions.direction_id
AND Directions.direction_name='Разработка программного обеспечния'
ORDER BY
	Students.birth_date ASC
