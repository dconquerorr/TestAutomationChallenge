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
                 sh 'terraform output instance_id'
                  script{
                    public_ip = sh(script: "terraform output public_ip",returnStdout: true ).trim()
                    instance_id = sh(script: "terraform output instance_id",returnStdout: true).trim()
                  }
              }
              post
              {
                  success
                  {
                      echo 'infrastructure deployed successfully'
                      echo '${instance_id}'

                  }
              }
          }
        
                stage ('Test EC2 instance is up and running & Monitor') 
          {
              steps 
              {
                  sh '''#!/bin/bash                  
                  echo -e "{env.AWS_ACCESS_GLOBAL}\n{env.AWS_SECRET_GLOBAL}\n{env.AWS_REGION}\ntext" | aws configure
                  '''                 
                  sh '''#!/bin/bash                  
                  aws ec2 describe-instance-status \
                  --instance-ids ${instance_id}
                  '''  
                                  
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
