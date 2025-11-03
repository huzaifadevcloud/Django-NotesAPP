# ---------- Stage 1: Build Stage ----------
FROM python:3.9-slim as builder

WORKDIR /app

# Install system dependencies required to build mysqlclient
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y gcc default-libmysqlclient-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --prefix=/install --no-cache-dir -r requirements.txt
    # --prefix=/install installs packages into /install directory instead of global site-packages
    # --no-cache-dir avoids caching to reduce image size

# ---------- Stage 2: Final Runtime Image ----------
FROM python:3.9-slim

WORKDIR /app/backend

# Install runtime system packages for mysqlclient (no build tools needed here)
# netcat-openbsd: lightweight networking utility used to check service availability or debugging
# libmariadb3: MySQL/MariaDB client library required by mysqlclient
RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    libmariadb3 && \
    rm -rf /var/lib/apt/lists/*

# Copy installed Python packages from builder stage
COPY --from=builder /install /usr/local

# Copy project source code
COPY . .

# Expose port for Django/Gunicorn
EXPOSE 8000

# Run Django app using Gunicorn
CMD ["gunicorn", "notesapp.wsgi:application", "--bind", "0.0.0.0:8000"]
