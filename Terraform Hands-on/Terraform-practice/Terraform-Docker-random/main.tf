provider "docker" {}
provider "random" {} #random provider mapped in version.tf file

resource "docker_image" "nginx" {
    name = "nginx:latest"
    keep_locally = false
}

resource "docker_container" "nginx_container" {
    image = docker_image.nginx.latest
    name = "hello_terraform"

    ports{
        internal = 80
        external = 3000
    }
}

resource "random_pet" "dogs" {
    length = 2
}

#Here we will be including module nginx

module "nginx-pet" {
    source = ./nginx #denotes local module

    container_name = "hello-${random_pet.dogs.id}"
    nginx_port = 8001
}

#another module from hashicorp
module "hello" {
    source = "joatmon08/hello/random"

    version = "3.0.1"
    
    hello = random_pet.dog.id

        secret_key = "secret"
}