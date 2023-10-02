-- Первый момент
DECLARE @nomer INT = 2;
DECLARE @proverka BIT;
WHILE (@nomer <= 1000000)
BEGIN
    SET @proverka = 1;
    DECLARE @buf INT = 2;
    WHILE (@buf <= SQRT(@nomer))
    BEGIN
        IF (@nomer % @buf = 0)
        BEGIN
            SET @proverka = 0;
            BREAK;
        END
        SET @buf = @buf + 1;
    END
    IF (@proverka = 1)
    BEGIN
        PRINT @nomer;
    END
    SET @nomer = @nomer + 1;
END

-- Второй момент
DECLARE @1 int = 0
DECLARE @2 int = 0
DECLARE @3 int = 0
DECLARE @4 int = 0
DECLARE @5 int = 0
DECLARE @6 int = 1
DECLARE @result nvarchar(6) = ''
WHILE @1 <= 9
BEGIN
	IF @6 > 9
	BEGIN
		SET @6 = 0
		SET @5 = @5 + 1
	END
	IF @5 > 9
	BEGIN
		SET @5 = 0
		SET @4 = @4 + 1
	END
	IF @4 > 9
	BEGIN
		SET @4 = 0
		SET @3 = @3 + 1
	END
	IF @3 > 9
	BEGIN
		SET @3 = 0
		SET @2 = @2 + 1
	END
	IF @2 > 9
	BEGIN
		SET @2 = 0
		SET @1 = @1 + 1
	END
	IF (@1 + @2 + @3) = (@4 + @5 + @6)
	BEGIN
		SET @result = CAST(@1 AS nvarchar(1)) + CAST(@2 AS nvarchar(1)) + CAST(@3 AS nvarchar(1)) + CAST(@4 AS nvarchar(1)) +CAST(@5 AS nvarchar(1)) +CAST(@6 AS nvarchar(1))
		PRINT @result
	END
	SET @6 = @6 + 1
END


-- 3
-- CREATE DATABASE GAME
-- USE GAME
--CREATE TABLE Bandit(
--	coins INT
--	)
--INSERT INTO Bandit (coins)
--VALUES (500)

declare @a int = rand() * 8
declare @b int = rand() * 8
declare @c int = rand() * 8
declare @point int
SELECT @point = coins FROM Bandit
IF @point != 0
BEGIN
	SELECT @a AS ' ', @b AS ' ', @c AS ' '
	IF @a = @b AND @c = 7 AND @b = @c
	BEGIN
		PRINT 'Вы победили'
	END
	IF @a = @b AND @c != 7 AND @b = @c
	BEGIN
		SET @point += 10
	END
	ELSE
	BEGIN
		SET @point -= 10
	END
	UPDATE Bandit 
	SET coins = @point
	SELECT @point AS coins
END
ELSE
	PRINT 'Нет очков!'