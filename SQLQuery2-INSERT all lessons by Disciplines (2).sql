SELECT COUNT(*)
FROM Schedule
WHERE
	[group]=	 (SELECT group_id	   FROM Groups		WHERE group_name='PD_212')
AND [discipline]=(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')

SELECT 
	Disciplines.discipline_name AS 'Дисциплина',
	Groups.group_name			AS 'Группа',
	DATENAME(dw,dbo.Schedule.[date]) AS 'День недели',
	Schedule.[date]				AS 'Дата',
	Schedule.[time]				AS 'Время',
	Teachers.last_name+Teachers.first_name+Teachers.middle_name AS  'Преподaватель',
	[Статус ]=IIF(Schedule.spend=1,'Проведено','Запланировано')
FROM 
Schedule,Groups,Disciplines,Teachers
WHERE 
Schedule.discipline=Disciplines.discipline_id
AND Schedule.[group]=Groups.group_id
AND Schedule.teacher=Teachers.teacher_id
AND [discipline]=(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
