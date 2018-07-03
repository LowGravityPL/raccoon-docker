# Raccoon's docker development setup
## Simple how-to

1. Clone this repository.
1. Clone RaccoonWP repository.
1. Run `docker-compose up -d`
1. Go to http://localhost:22222. Log in with credentials `root:racoonroot` and upload your Raccoon database.

You can edit docker-compose.yml to your liking. Make sure that referenced bind in Dockerfile does exist and that your RaccoonWP repo is in that place `../RaccoonWP`.

Your local project should be accessible at http://localhost:4123/

To interactively run commands on the docker container with Raccoon do:
1. `docker container ls` -> get the container ID for the Raccoon Docker image
1. `docker container -it <container_ID> bash` - it will open bash session in which you'll be able to for example use `composer`