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

## 🟢 Instrucciones de ejecución

1. Asegúrate de tener Flutter instalado y configurado en tu sistema:

```bash
flutter --version
```

2. Abre un emulador o conecta un dispositivo físico (Android/iOS).
3. Navega al directorio del proyecto.
4. Instala las dependencias:

```bash
flutter pub get
```

5. Ejecuta la aplicación:

```bash
flutter run
```

---

## 📋 Tests

- Incluye tests unitarios y de widgets para:

  - Renderizado correcto del listado y detalle de notificaciones.
  - Cambio de estado al marcar como leído.

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

## 👨‍💼 Autor

- Proyecto creado como prueba técnica para Deitta.
- Creado por Daniel García Barquilla
