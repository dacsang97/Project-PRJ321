CREATE DATABASE PROJECT_PRJ321
GO
USE  PROJECT_PRJ321
GO
CREATE TABLE Users (
	uid int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	username nvarchar(30) NOT NULL UNIQUE,
	password nvarchar(65) NOT NULL,
	permission int DEFAULT(1) 	
) ; 
CREATE TABLE Lessons(
	lid int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	title  nvarchar(255) NOT NULL,
	uid int NOT NULL,
	share int DEFAULT(1) NOT NULL
);
CREATE TABLE Quiz(
	qid int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	question  nvarchar(max) NOT NULL,
	answer  nvarchar(max) NOT NULL,
	lid int NOT NULL,
);
CREATE TABLE Folders(
	fid int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name  nvarchar(255) NOT NULL,
	uid int NOT NULL,
	sharefolder int DEFAULT(1) NOT NULL
);
CREATE TABLE Folders_PK_Lessons(
	fid int NOT NULL,
	lid int NOT NULL,
);
ALTER TABLE Quiz ADD CONSTRAINT Quiz_FK_Lessons FOREIGN KEY (lid) REFERENCES Lessons
GO
ALTER TABLE Lessons ADD CONSTRAINT Lessons_FK_Users FOREIGN KEY (uid) REFERENCES Users
GO
ALTER TABLE Folders ADD CONSTRAINT Folders_FK_Users FOREIGN KEY (uid) REFERENCES Users
GO
ALTER TABLE Folders_PK_Lessons ADD CONSTRAINT Folders_PK_Lessons_FK_Folders FOREIGN KEY (fid) REFERENCES Folders
GO
ALTER TABLE Folders_PK_Lessons ADD CONSTRAINT Folders_PK_Lessons_FK_Lessons FOREIGN KEY (lid) REFERENCES Lessons
GO
/*!--Insert table in Users */
INSERT INTO Users (username,password,permission) VALUES (N'admin','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1); 
INSERT INTO Users (username,password,permission) VALUES (N'sangnd','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',2); 
INSERT INTO Users (username,password,permission) VALUES (N'phongpv','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',2); 
INSERT INTO Users (username,password,permission) VALUES (N'tuanpv','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',2); 
INSERT INTO Users (username,password,permission) VALUES (N'manhtt','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',2); 

/*!--Insert table in Folders */
INSERT INTO Folders (name,sharefolder,uid) VALUES (N'Tiếng Nhật',1,2); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Tiếng Anh',2,2); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Introduction to Database',3,2); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Java',1,2); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Csharp',3,2);
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Bảng Cửu Chương',1,2);
INSERT INTO Folders (name,sharefolder,uid) VALUES (N'Tiếng Hàn',1,3); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'C cơ bản',2,3); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Hệ Điều Hành',3,3); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Core Java',1,3); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'OOP',3,3); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Cấu trúc Dữ liệu',3,3); 
INSERT INTO Folders (name,sharefolder,uid)  VALUES (N'Bảng Cửu Chương',1,3);

/*!--Insert table in Lessons */
INSERT INTO Lessons (title,uid,share)  VALUES (N'Progetest1',2,3); 
INSERT INTO Lessons (title,uid,share)  VALUES (N'Quiz Bank bài 1',2,3); 
INSERT INTO Lessons (title,uid,share)  VALUES (N'Quiz Bank bài 2',2,3); 
INSERT INTO Lessons (title,uid,share)  VALUES (N'Bang cuu chuong 1',2,3); 
INSERT INTO Lessons (title,uid,share)  VALUES (N'Progetest2',3,3); 
INSERT INTO Lessons (title,uid,share)  VALUES (N'Quiz Bank bài 1',3,3); 
INSERT INTO Lessons (title,uid,share)  VALUES (N'Quiz Bank bài 2',3,3); 
INSERT INTO Lessons (title,uid,share)  VALUES (N'Bang cuu chuong 2',3,3); 
INSERT INTO Lessons (title,uid,share)  VALUES (N'Bang cuu chuong 4',3,3); 

/*!--Insert table in Quiz */

INSERT INTO Quiz (question,answer,lid) VALUES ('na','na',1);
INSERT INTO Quiz (question,answer,lid) VALUES ('ni','ni',1);
INSERT INTO Quiz (question,answer,lid) VALUES ('nu','nu',1);
INSERT INTO Quiz (question,answer,lid) VALUES ('ne','ne',1);
INSERT INTO Quiz (question,answer,lid) VALUES ('no','no',1);

INSERT INTO Quiz (question,answer,lid) VALUES ('hello','xin chao',2);
INSERT INTO Quiz (question,answer,lid) VALUES ('i','toi',2);
INSERT INTO Quiz (question,answer,lid) VALUES ('father','cha',2);
INSERT INTO Quiz (question,answer,lid) VALUES ('mother','me',2);
INSERT INTO Quiz (question,answer,lid) VALUES ('goodbye','tam biet',2);

INSERT INTO Quiz (question,answer,lid) VALUES ('hello','xin chao',3);
INSERT INTO Quiz (question,answer,lid) VALUES ('i','toi',3);
INSERT INTO Quiz (question,answer,lid) VALUES ('father','cha',3);
INSERT INTO Quiz (question,answer,lid) VALUES ('mother','me',3);
INSERT INTO Quiz (question,answer,lid) VALUES ('goodbye','tam biet',3);


INSERT INTO Quiz (question,answer,lid) VALUES ('1*1','1',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*2','2',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*3','3',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*4','4',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*5','5',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*6','6',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*7','7',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*8','8',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*9','9',4);
INSERT INTO Quiz (question,answer,lid) VALUES ('1*10','10',4);

INSERT INTO Quiz (question,answer,lid) VALUES ('ha','ha',5);
INSERT INTO Quiz (question,answer,lid) VALUES ('hi','hi',5);
INSERT INTO Quiz (question,answer,lid) VALUES ('fu','fu',5);
INSERT INTO Quiz (question,answer,lid) VALUES ('he','he',5);
INSERT INTO Quiz (question,answer,lid) VALUES ('ho','ho',5);

INSERT INTO Quiz (question,answer,lid) VALUES ('%d','int',6);
INSERT INTO Quiz (question,answer,lid) VALUES ('%c','char',6);
INSERT INTO Quiz (question,answer,lid) VALUES ('char[]','string',6);
INSERT INTO Quiz (question,answer,lid) VALUES ('%f','float',6);
INSERT INTO Quiz (question,answer,lid) VALUES ('%lf','long',6);

INSERT INTO Quiz (question,answer,lid) VALUES ('lenh in','printf',7);
INSERT INTO Quiz (question,answer,lid) VALUES ('xuong dong','/n',7);
INSERT INTO Quiz (question,answer,lid) VALUES ('tab','/t',7);
INSERT INTO Quiz (question,answer,lid) VALUES ('nhan du lieu','scanf',7);
INSERT INTO Quiz (question,answer,lid) VALUES ('xoa bo nho dem','fflush(stdin)',7);


INSERT INTO Quiz (question,answer,lid) VALUES ('2*1','2',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*2','4',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*3','6',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*4','8',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*5','10',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*6','12',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*7','14',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*8','16',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*9','18',8);
INSERT INTO Quiz (question,answer,lid) VALUES ('2*10','20',8);

INSERT INTO Quiz (question,answer,lid) VALUES ('4*1','4',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*2','8',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*3','12',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*4','16',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*5','20',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*6','24',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*7','28',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*8','32',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*9','18',9);
INSERT INTO Quiz (question,answer,lid) VALUES ('4*10','20',9);


INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('1','1');
INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('2','2');
INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('2','3');
INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('6','4');


INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('7','5');
INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('8','6');
INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('8','7');
INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('13','8');
INSERT INTO Folders_PK_Lessons (fid, lid) VALUES ('13','9'); 
