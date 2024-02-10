# docker-blank-python

https://hub.docker.com/r/sumizadocker/python-git

example:
```
docker run --rm -e USER='Sumiza' -e REPO='Scripts' -e INSTALL='nano' -e PIP_INSTALL='requests' sumizadocker/python-git python main.py
```
compose file:
```
services:
  python-git:
    
    image: sumizadocker/python-git:latest
    
    environment:
      USER: sumiza
      REPO: scripts
      PIP_INSTALL: 'requests'
      INSTALL: nano

    command: "python main.py"
```
