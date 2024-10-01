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
        execution_mode = "local"
        project_id = module.project["devops-eci-project"].id 
        vcs_repo_identifier = "${var.github_organization_name}/devops-eci-terraform-github" 
    }
  }
  
}