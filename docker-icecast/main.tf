terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "icecast_image" {
  name = "moul/icecast"
  keep_locally = false
}

resource "docker_volume" "logs" {
  name = "logs"
}

resource "docker_volume" "localtime" {
  name = "localtime"
}

resource "docker_container" "icecast" {
  image = docker_image.icecast_image.latest
  name  = "icecast"
  env = ["ICECAST_SOURCE_PASSWORD=aaa", "ICECAST_ADMIN_PASSWORD=bbb", "ICECAST_PASSWORD=ccc", "ICECAST_RELAY_PASSWORD=ddd", "ICECAST_HOSTNAME=uly.me" ]
  ports {
    internal = 8000
    external = 8001
  }
}

