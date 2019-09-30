--HOW many artists belong to each genre

SELECT g.Name Genre, COUNT(*)
FROM Artist ar
JOIN Album al
ON ar.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN Genre g
ON t.GenreId = g.GenreId
GROUP BY 1
ORDER BY 2 DESC;



--Which media type did most customers purchase
--Which media type was the most purchased
SELECT m.Name, COUNT(i.InvoiceId) invoice_count
FROM MediaType m
JOIN Track t
ON m.MediaTypeId = t.MediaTypeId
JOIN InvoiceLine il
ON t.TrackId = il.TrackId
JOIN Invoice I
ON il.InvoiceId = i.InvoiceId
GROUP BY 1
ORDER BY 2 DESC;

--Which employee made the most
SELECT e.EmployeeId, e.FirstName||' '||e.LastName EmployeeFullName,
SUM(i.Total) total_sales
FROM Employee e
JOIN Customer ON e.EmployeeId = c.SupportRepId
JOIN Invoice I
ON c.CustomerId = i.CustomerId
GROUP BY 1, 2
ORDER BY 3 DESC;



--Which Genre were there the most purchases in?
SELECT g.name, SUM(il.unitprice * il.quantity) AS total
FROM Genre g
JOIN Track t
ON g.GenreId = t.GenreId
JOIN InvoiceLine il
ON t.TrackId = il.TrackId
GROUP BY 1
ORDER BY 2 DESC;
