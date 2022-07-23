
pipeline {
    agent any
    stages {
       stage ('Infrastructure Initiation') 
        {
            steps 
            {
               terraform init		   
            }
            post
            {
                success
                {
                    echo 'Terraform initiated successfully'

                }
            }
        }
      stage ('Infrastructure Plan') 
        {
            steps 
            {
               terraform plan		   
            }
            post
            {
                success
                {
                    echo 'Infrastructure plan created'

                }
            }
        }
        stage ('Deploy Infra') 
          {
              steps 
              {
                 terraform apply -auto-approve		   
              }
              post
              {
                  success
                  {
                      echo 'infrastructure deployed successfully'

                  }
              }
          }
    }
}
