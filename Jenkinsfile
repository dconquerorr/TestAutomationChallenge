def public_ip
def instance_id
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
                 sh 'export PUBLIC_IP=terraform output public_ip'
                 sh 'export INSTANCE_ID=terraform output instance_id'
                  script{
                    public_ip = sh(script: "echo | terraform output public_ip",returnStdout: true ).trim()
                    instance_id = sh(script: "echo | terraform output instance_id",returnStdout: true).trim()
                  }
              }
              post
              {
                  success
                  {
                      echo 'infrastructure deployed successfully'
                      sh 'echo ${instance_id}'

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
