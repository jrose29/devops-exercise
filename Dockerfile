FROM python:3-slim as base
ENV PYTHONUNBUFFERED=true
WORKDIR /app


FROM base as poetry-builder
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN python -c 'from urllib.request import urlopen; print(urlopen("https://install.python-poetry.org").read().decode())' | python -
COPY . ./
RUN poetry install --no-interaction --no-ansi -vvv



FROM base as runtime

ENV PATH="/app/.venv/bin:$PATH"
COPY --from=poetry-builder /app /app
EXPOSE 5000

CMD ["python", "main.py" ]