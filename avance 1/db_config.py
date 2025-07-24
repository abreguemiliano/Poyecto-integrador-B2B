from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Configuración de conexión a PostgreSQL
DATABASE_URL = 'postgresql://admin:admin123@localhost:5432/proyecto_db'

# Crear el engine
engine = create_engine(DATABASE_URL)

# Crear el generador de sesiones
Session = sessionmaker(bind=engine)
