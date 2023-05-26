terraform {
    required_providers {
        github = {
            source = "integrations/github"
            version = "~> 5.0"            
        }
    }
}

provider "github" {
    token = "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"
}

resource "github_repository" "terraform" {
    name = "terraform"
    visibility = "public"
}