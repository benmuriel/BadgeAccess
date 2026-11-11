
USE BadgeAccess
GO

DECLARE @i int=100, @id int = 0, @ln int  = 0;
DECLARE @name VARCHAR(10) = '';
DECLARE badge_cur CURSOR FOR SELECT Id FROM BadgeCategories WHERE [Type] = 'generic'

OPEN badge_cur;

FETCH NEXT FROM badge_cur INTO @id;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @i = 1;
    WHILE @i <= 100
        BEGIN
        SET @name = CONCAT('00',@i)
        SET @ln = LEN(@name);
        IF @ln>  3
        BEGIN 
            SET @name = SUBSTRING(@name,@ln - 2 ,3);
        END
        SET @name = CONCAT(@id,'#',@name)
        INSERT INTO dbo.Badges(BadgeNumber,CategoryId,IssueDate,ExpiryDate,IsActive)
        VALUES(@name,@id,GETDATE(),DATEADD(YEAR, 100,GETDATE()),1)
        --PRINT (@name)
        SET @i = @i+1;
     END; 
    
    -- Fetch the next row before restarting the loop
    FETCH NEXT FROM badge_cur INTO @id;
END;
CLOSE badge_cur;
DEALLOCATE badge_cur;
GO
SELECT * FROM dbo.Badges
GO