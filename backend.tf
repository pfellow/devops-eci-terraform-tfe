terraform { 
  cloud { 
    
    organization = "test-devops-pfellow" 

    workspaces { 
      name = "devops-eci-tfe" 
    } 
  } 
}