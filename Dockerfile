FROM python:alpine

ENV PYTHONUNBUFFERED=TRUE

RUN apk add --no-cache git
RUN pip install --upgrade pip

COPY docker-entrypoint.sh docker-entrypoint.sh

ENTRYPOINT ["sh","docker-entrypoint.sh"]
CMD [ "python3","main.py" ]
