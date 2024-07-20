[English version]

![Dusha Logo](https://dusha-fund.com/wp-content/themes/dusha-wp-theme/assets/images/dusha-logo.svg)
## Website
Our website is situated under [https://dusha-fund.com](https://dusha-fund.com)

## Our goals
Our foundation has its roots in the "My soul is Ukraine" project, which emerged from the desire to promote Ukrainian culture and art in Poland and to build bridges between people from both countries. Since its establishment in February 2024, we have been actively engaged in supporting various artistic and cultural activities. Our goal is not only to promote art but also to propagate values such as diversity, open dialogue between cultures, and the development of local and regional communities. 
We want to create a platform where each individual can pursue their passions and contribute to society. Let's build a community for the future together.

## Tech stack
- wordpress 6.6 + php8.1
- mysql
- webpack
- sass
- docker and docker-compose.yml - you may run our website locally with one command
- Makefile
- bash for deploying and syncing database

## Multilingual 
We are multilingual. Our main language is Polish, and we also supporting english and ukrainian.
For translations we are using PolyLang free version

# Webpack

## Run webpack 
```
docker compose run --rm node node_modules/.bin/webpack
```
or
```
make compileFront
```

## Deploy
```
make deploy
```
