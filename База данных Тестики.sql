CREATE DATABASE Testiki

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Email VARCHAR(50),
    Phone VARCHAR(15),
    Roles VARCHAR(20),
    LastName VARCHAR(50),
    FirstName VARCHAR(50)
);

CREATE TABLE Tests (
    TestID INT PRIMARY KEY,
    TestName VARCHAR(100),
    Question VARCHAR(255),
    CorrectAnswer VARCHAR(100),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES TestCategories(CategoryID)
);

CREATE TABLE TestResults (
    ResultID INT PRIMARY KEY,
    ClientID INT,
    TestID INT,
    Grade INT,
    DateCompleted DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (TestID) REFERENCES Tests(TestID)
);

CREATE TABLE UserProfiles (
    ClientID INT PRIMARY KEY,
    CompletedTests VARCHAR(255),
    AverageGrade FLOAT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

CREATE TABLE TestCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    TestID INT,
    ClientID INT,
    Grade INT,
    FOREIGN KEY (TestID) REFERENCES Tests(TestID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO Clients (ClientID, Email, Phone, Roles, LastName, FirstName) 
VALUES (1, 'example@mail.com', '1234567890', 'Ученик', 'Иванов', 'Иван'),
       (2, 'test@test.com', '9876543210', 'Учитель', 'Петров', 'Петр')

INSERT INTO Tests (TestID, TestName, Question, CorrectAnswer, CategoryID) 
VALUES (1, 'Test 1', 'Question 1?', 'Answer 1', 1),
       (2, 'Test 2', 'Question 2?', 'Answer 2', 2)

INSERT INTO TestResults (ResultID, ClientID, TestID, Grade, DateCompleted) 
VALUES (1, 1, 1, 90, '2022-01-15'),
       (2, 2, 2, 85, '2022-02-20');

INSERT INTO UserProfiles (ClientID, CompletedTests, AverageGrade) 
VALUES (1, '1,2', 85.5),
       (2, '2', 85);

INSERT INTO TestCategories (CategoryID, CategoryName) 
VALUES (3, 'Category 1'),
       (4, 'Category 2');

INSERT INTO Grades (GradeID, TestID, ClientID, Grade) 
VALUES (1, 1, 1, 90),
       (2, 2, 2, 85);


SELECT * FROM Clients
SELECT * FROM Tests
SELECT * FROM TestResults
SELECT * FROM UserProfiles
SELECT * FROM TestCategories
SELECT * FROM Grades
