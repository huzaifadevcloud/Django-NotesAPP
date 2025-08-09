
# ---------- Stage 1: Build Stage ----------
FROM python:3.9-slim as builder

WORKDIR /app

# Install system dependencies required to build mysqlclient
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --prefix=/install --no-cache-dir -r requirements.txt


# ---------- Stage 2: Final Runtime Image ----------
FROM python:3.9-slim

WORKDIR /app/backend

# Install runtime system packages for mysqlclient (no build tools needed here)
RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    libmariadb3 \
    && rm -rf /var/lib/apt/lists/*

# Copy only installed Python packages from the builder stage
COPY --from=builder /install /usr/local

# Copy project source code
COPY . .

EXPOSE 8000

# Run using Gunicorn or manage.py as needed
CMD ["gunicorn", "notesapp.wsgi:application", "--bind", "0.0.0.0:8000"]
