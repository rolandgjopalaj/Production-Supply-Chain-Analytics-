import os
import pandas as pd
from db import get_engine

src = get_engine(os.getenv("SOURCE_DB"))
dwh = get_engine(os.getenv("DWH_DB"))

print(pd.read_sql("SELECT s.name AS schema_name, t.name AS table_name, SUM(p.rows) AS righe FROM sys.tables t JOIN sys.schemas s ON t.schema_id = s.schema_id JOIN sys.partitions p ON t.object_id = p.object_id AND p.index_id IN (0, 1) GROUP BY s.name, t.name ORDER BY s.name, righe DESC;", src))
print(pd.read_sql("SELECT DB_NAME() AS db", dwh))