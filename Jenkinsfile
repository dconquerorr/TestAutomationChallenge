pipeline {
    agent any
    stages {
       stage ('Infrastructure Initiation') 
        {
            steps 
            {
                sh 'terraform init'		   
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
               sh 'terraform plan'		   
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
                 sh 'terraform apply -auto-approve'		   
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
