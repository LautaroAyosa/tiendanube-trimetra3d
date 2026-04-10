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
