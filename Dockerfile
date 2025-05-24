# Use official Python base image
FROM python:3.9

# Set working directory inside the container
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the application code
COPY . .

# Expose the port Django runs on
EXPOSE 8000

# Run Django development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
