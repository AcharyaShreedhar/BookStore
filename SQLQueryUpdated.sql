ALTER TABLE Genre
ADD shortName NVARCHAR(50);

UPDATE Genre
SET shortName = 'sn';

ALTER TABLE TheBooks_288
ADD OnHand INT; 

UPDATE TheBooks_288
SET OnHand =20;

ALTER TABLE Genre
DROP CONSTRAINT PK_Genre;
