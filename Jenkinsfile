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
                 sh 'terraform output public_ip'
                  script{
                    def public_ip = sh(returnStdout: true, script: "terraform output public_ip").trim()
                    def instance_id = 
                  }
              }
              post
              {
                  success
                  {
                      echo 'infrastructure deployed successfully'

                  }
              }
          }
        
                stage ('Test EC2 instance is up and running & Monitor') 
          {
              steps 
              {
                 sh 'sudo apt install awscli'
                 sh 'echo text | echo us-west-2 | echo {env.AWS_SECRET_KEY} | echo {env.AWS_ACCESS_KEY} | aws configure'
                 sh 'aws ec2 describe-instance-status --instance-ids i-1234567890abcdef0'
                  script{
                    def public_ip = sh(returnStdout: true, script: "terraform output public_ip").trim()
                  }
              }
              post
              {
                  success
                  {
                      echo 'infrastructure deployed successfully'

                  }
              }
          }
        
        
        
                stage ('Destroy infra') 
          {
              steps 
              {
                 sh 'echo yes | terraform destroy'
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
