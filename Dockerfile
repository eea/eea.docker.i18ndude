FROM python:2-alpine
MAINTAINER "EEA: IDM2 A-Team" <eea-edw-a-team-alerts@googlegroups.com>

ENV VERSION=4.0.1

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    libxml2-dev \
    libxslt-dev \
 && pip install i18ndude==$VERSION \
 && apk del .build-deps \
 && apk add --no-cache --virtual .run-deps \
    libxml2 \
    libxslt

ENTRYPOINT ["i18ndude"]
CMD ["find-untranslated", "/code"]
