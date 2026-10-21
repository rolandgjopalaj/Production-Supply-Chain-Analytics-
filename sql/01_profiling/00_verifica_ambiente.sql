-- 1. Che SQL Server ho installato?
SELECT @@VERSION AS versione;

USE AdventureWorks2025; 

-- 2. Quante tabelle ha il gestionale?
SELECT COUNT(*) AS n_tabelle
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- 3. Come sono distribuite tra gli schemi (le "aree aziendali")?
SELECT TABLE_SCHEMA, COUNT(*) AS n_tabelle
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
GROUP BY TABLE_SCHEMA
ORDER BY n_tabelle DESC;

-- 4. Quanti ordini di produzione ci sono, e su che periodo?
SELECT COUNT(*)       AS n_ordini_produzione,
       MIN(StartDate) AS primo_ordine,
       MAX(StartDate) AS ultimo_ordine
FROM Production.WorkOrder;