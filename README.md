# Solucion Error Vanguard LoL

Un script `.bat` para borrar por completo League of Legends, Riot Client y Riot Vanguard de tu PC con Windows, incluyendo todos los archivos que se quedan sueltos despues de desinstalar.

> **Ojo:** el borrado es permanente. Lee la seccion de advertencias antes de ejecutarlo.

---

## Como ejecutarlo (paso a paso)

1. Descarga `limpiar_riot.bat` desde este repositorio. Entra al archivo y usa el boton de descarga (Download raw file).
2. Cierra League of Legends y el Riot Client si los tienes abiertos.
3. Haz **clic derecho** sobre `limpiar_riot.bat`.
4. Elige **Ejecutar como administrador**.
5. Si Windows pregunta si permites cambios, di que si.
6. Cuando el script te pregunte `Quieres continuar [S,N]?`, escribe `S` y pulsa Enter.
7. Espera a que termine y aparezca el mensaje **Listo**.
8. **Reinicia el PC.** Este paso es importante, porque Vanguard trabaja a nivel de sistema y no se quita del todo hasta reiniciar.

Si lo ejecutas sin permisos de administrador, el script te avisa y se cierra sin borrar nada. Si escribes `N` en la pregunta, tampoco borra nada.

---

## Que borra

- Las carpetas de Riot Games, Riot Client y Riot Vanguard (en `Program Files`, `ProgramData`, `AppData` y en la raiz de los discos C a H, tambien dentro de `\Games`).
- Los servicios de Vanguard (`vgc` y `vgk`).
- Las claves de registro de Riot Games y de Vanguard.
- Los accesos directos del escritorio y del menu Inicio.

No toca otros juegos ni programas.

---

## Cuando te sirve

- Vanguard te da errores al abrir el juego o al iniciar el PC (por ejemplo, errores de "VAN" o de que Vanguard no se inicia).
- El desinstalador normal falla o deja carpetas y servicios colgados.
- Quieres hacer una reinstalacion limpia de LoL porque el cliente se queda trabado, no actualiza o se cierra solo.
- Ya no vas a jugar y quieres quitar Vanguard del sistema.
- Quieres recuperar espacio en disco que quedo ocupado por restos de instalaciones viejas (por ejemplo carpetas `Riot Client.old`).

---

## Por que hace falta

El desinstalador normal de Windows no siempre limpia todo. Despues de desinstalar suelen quedar:

- Carpetas de instalaciones antiguas o a medias.
- El servicio de Vanguard cargado, que puede entrar en conflicto con una instalacion nueva.
- Claves de registro y accesos directos huerfanos.

Eso es lo que provoca muchos errores al reinstalar. Con este script se quita todo de una vez, sin ir buscando carpeta por carpeta.

---

## Despues de ejecutarlo

1. Reinicia el PC.
2. Descarga el instalador nuevo desde la web oficial de Riot Games.
3. Instala de nuevo y vuelve a iniciar sesion.

---

## Advertencias

- **El borrado no se puede deshacer.** Si tienes algo dentro de una carpeta de Riot que quieras conservar, copialo antes.
- El script modifica servicios y registro de Windows, igual que lo haria un desinstalador. Lee el contenido del `.bat` antes de ejecutarlo si tienes dudas, es texto plano.
- Solo funciona en Windows.
- Usalo bajo tu propia responsabilidad.
