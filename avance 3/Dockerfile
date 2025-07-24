
# Use official Python image as base
FROM python:3.11-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && apt-get clean

# Set working directory
WORKDIR /app

# Upgrade pip and install dbt-postgres
RUN pip install --upgrade pip && \
    pip install dbt-postgres

# Default command
CMD ["dbt", "--help"]
