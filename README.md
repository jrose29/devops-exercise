# DevOps Exercise

This project is meant to test skills for the VoteShield DevOps Engineer role. What it does is not that important.

See [./INSTRUCTIONS.md](./INSTRUCTIONS.md) to get started.

## Usage

This exercise provides a "thing" REST API.

- `/things`: List all things
- `/things/<id>`: List specific thing

## Install

- Install with [poetry](https://python-poetry.org/)

## Development

- Run `python app/main.py`

## Deployment

A Dockerfile has been created for this application.

To build the container image:

- Run `docker build --tag devops-exercise:v0.2.0 --file Dockerfile .`

To Run the container:

- Run `docker run -d -p 5000:5000 devops-exercise:v0.2.0`

## Testing

- Run `python tests.py`

Unit Test can now also be run against the new build container with the following command:

- Run `docker exec -it devops-exercise:v0.2.0 python -m unittest`

## CI

A Continuous Integration workflow has been created here [GitHub-Pipeline](./.github/workflows/ci.yml)

## TODO

- Configure use of docker-compose for application
- Create additional testing and stages as part of CI:
    - Tests against running container such as API calls/simple curl
    - Container image vulnerability scanning.
    - Push Container to registry (i.e DockerHub)
        - Image versioning validation checks.
- Continuous Deployment using (AWS Beanstalk/ArgoCD/FluxCD)

## Credits

- Inspiration from [bregman-arie/devops-exercises](https://github.com/bregman-arie/devops-exercises)
