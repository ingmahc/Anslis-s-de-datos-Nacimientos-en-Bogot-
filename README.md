# Análisis de Datos: Nacimientos en Bogotá

Este repositorio contiene el trabajo realizado para la **Actividad 2 - Práctica SQL**, cuyo objetivo es analizar datos de nacimientos en Bogotá mediante scripts de SQL Server.

---

## 📂 Estructura del repositorio

| Archivo / Carpeta | Descripción |
|-------------------|-------------|
| `NatalidadBogota.bak` | Backup de la base de datos SQL Server con los datos de nacimientos en Bogotá. |
| `scriptbdNatalidadBogota.sql` | Script SQL para crear la base de datos, tablas, relaciones, insertar datos, constraints, etc. |
| `url dataset` | Archivo/contenido con el enlace al dataset utilizado para poblar la base de datos. |

---

## 🛠️ Requisitos

- SQL Server (una versión reciente, por ejemplo SQL Server 2017 / 2019 / 2022)  
- SQL Server Management Studio (SSMS) u otra herramienta para ejecutar script SQL  
- Suficiente espacio en disco para restaurar el backup si vas a usar el archivo `.bak`

---

## 🚀 Cómo usar el proyecto

1. **Restaurar la base de datos**  
   - Desde SSMS, clic derecho en *Databases* → *Restore Database…*  
   - Seleccionar el archivo `NatalidadBogota.bak` como origen  
   - Asignar un nombre adecuado (por ejemplo `NatalidadBogota`)  

2. **Ejecutar el script SQL**  
   - Si prefieres crear la base de datos desde cero: abrir `scriptbdNatalidadBogota.sql` y ejecutarlo  
   - El script contiene definiciones de tablas, relaciones foráneas, constraints, carga de datos, etc.

3. **Verificar datos**  
   - Tras restaurar o ejecutar el script que inserta los datos, hacer consultas simples para asegurarte que los datos estén cargados correctamente.  
   - Ejemplo:  
     ```sql
     SELECT TOP 10 * FROM Nacimientos;
     ```
   - Revisar que la tabla de hechos y dimensión funcionen correctamente, que las claves foráneas estén bien definidas, etc.

---

## 📊 Qué análisis se pueden hacer

Al tener los datos cargados puedes:

- Contar nacimientos por año, mes, sexo, localidad  
- Calcular porcentajes de cambio año a año  
- Comparar años específicos (por ejemplo 2009 vs 2024) con querys que muestran variación porcentual  
- Crear vistas para facilitar consultas frecuentes  
- Exportar resultados para visualización en herramientas externas (Excel, Power BI, etc.)

---

## ⚠️ Notas y recomendaciones

- Asegúrate de que el dataset tenga la licencia o permiso para uso académico / análisis.  
- Verificar el formato de fechas y tipos de datos (por ejemplo `DATE`, `DATETIME`) para evitar problemas al hacer cálculos de año, mes, etc.  
- Si restauras el `.bak`, el nombre de tu servidor o instancias pueden afectar rutas físicas de archivos. A veces hay que ajustar opciones de restauración.

---

## 👤 Autor

- **Miguel Angel Herrera**
- **Ingenieria en Ciencia de datos**
- **Analisís de Datos**
- **2025**  

---

## 📄 Licencia

Este repositorio se genera con fines académicos para la práctica SQL.

