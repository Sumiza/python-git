# docker-blank-python

example:
```
docker run --rm -e USER='Sumiza' -e REPO='Scripts' -e PIP_INSTALL='requests' sumizadocker/python-git python main.py
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

    command: "python main.py"
```
