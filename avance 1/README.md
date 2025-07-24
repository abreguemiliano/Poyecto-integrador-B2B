# Proyecto de Carga y Análisis de Datos con PostgreSQL y Docker

Este proyecto tiene como objetivo la creación de una base de datos relacional en PostgreSQL, la carga de datos desde archivos CSV, y el análisis exploratorio de los mismos utilizando Python y Jupyter Notebooks. El entorno se ejecuta de forma aislada mediante contenedores Docker.

---

## 📁 Estructura del Proyecto

### Carpeta `sql`

Contiene scripts relacionados con la estructura de la base de datos:

- `tables.sql`: Script de creación de tablas extraído desde PostgreSQL.
- `drops.sql`: Script para eliminar las tablas en el orden correcto, considerando las claves foráneas que impiden el borrado directo.
-  `check_inconsistencias_referenciales.sql`: Script que analiza las referencias entre pk y fk de las tablas entre dimensiones y tablas de hechos.
- `update_fk_constraints.sql`: Script que elimina temporalmente las restricciones de claves foráneas para permitir la inserción de datos corruptos o inconsistentes 
(por ejemplo, IDs que no existen en sus tablas de dimensión). Este script puede ejecutarse en pgAdmin para desactivar las FK y luego volver a crearlas.

### Archivos principales

- `models.py`: Define las tablas utilizando SQLAlchemy ORM en formato snake_case para su creación en la base de datos.
- `db_config.py`: Configuración de conexión a la base de datos PostgreSQL.
- `main.py`: Ejecuta la creación de las tablas en la base de datos utilizando los modelos definidos.

### Notebooks

- `cargar_datos.ipynb`:
Notebook que realiza la carga de datos desde archivos CSV. Las tareas incluyen:
Lectura de los archivos CSV en DataFrames.
Normalización de nombres de columnas para que coincidan con los de la base de datos.
Conversión de tipos de datos (por ejemplo, de object a tipos adecuados).
Eliminación de registros duplicados.
Inserción de los datos en sus respectivas tablas.

- `analisis.ipynb`:  
Notebook de análisis exploratorio de datos. Se cargan las tablas desde la base de datos en DataFrames y se analizan aspectos como:
Presencia de acentos en los datos, lo cual dificulta las consultas SQL.
Se implementa una función para eliminar acentos de los textos en las tablas.

---

## 🐳 Contenedores Docker

El archivo `docker-compose.yml` define dos contenedores:

- **PostgreSQL**: Base de datos relacional.
- **pgAdmin**: Interfaz web para administración de la base de datos.
- **dbt-service**: Imagen para el sistema de archivos de dbt.

## Observaciones

Los nombres de las tablas dim y fact fueron definidos en base al contenido de los archivos .csv.
Se detectó redundancia de datos en varias tablas de hechos, lo que sugiere que podrían integrarse en una única tabla para mejorar la eficiencia.
Sería recomendable incorporar una tabla de dimensión de tiempo para facilitar consultas temporales más precisas.
Se identificaron inconsistencias en los datos, especialmente en los IDs de claves primarias y foráneas, que no coinciden con sus respectivas dimensiones. Esto complica tanto la carga como las consultas de datos.

---

## ⚙️ Instalación y Ejecución

### Requisitos

- Docker
- Docker Compose

### Pasos

1. Clonar el repositorio.
2. Ejecutar el siguiente comando en la raíz del proyecto:

   ```bash
   docker-compose up -d
   ```