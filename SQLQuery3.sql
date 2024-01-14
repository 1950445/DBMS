
DECLARE @discipline			SMALLINT=(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE '%MS SQL%')
DECLARE @teacher			INT     =1
DECLARE @group				INT     =3
DECLARE @start_date			DATE    ='2022-12-01'	
DECLARE @date				DATE    = @start_date
DECLARE @interval			INT		=2
DECLARE @time				TIME	='14:30'
DECLARE @number_of_lessons  TINYINT =(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline) 

DECLARE @counter            INT		=0

WHILE(@counter<@number_of_lessons)
BEGIN
	INSERT INTO Schedule(discipline,teacher,[date],[time],spend,[group])
	VALUES				(@discipline,@teacher,@date,@time,IIF(@date<GETDATE(),1,0),@group);
	SET		 @counter=@counter+1;

	INSERT INTO Schedule(discipline,teacher,[date],[time],spend,[group])
	VALUES				(@discipline,@teacher,@date,DATEADD(mi,90,CONVERT(TIME, @time)),IIF(@date<GETDATE(),1,0),@group);
	SET		 @counter=@counter+1;

--	SET		@date=@date+@interval
	SET		@date=DATEADD(dd,@interval,@date)
	SET     @interval=IIF(@interval=2,5,2)
END
--INSERT INTO Schedule(discipline,teacher,[date],[time],spend,[group])
--VALUES  



--SELECT* FROM Disciplines WHERE discipline_name LIKE '%Java%'
--SELECT * FROM Disciplines WHERE CONTAINS(discipline_name,'Java')