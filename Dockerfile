FROM python:3

# Create a virtual environment
RUN python -m venv venv

# Set environment variable to use the virtual environment automatically
ENV PATH="/app/venv/bin:$PATH"

# Copy all project files into the container
COPY . .

# Install dependencies manually (including Django)
RUN pip install --no-cache-dir Django==5.1 boto3 cryptography jinja2

# Apply database migrations
RUN python manage.py migrate

# Expose the port Django runs on
EXPOSE 8010

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8010"]
