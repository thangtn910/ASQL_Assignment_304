--ASQL Assignment 304
USE master
GO

IF EXISTS( SELECT name FROM sys.databases WHERE name = N'DMS')
DROP DATABASE [DMS]
GO

CREATE DATABASE [DMS]
GO

USE [DMS]
GO
/****** Object:  Table [dbo].[EMPMAJOR]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPMAJOR](
	[emp_no] [char](6) NOT NULL,
	[major] [char](3) NOT NULL,
	[major_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[major] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMP]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMP](
	[emp_no] [char](6) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[dept_no] [char](3) NOT NULL,
	[job] [varchar](50) NULL,
	[salary] [money] NOT NULL,
	[bonus] [money] NULL,
	[ed_level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEPT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPT](
	[dept_no] [char](3) NOT NULL,
	[dept_name] [varchar](50) NOT NULL,
	[mgn_no] [char](6) NULL,
	[admr_dept] [char](3) NOT NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dept_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPPROJACT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPPROJACT](
	[emp_no] [char](6) NOT NULL,
	[proj_no] [char](6) NOT NULL,
	[act_no] [int] NOT NULL,
 CONSTRAINT [PK_EPA] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[proj_no] ASC,
	[act_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACT](
	[act_no] [int] NOT NULL,
	[act_des] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[act_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Dept]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[DEPT]  WITH CHECK ADD  CONSTRAINT [FK_Dept] FOREIGN KEY([mgn_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[DEPT] CHECK CONSTRAINT [FK_Dept]
GO
/****** Object:  ForeignKey [FK__EMP__dept_no__3E52440B]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMP]  WITH CHECK ADD FOREIGN KEY([dept_no])
REFERENCES [dbo].[DEPT] ([dept_no])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK_Major]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPMAJOR]  WITH CHECK ADD  CONSTRAINT [FK_Major] FOREIGN KEY([emp_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[EMPMAJOR] CHECK CONSTRAINT [FK_Major]
GO
/****** Object:  ForeignKey [FK_EPA1]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPPROJACT]  WITH CHECK ADD  CONSTRAINT [FK_EPA1] FOREIGN KEY([emp_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[EMPPROJACT] CHECK CONSTRAINT [FK_EPA1]
GO
/****** Object:  ForeignKey [FK_EPA2]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPPROJACT]  WITH CHECK ADD  CONSTRAINT [FK_EPA2] FOREIGN KEY([act_no])
REFERENCES [dbo].[ACT] ([act_no])
GO
ALTER TABLE [dbo].[EMPPROJACT] CHECK CONSTRAINT [FK_EPA2]
GO

--1. Add at least 8 records into each created tables.

INSERT INTO [dbo].[DEPT]([dept_no],[dept_name],[mgn_no],[admr_dept],[location])
VALUES	('1','RD',NULL,'234','Cau Giay'),
		('2','Meeting',NULL,'232','Hai Ba Trung'),
		('3','Product',NULL,'134','Hoang Mai'),
		('4','QC',NULL,'254','Ba Dinh'),
		('5','QA',NULL,'334','Long Bien'),
		('6','Store',NULL,'238','Thanh Xuan'),
		('7','Purchuse',NULL,'934','Tay Ho'),
		('8','Director',NULL,'222','Hoan Kiem')
GO

INSERT INTO [dbo].[EMP]([emp_no],[last_name],[first_name],[dept_no],[job],[salary],[bonus],[ed_level])
VALUES	('1','Tran','Thang',8,'Director',100000,200000,10),
		('2','Nguyen','Tu',3,'Employee',1000,200,1),
		('3','Trinh','Dieu',1,'Employee',10000,2080,5),
		('4','Le','Duc',2,'Employee',15000,30000,7),
		('5','Nguyen','Cuong',2,'Employee',2000,320,2),
		('6','Vo','Thien',5,'Employee',60000,8200,9),
		('7','Hoang','Viet',1,'Employee',25000,7009,7),
		('8','Dang','Huy',2,'Employee',13000,9200,6)
GO

INSERT INTO [dbo].[EMPMAJOR]([emp_no],[major],[major_name])
VALUES  ('1','1','MAT'),
		('1','2','CSI'),
		('2','6','HIS'),
		('3','3','LAN'),
		('4','4','MAT'),
		('5','3','CSI'),
		('3','2','DIA'),
		('3','5','LOL'),
		('6','1','DIA'),
		('7','5','LOL')
GO

INSERT INTO [dbo].[ACT]([act_no],[act_des])
VALUES	(1,'MATA'),
		(2,'Coca'),
		(3,'Pepsi'),
		(4,'Fanta'),
		(5,'Nutri'),
		(6,'Tiger'),
		(7,'333'),
		(8,'Hanoi'),
		(9,'Saigon'),
		(10,'7 up'),
		(11,'Sting'),
		(12,'Number 1')
GO

INSERT INTO [dbo].[EMPPROJACT]([emp_no],[proj_no],[act_no])
VALUES	('1','9',2),
		('2','3',1),
		('3','2',8),
		('4','5',9),
		('5','2',4),
		('6','11',5),
		('7','8',1),
		('8','6',6),
		('2','2',7),
		('2','5',2),
		('8','9',10),
		('5','11',4),
		('1','7',11),
		('4','2',12)
GO

--2. Find employees who are currently working on a project or projects. Employees working on projects will have a row(s) on the EMPPROJACT table.
SELECT e.last_name + ' ' + e.first_name AS Name, ep.proj_no
FROM dbo.EMP e
INNER JOIN dbo.EMPPROJACT ep ON e.emp_no = ep.emp_no
GO

--3. Find all employees who major in math (MAT) and computer science (CSI).
SELECT e.last_name + ' ' + e.first_name AS [Name], COUNT(em.major_name) AS total_major
FROM dbo.EMP e
INNER JOIN dbo.EMPMAJOR em ON e.emp_no = em.emp_no
WHERE major_name = 'MAT' OR major_name = 'CSI'
GROUP BY e.last_name + ' ' + e.first_name
HAVING COUNT(em.major_name) = 2
GO

--5. Provide a report of employees with employee detail information along with department aggregate information. Give >=2 solutions (Scalar Fullselect, Join, CTE, ect). Show:

--       EMPNO          LASTNAME         FIRSTNAME          SALARY          DEPTNO             DEPT_AVG_SAL

--       ----------       -----------------   ---------------       ------------      ------------         ----------------------

--       000010         HAAS                 CHRISTINE           52750.00       A00                    45312.50
CREATE VIEW vw_GetInformation 
AS
SELECT e.dept_no,AVG(e.salary) AS DEPT_AVG_SAL
FROM dbo.DEPT d
INNER JOIN dbo.EMP e ON d.dept_no = e.dept_no
GROUP BY e.dept_no
GO

SELECT e.emp_no,e.last_name,e.first_name,e.salary,d.dept_no,vw.DEPT_AVG_SAL AS DEPT_AVG_SAL
FROM dbo.EMP e
INNER JOIN dbo.DEPT d ON e.dept_no = d.dept_no
INNER JOIN dbo.vw_GetInformation vw ON d.dept_no = vw.dept_no 
ORDER BY e.emp_no
GO

--6. Use CTE technique to provide a report of employees whose education levels are higher than 
--the average education level of their respective department.
CREATE VIEW vw_AvgLevel
AS 
SELECT AVG(e.ed_level) AS AvgLevel,e.dept_no
FROM dbo.DEPT d
INNER JOIN dbo.EMP e ON d.dept_no = e.dept_no
GROUP BY e.dept_no
GO

SELECT e.emp_no,e.last_name,e.first_name,e.dept_no,e.ed_level,vw.AvgLevel AS AvgLevel
FROM dbo.EMP e
INNER JOIN dbo.DEPT d ON e.dept_no = d.dept_no
INNER JOIN vw_AvgLevel vw ON d.dept_no = vw.dept_no
WHERE e.ed_level > vw.AvgLevel 
ORDER BY emp_no
GO

;WITH EmployeeReport (emp_no,last_name,first_name,dept_no,ed_level)
AS(
	SELECT e.emp_no,e.last_name,e.first_name,e.dept_no,e.ed_level
	FROM dbo.EMP e
	INNER JOIN dbo.DEPT d ON e.dept_no = d.dept_no
	WHERE e.dept_no IN (SELECT e2.dept_no
						FROM dbo.EMP e2
						GROUP BY e2.dept_no
						HAVING e.ed_level > AVG(e2.ed_level))
)
SELECT * FROM EmployeeReport
GO

--7. Return the department number, department name and the total payroll for the department that 
--has the highest payroll. Payroll will be defined as the sum of all salaries and bonuses for the department.
CREATE VIEW vw_payroll
AS
SELECT e.dept_no,SUM(e.salary + e.bonus) AS payroll
FROM dbo.EMP e
GROUP BY e.dept_no
GO

SELECT DISTINCT TOP 10 WITH TIES
d.dept_no,d.dept_name,vw.payroll AS Total_Payroll
FROM dbo.DEPT d 
INNER JOIN dbo.EMP e ON d.dept_no = e.dept_no 
INNER JOIN dbo.vw_payroll vw ON e.dept_no = vw.dept_no
ORDER BY payroll DESC
GO

--8. Return the employees with the top 5 salaries.
--Could be many employees having the same salaries.
SELECT DISTINCT TOP 10 WITH TIES
e.emp_no,e.last_name + ' '+ e.first_name,e.salary
FROM dbo.EMP e
ORDER BY e.salary DESC
GO

--Could be 5 employees with different salaries.
SELECT DISTINCT TOP 10 WITH TIES
e.emp_no,e.last_name + ' '+ e.first_name,e.salary
FROM dbo.EMP e
ORDER BY e.salary DESC
GO