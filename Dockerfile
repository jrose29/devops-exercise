# Following dockerfile has been split up into three build stages to reduce the size of the image.

# This stage is the common basis for the poetry-builder and runtime stages
FROM python:3-slim as base
ENV PYTHONUNBUFFERED=true
WORKDIR /app

# This stage installs Poetry, and uses it to install the Things application and it's dependencies in a virtual environment
FROM base as poetry-builder
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN python -c 'from urllib.request import urlopen; print(urlopen("https://install.python-poetry.org").read().decode())' | python -
COPY . ./
RUN poetry install --no-interaction --no-ansi -vvv


# This is the runtime stage and it builds the final docker image by copying and configuring the virtual environment from the poetry-builder stage.
FROM base as runtime
ENV PATH="/app/.venv/bin:$PATH"
COPY --from=poetry-builder /app /app
EXPOSE 5000
CMD ["python", "main.py" ]