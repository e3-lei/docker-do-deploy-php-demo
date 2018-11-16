# docker php demo 

* image build
* push to docker hub
* DO provisioning by docker-machine create
* swarm stack to deploy

## Cmd

```bash
# build image
docker build -t leiw/demo-php-app .

# local run then localhost:8080
docker run -p 8080:80 leiw/demo-php-app
```

```bash
# push to docker hub
docker login
docker push leiw/demo-php-app


# do deploy
export DO_ACCESS_TOKEN=access_token
export DO_SSH_FINGERPRINT=ssh_finger_print
# export DO_SSH_KEY_FINGERPRINT="from your DO's profile security-ssh keys"

$ docker-machine create \
    --driver=digitalocean \
    --digitalocean-access-token=$DO_ACCESS_TOKEN \
    --digitalocean-ssh-key-fingerprint=$DO_SSH_FINGERPRINT \
    --digitalocean-size=1gb \
    --digitalocean-image=ubuntu-16-04-x64 \
    --digitalocean-region=fra1 \
    demo-php-app
    
# remote env
eval $(docker-machine env demo-php-app)
```

```bash
# docker swarm init
$ docker swarm init --advertise-addr droplet_ip

# docker stack deploy
$ docker stack deploy --compose-file docker-compose.yml demo-php-app
$ docker stack services demo-php-app
```