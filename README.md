# 📱 Deitta Prueba - Notificaciones

Proyecto Flutter que muestra un **listado de notificaciones** con detalles individuales y manejo de estado de lectura, cargadas desde un archivo JSON local.

---

## 🚀 Descripción

La aplicación consiste en:

- Una **ventana principal** con un listado de notificaciones.
  - Se muestra el **título** y **descripción**.
  - Las notificaciones se separan según el tiempo transcurrido desde que fueron recibidas.
- Al hacer clic en una notificación:
  - Se abre una vista detallada (`NotificationPage`) con:
    - Título
    - Estado (_Leída_ / _No leída_)
    - Descripción
    - Botón para **marcar como leído** (si aún no se ha leído)
- Las notificaciones se cargan desde un archivo **JSON local**.
- Se manejan errores al **cargar y parsear** el JSON.
- Incluye **tests unitarios y de widgets** para asegurar el correcto funcionamiento de la app.

---

## 📋 Tests

- Incluye tests unitarios y de widgets para:
- Renderizado correcto del listado y detalle de notificaciones.
- Cambio de estado al marcar como leído.
- Manejo de errores al cargar y parsear JSON.

- Ejecutar todos los tests:

```bash
flutter test
```

---

## ⚠️ Manejo de errores

- El servicio JsonFunctions.loadJsonData() controla posibles excepciones:

  - FlutterError → Asset no encontrado.

  - FormatException → JSON mal formado.

  - TypeError → Estructura inesperada del JSON.

  - Exception → Otros errores genéricos.

- En caso de error, retorna una lista vacía ([]).

---

## 📂 Estructura del proyecto

```bash
data/
 └── data.json                     # Archivo JSON con las notificaciones

lib/
 ├── main.dart                     # Ventana principal
 ├── notification_page.dart        # Página de detalle de notificación
 ├── notifications_page.dart       # Página de listado de notificaciones

 ├── appBar/
 │    ├── appbar_notifications.dart
 │    ├── back_button_appbar.dart
 │    └── notification_button_appbar.dart

 ├── enums/
 │    └── group.dart               # Enumeraciones usadas en la app

 ├── functions/
 │    └── json_functions.dart      # Funciones para cargar y parsear JSON

 └── models/
      └── notification_item.dart   # Modelo de notificación

test/
 └── notification_test.dart        # Tests unitarios y de widgets
```

---

## 👨‍💼 Autor

- Proyecto creado como prueba técnica para Deitta.
- Creado por Daniel García Barquilla
