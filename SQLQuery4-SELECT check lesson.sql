SELECT COUNT(*)
FROM 
Schedule,Groups,Disciplines,Teachers

WHERE 
Schedule.discipline=Disciplines.discipline_id
AND Schedule.[group]=Groups.group_id
AND Schedule.teacher=Teachers.teacher_id
AND Schedule.discipline=(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
AND Schedule.[date]='2023-12-01'
AND Schedule.[time]='14:30'


SELECT 
	Disciplines.discipline_name AS '����������',
	Groups.group_name			AS '������',
	DATENAME(dw,dbo.Schedule.[date]) AS '���� ������',
	Schedule.[date]				AS '����',
	Schedule.[time]				AS '�����',
	Teachers.last_name+Teachers.first_name+Teachers.middle_name AS  '������a������',
	[������ ]=IIF(Schedule.spend=1,'���������','�������������')
FROM 
Schedule,Groups,Disciplines,Teachers
WHERE 
Schedule.discipline=Disciplines.discipline_id
AND Schedule.[group]=Groups.group_id
AND Schedule.teacher=Teachers.teacher_id
AND Schedule.discipline=(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
AND Schedule.[date]='2023-12-01'
AND Schedule.[time]='14:30'

