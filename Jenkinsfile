pipeline {
    agent any
    stages {
       stage ('Infrastructure Initiation') 
        {
            steps 
            {                
                sh '''#!/bin/bash                  
                  export AWS_ACCESS_KEY_ID={env.AWS_ACCESS_KEY}
                  '''
                sh '''#!/bin/bash                  
                  export AWS_SECRET_ACCESS_KEY={env.AWS_SECRET_KEY}
                  '''
                sh 'printenv'
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
        stage ('Create AWS EC2 instance and deploy ELK Stack') 
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
