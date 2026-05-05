# Diseño de base de datos 2.2 - Módulo 2
**Estudiante:** Rodrigo Huanca Maldonado  
**Especialidad:** Ingeniería de Sistemas  
**Ubicación:** Cochabamba, Bolivia  

---

## 📝 Presentación del Repositorio
Este espacio documenta el desarrollo técnico y académico correspondiente al segundo módulo del **Diplomado en Data Science**. El contenido se divide en dos enfoques: la aplicación práctica en un entorno real de mi especialidad (Mantenimiento de Celulares) y el cumplimiento de los requerimientos analíticos basados en el caso de estudio internacional **Northwind**.

Mi objetivo ha sido demostrar no solo el dominio de las herramientas SQL, sino también la capacidad de adaptar soluciones técnicas a diferentes dominios de negocio.

---

## 📂 Contenido del Proyecto

### 1. Gestión de Celulares (Proyecto de Especialidad)
Como instructor técnico y especialista en hardware, inicié este módulo modelando una solución orientada al control de inventarios y reparaciones.
*   **Enfoque:** Base de datos transaccional (OLTP).
*   **Aporte:** Diseño de tablas para gestión de componentes, microsoldadura y mantenimiento de software.
*   **Estado:** Documentado en su respectiva carpeta.

### 2. Northwind Data Warehouse (Proyecto Requerido)
Para cumplir con la rúbrica final del módulo, implementé un Almacén de Datos (DW) utilizando la base de datos Northwind como fuente de origen.
*   **Arquitectura:** Modelo Estrella (Star Schema) con Tablas de Hechos y Dimensiones.
*   **Hitos Técnicos:**
    *   **Proceso ETL:** Carga automatizada de datos reales (mínimo 25 registros por tabla).
    *   **Gestión de Errores:** Resolución de conflictos de *Collation* (cotejamiento) mediante `DATABASE_DEFAULT`.
    *   **DACPAC:** Generación de paquete de despliegue profesional a través de Visual Studio.

---

## 🛠️ Stack Tecnológico
*   **Motor:** SQL Server Management Studio (SSMS).
*   **Modelado:** Visual Studio 2022 (SQL Server Data Tools).
*   **Control de Versiones:** Git / GitHub.

---
