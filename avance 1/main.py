from db_config import engine
from models import Base

# Crear las tablas en la base de datos
Base.metadata.create_all(engine)

print("Tablas creadas correctamente.")
