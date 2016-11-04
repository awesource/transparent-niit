-- @author: Samuel Adeshina
-- @date: 03/11/2016
-- @copyright: []
-- @maintainer: The [Awesource](https://github.com/awesource) team
-- @description: This SQL Script contains the schema of the
--				 official NIIT course catalogue.
--				 For a more comprehensive note of what this means, please
--				 see the readme file available in the github repository of
--				 this project.
-- @compatibility: The SQL in this file has been tested against
--				   SQLite for compatibility.

-- @modified: 03/11/2016
-- @version: dev-master

CREATE TABLE CourseCategory (
	CategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
	CategoryTitle VARCHAR(50) NOT NULL,
	CategoryDescription TEXT,
	SemesterBased BIT DEFAULT 0,
	LastModified DATETIME DEFAULT GETDATE
);

CREATE TABLE Course (
	CourseID INTEGER PRIMARY KEY AUTOINCREMENT,
	CourseTitle VARCHAR(100) NOT NULL,
	CourseDescription TEXT,
	LastModified DATETIME DEFAULT GETDATE
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

CREATE TABLE CourseCategorySemester (
	SemesterID INTEGER PRIMARY KEY AUTOINCREMENT,
	CourseCategoryID INTEGER NOT NULL,
	SemesterTitle VARCHAR(20) NOT NULL,
	SemesterCertificateTitle VARCHAR(100) NOT NULL,
	SemesterExitProfile VARCHAR(100),
	LastModified DATETIME DEFAULT GETDATE,
	FOREIGN KEY (CourseCategoryID) REFERENCES Course (CourseID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE LearnableTechnologies (
	TechnologyID INTEGER PRIMARY KEY AUTOINCREMENT,
	TechnologyTitle VARCHAR(100),
	TechnologyDescription TEXT,
	LastModified DATETIME DEFAULT GETDATE
);

CREATE TABLE SemesterLearnedTechnologies (
	LearnedTechID INTEGER PRIMARY KEY AUTOINCREMENT,
	SemesterID INTEGER NOT NULL,
	TechID INTEGER NOT NULL,
	FOREIGN KEY (SemesterID) REFERENCES CourseCategorySemester (SemesterID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (TechID) REFERENCES LearnableTechnologies (TechnologyID) ON UPDATE CASCADE ON DELETE SET NULL
);