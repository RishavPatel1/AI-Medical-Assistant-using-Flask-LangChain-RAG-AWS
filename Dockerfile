# Use AWS public base image (no Docker Hub rate limit)
FROM public.ecr.aws/docker/library/python:3.10-slim-buster

# Set working directory
WORKDIR /app

# Copy requirements first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the code
COPY . .

# Expose port (Flask default you are using)
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]