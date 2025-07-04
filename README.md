# 📝 Django Notes App — Containerized with Docker, Nginx, and Docker Compose

This is a simple **Notes Management Web App** built using **Django** as the backend framework and **MySQL** as the database.

From a **DevOps perspective**, this project demonstrates how to:

- Containerize a Django application using **Docker**
- Orchestrate multi-container setups with **Docker Compose**
- Configure an **Nginx reverse proxy** to route HTTP traffic to the backend app
- Manage environment variables and volumes
- Apply **health checks** for reliable service coordination

---

## 🔧 Tech Stack

- 🐍 Python 3.9
- ⚙️ Django Web Framework
- 🐬 MySQL 8
- 🐳 Docker
- 📦 Docker Compose
- 🌐 Nginx
- 🧠 Gunicorn (WSGI server for Django)

---

## 🛠️ Features

- Django backend with Notes CRUD functionality
- Persistent MySQL database with Docker volumes
- Health checks for database and Django service
- Reverse proxy routing via Nginx
- Simple `.env` file support for environment configuration
- Clean and scalable multi-container setup


## Requirements
1. Python 3.9
2. Node.js
3. React

## Installation
1. Clone the repository
```
git clone https://github.com/huzaifadevcloud/Django-NotesAPP.git
```

2. Build the app
```
docker build -t notes-app .
```

3. Run the app
```
docker run -d -p 8000:8000 notes-app:latest
```

## Nginx

Install Nginx reverse proxy to make this application available

`sudo apt-get update`
`sudo apt install nginx`
