BEGIN TRANSACTION;
CREATE TABLE SemesterLearnedTechnologies (
	LearnedTechID INTEGER PRIMARY KEY AUTOINCREMENT,
	SemesterID INTEGER NOT NULL,
	TechID INTEGER NOT NULL,
	FOREIGN KEY (SemesterID) REFERENCES CourseCategorySemester (SemesterID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (TechID) REFERENCES LearnableTechnologies (TechnologyID) ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE Program (
	ProgramID INTEGER PRIMARY KEY AUTOINCREMENT,
	ProgramTitle VARCHAR(50) NOT NULL,
	ProgramCourseCategory INTEGER NOT NULL,
	ProgramExitProfile VARCHAR(100),
	ProgramDuration INTEGER, -- measured in days 
	ProgramDetails TEXT,
	ProgramDescription TEXT,
	LastModified DATETIME DEFAULT GETDATE,
	FOREIGN KEY (ProgramCourseCategory) REFERENCES Course (CourseID) ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE(ProgramTitle, ProgramCourseCategory)
);
INSERT INTO `Program` (ProgramID,ProgramTitle,ProgramCourseCategory,ProgramExitProfile,ProgramDuration,ProgramDetails,ProgramDescription,LastModified) VALUES (1,'MMS',1,'Software Engineer',3498734,'dskfh','smjfhgklf','GETDATE');
CREATE TABLE LearnableTechnologies (
	TechnologyID INTEGER PRIMARY KEY AUTOINCREMENT,
	TechnologyTitle VARCHAR(100),
	TechnologyDescription TEXT,
	LastModified DATETIME DEFAULT GETDATE
);
CREATE TABLE CourseCategorySemester (
	SemesterID INTEGER PRIMARY KEY AUTOINCREMENT,
	CourseCategoryID INTEGER NOT NULL,
	SemesterTitle VARCHAR(20) NOT NULL,
	SemesterCertificateTitle VARCHAR(100) NOT NULL,
	SemesterExitProfile VARCHAR(100),
	LastModified DATETIME DEFAULT GETDATE,
	FOREIGN KEY (CourseCategoryID) REFERENCES Course (CourseID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE CourseCategory (
	CategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
	CategoryTitle VARCHAR(50) NOT NULL,
	CategoryDescription TEXT,
	SemesterBased BIT DEFAULT 0,
	LastModified DATETIME DEFAULT GETDATE
);
INSERT INTO `CourseCategory` (CategoryID,CategoryTitle,CategoryDescription,SemesterBased,LastModified) VALUES (1,'Software Engineering','hjfsdj',1,'03/11/2016'),
 (2,'Java','kjchsd',0,'03/11/2016');
CREATE TABLE Course (
	CourseID INTEGER PRIMARY KEY AUTOINCREMENT,
	CourseTitle VARCHAR(100) NOT NULL,
	CourseDescription TEXT,
	LastModified DATETIME DEFAULT GETDATE
);
COMMIT;
