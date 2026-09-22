# Tiendanube FTP seguro en VSCode

Este directorio ya contiene una copia local del theme para trabajar con Git antes de subir cambios.

## Configuracion recomendada de `ftp-simple`

1. Ejecuta `F1` -> `ftp-simple: Config`.
2. Reemplaza la configuracion por algo como esto.
3. Guarda el archivo temporal para que la extension lo cifre otra vez.

```json
[
  {
    "name": "tiendanube",
    "host": "ftp.tiendanube.com",
    "port": 21,
    "type": "ftp",
    "username": "<tu-usuario-ftp>",
    "password": "<tu-password-ftp>",
    "secure": true,
    "secureOptions": {
      "minVersion": "TLSv1.2",
      "servername": "ftp.tiendanube.com"
    },
    "path": "/",
    "autosave": false,
    "confirm": true,
    "backup": "C:/Users/Lautaro/_/tiendanube-ftp_server/.ftp-backups",
    "project": {
      "C:/Users/Lautaro/_/tiendanube-ftp_server": "/"
    }
  }
]
```

## Por que asi

- `secure: true`: Tiendanube exige FTPS explicito. FTP plano falla.
- `secureOptions.servername`: evita el error de certificado en el canal de datos.
- `autosave: false`: no sube en cada guardado.
- `confirm: true`: pide confirmacion antes de sobrescribir.
- `backup`: guarda una copia local previa a cada upload.
- `project`: permite subir desde esta carpeta sin tener que elegir el destino remoto cada vez.

## Flujo recomendado

1. Hace cambios locales.
2. Revisa con Git: `git diff`.
3. Guarda un commit cuando el cambio tenga sentido.
4. Sube de forma intencional con `ftp-simple: Save` sobre el archivo o carpeta.
5. Si algo sale mal, recupera desde Git o desde `.ftp-backups`.

## Si solo queres tocar snipplets

Podes cambiar `path` y `project` a `/snipplets`, pero para mantenimiento general del theme conviene trabajar con la raiz `/`.

## Validacion de paginas custom

Instala las dependencias y ejecuta el control estatico antes de subir cambios:

```powershell
npm ci
npm test
```

La suite de navegador necesita una URL de preview de Tiendanube. Sin esa variable, Playwright descubre los escenarios y los omite de forma intencional.

```powershell
$env:CUSTOM_PAGES_BASE_URL='https://url-del-preview.example'
npm run test:e2e:custom-pages
```

Antes de publicar las paginas custom:

1. Confirma en Administracion el WhatsApp y telefono principal `+54 9 11 7370-3391`, el WhatsApp de respaldo `+54 9 11 7058-7575`, el email y `Rafaela 3724, Ciudadela, Buenos Aires`.
2. Crea o reactiva los handles `sorteo`, `pre-promo` y `hot-days`; el theme los muestra finalizados y con `noindex,follow`.
3. Configura en Tiendanube el redirect HTTP 301 de `/pre-hot-sale/` a `/hot-days/`. El theme incluye solo un fallback por canonical, meta refresh y JavaScript.
4. Obtene aprobacion legal del texto de Garantias y Devoluciones.
5. Verifica cuotas, descuentos y medios vigentes contra el checkout; la pagina de Pagos no publica valores numericos no confirmados.
6. En la seccion administrativa `Preventas`, selecciona solo productos cuyo nombre incluya `Preventa` y el mes estimado (por ejemplo, `Preventa Octubre`); los demas se omiten de la landing.
7. Crea en Chatwoot un atributo personalizado de Contacto, tipo texto y clave `preorder_product`, para que la consulta de se&ntilde;a identifique el producto; si no existe, el chat abre igualmente sin ese contexto.
8. Confirma que la matriz administrativa de garantia mantenga los componentes versionados de 12, 6 y 3 meses; los 12 meses no se comunican como cobertura de la impresora completa.
