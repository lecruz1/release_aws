# Imagen base oficial y liviana
FROM python:3.11-slim

# Variables de entorno (buenas prácticas)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos dependencias primero (optimiza cache)
COPY app/requirements.txt .

# Instalamos dependencias
RUN python -m pip install --upgrade pip \
    && python -m pip install -r requirements.txt

# Copiamos el código
COPY app ./app

# Exponemos el puerto
EXPOSE 8000

# Comando de arranque
CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
