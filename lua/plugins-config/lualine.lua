local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup{
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true,      -- Muestra el estado del archivo (modificado, de solo lectura, etc.)
        newfile_status = false,  -- Muestra si el archivo es nuevo
        path = 1,                -- <--- AQUÍ: 1 para ruta relativa, 2 para absoluta, 3 para absoluta con ~
        shorting_target = 40,    -- Acorta la ruta si no hay suficiente espacio en pantalla
        symbols = {
          modified = '[+]',      -- Símbolo cuando el archivo está modificado
          readonly = '[-]',      -- Símbolo cuando el archivo es de solo lectura
          unnamed = '[Sin nombre]', -- Texto para buffers sin nombre
          newfile = '[Nuevo]',     -- Símbolo para archivos nuevos
        }
      }
    },
  }
}
