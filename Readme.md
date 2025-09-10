# Automatización de la API de PetStore con Karate Framework

Este proyecto contiene una suite de pruebas de automatización para la API RESTful de PetStore (https://petstore.swagger.io/). Las pruebas fueron desarrolladas utilizando el framework **Karate** y **Maven** como herramienta de gestión de proyectos.

El objetivo es automatizar un flujo completo:
1. Crear una mascota.
2. Consultar la mascota por su ID.
3. Actualizar el estado de la mascota.
4. Consultar la mascota por su nuevo estado.

## Prerrequisitos
- **Java Development Kit (JDK) 11**: Las pruebas fueron desarrolladas y se ejecutan en este entorno de Java.
- **Apache Maven**: Asegúrate de tener Maven instalado y configurado en tu sistema.
- **IDE (opcional)**: Se recomienda el uso de un IDE como Eclipse o IntelliJ IDEA.

## Estructura del Proyecto
El proyecto sigue una estructura estándar de Maven:
- `src/test/java/`: Contiene la clase principal de JUnit 5 que ejecuta el test.
- `src/test/resources/petstore.feature`: El archivo de características **Gherkin** que contiene los pasos de la prueba.
- `pom.xml`: El archivo de configuración de Maven que gestiona las dependencias y la ejecución de las pruebas.

## Pasos para la Ejecución
1.  **Clona este repositorio**:
    `git clone https://github.com/LCabreraS21/petstore-prueba-api.git

2.  **Navega a la carpeta del proyecto**:
    `cd [nombre-del-proyecto]`

3.  **Ejecuta las pruebas**:
    Abre una terminal en la carpeta raíz del proyecto y ejecuta el siguiente comando de Maven:
    `mvn clean test`

## Reportes de las Pruebas
Los resultados se generan automáticamente en un reporte **HTML** en la siguiente ruta:
- `target/karate-reports_1757499593753/karate-summary.html`

Abre este archivo en tu navegador web para ver los detalles de la ejecución, incluyendo los logs de cada petición y validación.

---

## Hallazgos y Soluciones Clave

Durante el desarrollo de este proyecto, se enfrentaron varios desafíos relacionados con la inconsistencia de la API de PetStore. Las soluciones implementadas incluyen:

- **Reintentos Dinámicos**: Se utilizó la sintaxis `* retry until [condición]` para hacer la prueba más robusta, permitiendo que esperara a que los datos se actualizaran en la API.
- **Validación Avanzada**: Se implementó `karate.jsonPath()` para buscar y validar con precisión el objeto de la mascota dentro de un array de respuesta.

Estas técnicas garantizan que las pruebas sean estables y confiables, incluso cuando la API no responde de manera inmediata o consistente.