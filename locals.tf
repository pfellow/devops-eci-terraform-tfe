locals {
  project = {
    "devops-eci-project" = {
        description = "FM Devops Project"
    }
  }
  workspace = {
    "devops-eci-tfe" = {
        description = "Example description of workspace"
        execution_mode = "remote"
        project_id = module.project["devops-eci-project"].id 
        vcs_repo_identifier = "${var.github_organization_name}/devops-eci-terraform-tfe" 
    }
    "devops-eci-github" = {
        description = "Description of Github workspace"
        execution_mode = "remote"
        project_id = module.project["devops-eci-project"].id 
        vcs_repo_identifier = "${var.github_organization_name}/devops-eci-terraform-github" 
    }

    "devops-eci-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["devops-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/devops-eci-terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-west-2a", "us-west-2b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "devops-eci"
        },
      ]
    }

    "devops-eci-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["devops-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/devops-eci-terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "pfellow.me"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "devops-eci-pfellow"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "devops-eci"
        },
      ]
    }
  }
}