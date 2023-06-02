## Small project showing opentelemetry trace autoinstrumentation.
### Contains following parts:
* laravel standalone app
* [healthcheck endpoint](http://localhost:8080/health)
* [grafana tempo](http://localhost:3000/explore?orgId=1&left=%7B%22datasource%22:%22tempo%22,%22queries%22:%5B%7B%22refId%22:%22A%22,%22datasource%22:%7B%22type%22:%22tempo%22,%22uid%22:%22tempo%22%7D,%22queryType%22:%22nativeSearch%22%7D%5D,%22range%22:%7B%22from%22:%22now-1h%22,%22to%22:%22now%22%7D%7D)
* sample configuration for otel collector and usage of otel middleware with road runner

To run it, simply execute `docker compose up -d` (it will take some time, since grpc extension takes some time to build) and next run `docker compose exec app composer install`.
