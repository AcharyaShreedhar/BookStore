CREATE TABLE Genre (
    GenreID INT IDENTITY(1,1) PRIMARY KEY,
    GenreName NVARCHAR(100)
);




INSERT INTO Genre (GenreName)
VALUES ('Science Fiction'), ('Fantasy'), ('Mystery'), ('Romance'), 
       ('Thriller'), ('Historical Fiction'), ('Horror'), ('Biography');

CREATE TABLE TheBooks_288 (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    BookTitle NVARCHAR(255),
    Author NVARCHAR(100),
    GenreID INT,
    Price DECIMAL(10, 2),
    ISBN NVARCHAR(20), -- International Standard Book Number
    Publisher NVARCHAR(100),
    PublishDate DATE,
    Description NVARCHAR(MAX),
    Pages INT,
    Language NVARCHAR(50),
    Edition NVARCHAR(50),
    ImageUrl NVARCHAR(MAX), -- Assuming image URLs can be quite long
    CONSTRAINT FK_TheBooks_Genre FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);
INSERT INTO TheBooks_288 (BookTitle, Author, GenreID, Price, ISBN, Publisher, PublishDate, Description, Pages, Language, Edition, ImageUrl)
VALUES
('Becoming', 'Michelle Obama', 1, 19.99, '978-1524763138', 'Crown Publishing Group', '2018-11-13', 'Memoir by former First Lady Michelle Obama', 448, 'English', 'First Edition', 'Becoming'),

('Educated', 'Tara Westover', 1, 15.99, '978-0399590504', 'Random House', '2018-02-20', 'Memoir about the author''s journey from a remote mountain home to intellectual achievement', 352, 'English', 'First Edition', 'Educated'),

('The Silent Patient', 'Alex Michaelides', 2, 22.50, '978-1250301697', 'Celadon Books', '2019-02-05', 'Psychological thriller novel', 336, 'English', 'First Edition', 'The Silent Patient'),

('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 3, 18.99, '978-0062316097', 'Harper', '2015-02-10', 'Explores the history of humankind', 464, 'English', 'Reprint Edition', 'Sapiens: A Brief History of Humankind'),

('Where the Crawdads Sing', 'Delia Owens', 1, 24.99, '978-0735219090', 'G.P. Putnam''s Sons', '2018-08-14', 'Mystery and coming-of-age novel', 384, 'English', 'First Edition', 'Where the Crawdads Sing'),

('The Subtle Art of Not Giving a F*ck', 'Mark Manson', 1, 13.49, '978-0062457714', 'HarperOne', '2016-09-13', 'Self-help book that challenges conventional self-help advice', 224, 'English', 'First Edition', 'The Subtle Art of Not Giving a F*ck'),

('The Girl with the Dragon Tattoo', 'Stieg Larsson', 4, 14.75, '978-0307949486', 'Knopf', '2008-09-16', 'Mystery crime thriller', 672, 'English', 'First Edition', 'The Girl with the Dragon Tattoo'),

('Thinking, Fast and Slow', 'Daniel Kahneman', 3, 16.99, '978-0374533557', 'Farrar, Straus and Giroux', '2011-10-25', 'Explores the two systems that drive the way we think', 512, 'English', 'First Edition', 'Thinking, Fast and Slow'),

('The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', 1, 11.99, '978-1400052189', 'Crown Publishing Group', '2010-02-02', 'Non-fiction about Henrietta Lacks and the HeLa cell line', 400, 'English', 'First Edition', 'The Immortal Life of Henrietta Lacks'),

('Circe', 'Madeline Miller', 5, 21.00, '978-0316556347', 'Little, Brown and Company', '2018-04-10', 'Retelling of the story of Circe from ancient Greek mythology', 400, 'English', 'First Edition', 'Circe');