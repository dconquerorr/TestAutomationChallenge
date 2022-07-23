pipeline {
    agent any
    stages {
       stage ('Infrastructure Initiation') 
        {
            steps 
            {
                echo "${env.AWS_ACCESS_KEY}"
                sh 'export AWS_ACCESS_KEY_ID=""${env.AWS_ACCESS_KEY}""'
                sh 'export AWS_SECRET_ACCESS_KEY=""${env.AWS_SECRET_KEY}""'
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
        stage ('Deploy EC2 instance and ELK Stack') 
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
