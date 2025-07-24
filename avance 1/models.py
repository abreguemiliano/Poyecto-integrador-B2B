from sqlalchemy import Column, Integer, String, Float, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Usuario(Base):
    __tablename__ = 'dim_usuarios'
    id = Column(Integer, primary_key=True)
    nombre = Column(String)
    apellido = Column(String)
    dni = Column(String, unique=True)
    email = Column(String, unique=True)
    contrasena = Column(String)

class Categoria(Base):
    __tablename__ = 'dim_categorias'
    id = Column(Integer, primary_key=True)
    nombre = Column(String)
    descripcion = Column(String)

class Producto(Base):
    __tablename__ = 'dim_productos'
    id = Column(Integer, primary_key=True)
    nombre = Column(String)
    descripcion = Column(String)
    precio = Column(Float)
    stock = Column(Integer)
    categoriaid = Column(Integer, ForeignKey('dim_categorias.id'))

class MetodoPago(Base):
    __tablename__ = 'dim_metodos_pago'
    id = Column(Integer, primary_key=True)
    nombre = Column(String)
    descripcion = Column(String)


class Orden(Base):
    __tablename__ = 'fact_ordenes'
    id = Column(Integer, primary_key=True)
    usuario_id = Column(Integer, ForeignKey('dim_usuarios.id'))
    fecha_orden = Column(DateTime)
    total = Column(Float)
    estado = Column(String)

class DetalleOrden(Base):
    __tablename__ = 'fact_detalle_ordenes'
    id = Column(Integer, primary_key=True)
    orden_id = Column(Integer, ForeignKey('fact_ordenes.id'))
    producto_id = Column(Integer, ForeignKey('dim_productos.id'))
    cantidad = Column(Integer)
    precio_unitario = Column(Float)

class DireccionEnvio(Base):
    __tablename__ = 'dim_direcciones_envio'
    id = Column(Integer, primary_key=True)
    usuario_id = Column(Integer, ForeignKey('dim_usuarios.id'))
    calle = Column(String)
    ciudad = Column(String)
    departamento = Column(String)
    provincia = Column(String)
    distrito = Column(String)
    estado = Column(String)
    codigo_postal = Column(String)
    pais = Column(String)

class Carrito(Base):
    __tablename__ = 'fact_carrito'
    id = Column(Integer, primary_key=True)
    usuario_id = Column(Integer, ForeignKey('dim_usuarios.id'))
    producto_id = Column(Integer, ForeignKey('dim_productos.id'))
    cantidad = Column(Integer)
    fecha_agregado = Column(DateTime)

class OrdenMetodoPago(Base):
    __tablename__ = 'fact_ordenes_metodo_pago'
    id = Column(Integer, primary_key=True)
    orden_id = Column(Integer, ForeignKey('fact_ordenes.id'))
    metodo_pago_id = Column(Integer, ForeignKey('dim_metodos_pago.id'))
    monto_pagado = Column(Float)

class ReseñaProducto(Base):
    __tablename__ = 'fact_resenas_productos'
    id = Column(Integer, primary_key=True)
    usuario_id = Column(Integer, ForeignKey('dim_usuarios.id'))
    producto_id = Column(Integer, ForeignKey('dim_productos.id'))
    calificacion = Column(Integer)
    comentario = Column(String)
    fecha = Column(DateTime)

class HistorialPago(Base):
    __tablename__ = 'fact_historial_pagos'
    id = Column(Integer, primary_key=True)
    orden_id = Column(Integer, ForeignKey('fact_ordenes.id'))
    metodo_pago_id = Column(Integer, ForeignKey('dim_metodos_pago.id'))
    monto = Column(Float)
    fecha_pago = Column(DateTime)
    estado_pago = Column(String)
