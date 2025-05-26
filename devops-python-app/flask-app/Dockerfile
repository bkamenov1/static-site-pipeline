# Use the official lightweight Python image.
FROM python:3.11-slim

# Set environment vars
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy app files
COPY . /app/

# Expose the port Flask runs on
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
