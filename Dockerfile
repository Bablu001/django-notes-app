FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Copy requirements first to use Docker cache efficiently
COPY requirements.txt .

# Install OS-level dependencies & Python packages
RUN apt-get update && \
    apt-get install -y gcc default-libmysqlclient-dev pkg-config && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the rest of the app
COPY . .

# Expose port for Django runserver
EXPOSE 8000

# Default command to run the Django app
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
