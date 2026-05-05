# Caso de Estudio: Northwind Data Warehouse
**Diseño de base de datos 2.2 - Módulo 2: Arquitectura de Datos**  
**Autor:** Rodrigo Huanca Maldonado  

---

## Descripción del Proyecto
Este proyecto consiste en la transformación de una base de datos transaccional (OLTP) a un modelo analítico (Data Warehouse) utilizando el conjunto de datos de **Northwind Traders**. El objetivo es facilitar la toma de decisiones estratégicas mediante una estructura optimizada para consultas de inteligencia de negocios.

---

## Arquitectura de la Solución
Se implementó un **Modelo Estrella (Star Schema)** diseñado para el análisis de ventas, compuesto por las siguientes entidades:

*   **Tabla de Hechos (`Fact_Ventas`):** Almacena las métricas de cantidad y montos totales de ventas.
*   **Dimensión de Productos (`Dim_Producto`):** Contiene atributos de productos y categorías.
*   **Dimensión de Clientes (`Dim_Cliente`):** Datos geográficos y de contacto de los clientes.

---

## ⚙️ Proceso de Implementación (ETL)

El proceso de extracción, transformación y carga se realizó mediante scripts de SQL Server, asegurando la integridad de la información:

1.  **Restauración:** Se partió de un archivo de copia de seguridad (`.bak`) de Northwind para obtener la fuente de datos transaccional.
2.  **Población de Datos:** Se cargaron un mínimo de 25 registros reales por tabla, cumpliendo con los estándares de la práctica.
3.  **Desafío de Ingeniería:** Durante la integración, se identificó un conflicto de **Collation (Cotejamiento)** entre la base de datos de origen (Latin1) y el DW (Spanish).
    *   **Solución:** Se implementó la instrucción `COLLATE DATABASE_DEFAULT` en las uniones de tablas para normalizar la codificación y permitir la comparación de cadenas de texto.

---

## 📦 Paquete de Despliegue (DACPAC)
Para garantizar un despliegue profesional y portable, el proyecto fue importado a **Visual Studio 2022** utilizando *SQL Server Data Tools*.

*   **Archivo Generado:** `Proyecto_Northwind.dacpac`.
*   **Propósito:** Este archivo permite la replicación de la estructura y el esquema del Data Warehouse en cualquier entorno de producción de SQL Server de manera automatizada.

---

## 📂 Archivos en esta Carpeta
*   `1_Estructura_Northwind_DW.sql`: Script de creación del esquema estrella.
*   `2_Carga_Datos_ETL.sql`: Script de carga con la resolución técnica de cotejamiento.
*   `Proyecto_Northwind.dacpac`: Paquete de despliegue compilado.

---