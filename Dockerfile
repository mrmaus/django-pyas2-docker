FROM python:3.7

WORKDIR /app

RUN mkdir -p /app/data && pip install django-pyas2 && django-admin startproject django_pyas2 /app

COPY urls.py settings.py /app/django_pyas2/

ENV DJANGO_SUPERUSER_PASSWORD=admin

RUN python manage.py migrate && python manage.py createsuperuser --noinput --username=admin --email=admin@example.com

ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]