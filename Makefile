collectstatic:
	python manage.py collectstatic --noinput

superuser:
	python manage.py createsuperuser

makemigrations:
	python manage.py makemigrations --noinput

migrate:
	python manage.py migrate --noinput

run:
	python manage.py runserver

