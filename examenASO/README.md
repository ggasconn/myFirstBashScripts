# Explicaciónes examen

Los scripts 2 y tres tienes dos versiones.

# Ejercicio 2
En el número 2 las dos versiones están dentro del mismo script, pero una de ellas está comentada.
La opción sin comentar es la usada en el momento del examen, funciona de forma estática, ya que solo
disponía de una máquina virtual en el momento del examen. El script estático apunta a la dirección
que tenia la máquina en el momento del examen y se conecta con certificado, es decir, sin contraseña.

Sin embargo la versión dos va pidiendo direcciones para poder hacer tantos backups como se quiera, hasta
que el usuario introduce que no quiere hacer mas. Esta opción también funciona con certificado con la
maquina usada en el examen, pero puede que en otro momento o circunstancia no funcione.

# Ejercicio 3
El ejercicio 3 también dispone de dos versiones, pero este si que tiene dos ficheros separados.
El primero, y el probado en el examen, realiza todas las operaciones a una direccion estatica,
la que tenia el otro servidor en el momento del examen. Todo funciona correctamente, pero puede
que en otro momento no vaya debido a la dirección.

La segunda versión funciona con un numero ilimitado de direcciones, va preguntando y guardando en un array los
datos de la máquinas para luego recorrerlo y hacer las operaciones pertinentes.
Este no está probado ya que solo disponia de una máquina durante el examen.
