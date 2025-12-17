from python:3.9-alpine3.13
label maintainer="Arad Arshadi"
ENV PYTHONUNBUFFERED 1

copy ./requirements.txt /tmp/requirements.txt
copy ./requirements.dev.txt /tmp/requirements.dev.txt
copy ./app /app
WORKDIR /app
expose 8000

Arg DEV=False
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ "$DEV" = "True" ]; \ 
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

env PATH="/py/bin:$PATH" 

user django-user