project = "hello-world"

runner {
  enabled = true

  data_source "git" {
    url = "https://github.com/snokpok/waypoint-ecs"
  }

  poll {
    enabled = true
  }
}

app "web" {
  build {
    use "docker" {}

    registry {
      use "aws-ecr" {
        repository = "hashicorp-dev-hello-world"
        region     = "us-west-1"
        tag        = "v1"
      }
    }
  }

  deploy {
    use "aws-ecs" {
      region = "us-west-1"
      memory = 512
      logging {
        region = "us-west-1"
      }
    }
  }
}
