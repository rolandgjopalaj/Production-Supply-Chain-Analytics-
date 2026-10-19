import os
import pandas as pd
from db import get_engine

src = get_engine(os.getenv("SOURCE_DB"))
dwh = get_engine(os.getenv("DWH_DB"))

print(pd.read_sql("SELECT TOP 5 * FROM Production.WorkOrder", src))
print(pd.read_sql("SELECT DB_NAME() AS db", dwh))