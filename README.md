# Python Git Docker Image

> **Updated to use Python 3.14**

This Docker image is based on the official [python](https://hub.docker.com/_/python) image, with additional tools installed such as `pip`,`git` and entrypoint scripts to facilitate cloning GitHub repositories and installing packages.

## Features

The entrypoint supports:

- Installing packages via `apt` or `apk`
- Installing Python packages via `pip`
- Cloning public or private GitHub repositories (with token)
- Setting a custom working directory
- Auto-installation by parsing Python files (⚠️ use with extreme caution)

---

**Docker Hub:**  
👉 [https://hub.docker.com/r/sumizadocker/python-git](https://hub.docker.com/r/sumizadocker/python-git)

---

## Example (Docker CLI)

```bash
docker run --rm \
  -e USER='Sumiza' \
  -e REPO='Scripts' \
  -e INSTALL='nano' \
  -e PIP_INSTALL='requests' \
  sumizadocker/python-git \
  python main.py
```
## Example (Docker Compose)
```yaml
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

## Environment Variables

| Variable       | Description                                                                 | Example                          |
|----------------|-----------------------------------------------------------------------------|----------------------------------|
| `INSTALL`      | Space-separated system packages to install (`apt` or `apk`).                | `INSTALL="nano curl"`            |
| `PIP_INSTALL`  | Space-separated Python packages to install with `pip`.                      | `PIP_INSTALL="requests numpy"`   |
| `TOKEN`        | GitHub access token for cloning private repos.                              | `TOKEN="ghp_xxx"`                |
| `USER`         | GitHub username to clone repo from.                                         | `USER="Sumiza"`                  |
| `REPO`         | GitHub repository name to clone.                                            | `REPO="Scripts"`                 |
| `DIRECTORY`    | Directory to switch into after cloning or before running.                   | `DIRECTORY="src"`                |
| `AUTO_INSTALL` | Automatically install Python packages based on `import` statements in `.py` | `AUTO_INSTALL="true"`            |

