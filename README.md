# Repositorio para Curso Ansible
Documentación para el curso de Ansible

# Directorio Debian ssh
Contiene un Dockerfile y los ficheros necesarios para crear una imagen Debian ssh.

Dentro se puede generar la imagen:

docker build -t debian_ssh .

Ejecutando con:

docker run -d  -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" --name debian debian_ssh

# Directorio Centos ssh
Contiene un Dockerfile y los ficheros necesarios para crear una imagen Centos ssh.

Dentro se puede generar la imagen:

docker build -t centos_ssh .

Ejecutando con:

docker run -d  -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" --name centos centos_ssh


