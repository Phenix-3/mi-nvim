# Mi Configuración de Neovim

Esta es mi configuración personal de Neovim, se encuentra separada para facilitar el mantenimiento y la escalabilidad. En la rama **`nuevo`**, es donde estoy refinando la estructura de plugins, mapeos y añadiendo nuevos plugins.

## Estructura del Editor

La configuración está organizada de forma modular dentro de la carpeta `lua/`:

```text
lua/
├── funciones/     # Funciones personalizadas y utilidades
├── keymap/        # Mapeos de teclado organizados por plugin/funcionalidad
│   ├── barbar_keymap.lua
│   ├── telescope_keymap.lua
│   └── ... (y otros)
└── plugins/       # Configuraciones específicas de cada plugin
    ├── cmp_conf.lua
    ├── telescope_conf.lua
    ├── nvim-treesitter_conf.lua
    └── ... (y otros)
init.lua           # Archivo de entrada principal
```
## Plugins Destacados

Mi entorno está configurado para un flujo de trabajo moderno que incluye:

- Gestión de UI: barbar, lualine, nightfox (tema).

- Navegación: telescope, tree (nvim-tree), oil.

- Productividad y Código: cmp (autocompletado), nvim-treesitter (resaltado), comment, autopairs.

- Herramientas Especializadas: dbee (gestión de BBDD), obsidian (notas), ufo (plegado de código), git-signs.

- Terminal: toggleterm para gestión de terminales integradas.

## Instalación
```zsh
git clone https://github.com/Phenix-3/mi-nvim.git
```

## Dependencias

Aun no he recogido todas las dependencias necesarias, este apartado se actualizará más adelante.

## Notas de la rama nuevo

En esta rama estoy realizando la separación de configuraciones por archivo (siguiendo el patrón *_conf.lua y *_keymap.lua) para mantener el init.lua limpio y modular.

Si hay algún cambio en esta rama puede ser porque esté en ello o simplemente no lo haya comentado aún.
