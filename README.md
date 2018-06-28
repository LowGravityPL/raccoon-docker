# Raccoon's docker development setup
## Simple how-to

1. Clone this repository.
1. Clone RaccoonWP repository.
1. Add .env file in RaccoonWP repository with something similar to the example config below:
	```
	DB_NAME=racoonwp
	DB_USER=racoonwp
	DB_PASSWORD=racoonwp

	WP_ENV=development
	WP_HOME=http://localhost:4123
	WP_SITEURL=${WP_HOME}/wp
	```
1. Run `docker-compose up -d`
1. Go to http://localhost:22222. Log in with credentials `root:racoonroot` and upload your Raccoon database.

You can edit docker-compose.yml to your liking. Make sure that referenced bind in Dockerfile does exist and that your RaccoonWP repo is in that place `../RaccoonWP`.

Your local project should be accessible at http://localhost:4123/