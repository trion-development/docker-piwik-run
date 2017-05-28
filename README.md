Simple docker-compose setup to run piwik locally for development without the need to run additional setup or configuration steps in the browser.

Usage

`docker-compose up`


Access via browser:

[http://localhost:9001/index.php]

Login with "admin"/"admin"

For clean re-install:

`docker-compose stop; docker-compose rm -f; sudo rm -rf database; `
