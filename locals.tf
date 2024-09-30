locals {
  project = {
    "devops-eci-project" = {
        description = "FM Devops Project"
    }
  }
  workspace = {
    "devops-eci-tfe" = {
        description = "Example description of workspace"
        execution_mode = "local"
        project_id = module.project["devops-eci-project"].id 
    }
  }
}