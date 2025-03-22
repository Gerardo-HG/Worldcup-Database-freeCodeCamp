# World Cup Database 🏆

Este proyecto forma parte de la certificación de Relational Database de freeCodeCamp. Aquí se crea una base de datos llamada `worldcup` en PostgreSQL que almacena información sobre partidos de la Copa del Mundo y permite realizar consultas útiles.

## 📂 Contenido

- `worldcup.sql`: Backup completo de la base de datos.
- `insert_data.sh`: Script Bash para poblar las tablas desde un archivo CSV.
- `queries.sh`: Script Bash con consultas SQL para obtener estadísticas.
- `games.csv`: Datos de ejemplo de partidos.

## ⚙️ Tecnologías usadas

- PostgreSQL
- Bash Scripting
- CSV Data Handling

## 🚀 Objetivo

- Insertar datos de partidos de la Copa del Mundo en la base de datos.
- Ejecutar consultas SQL para extraer estadísticas útiles como:
  - Goles totales por torneo.
  - Promedio de goles por equipo y por partido.
  - Equipos ganadores por año.
  - Participantes en rondas específicas.
  - Campeones por año.

## 🏗️ Cómo usar

1. **Crear la base de datos:**

   ```bash
   createdb worldcup
   ```
   
2. **Importar el backup::**
  ```bash
   psql worldcup < worldcup.sql
  ```

3. **Poblar la base de datos desde el CSV:**
 ```
  bash insert_data.sh
 ```

4. **Ejecutar las consultas de estadísticas:**
  ```
     bash queries.sh
  ```

## Notas

-La base de datos incluye dos tablas principales:
  -teams: Almacena los nombres únicos de los equipos.
  -games: Registra los partidos, equipos involucrados, goles y etapas.
-Asegúrate de tener PostgreSQL y Bash instalados en tu sistema.

⌨️ Autor: @Gerardo-HG

Proyecto realizado para el curso de freeCodeCamp.
