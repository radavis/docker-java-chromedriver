# docker-java-chromedriver

Dockerfile containing Java and Chromedriver.

## Includes

- openjdk 8
- Google Chrome
- Chromedriver

## Instructions

```
docker build . -t radavis/java-chromedriver
docker login
docker push radavis/java-chromedriver
```
