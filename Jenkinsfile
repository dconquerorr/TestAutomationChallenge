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
        
        
        stage ('Compile java project') 
        {
            steps 
            {
               sh  'mvn clean compile'			   
            }
            post
            {
                success
                {
                    echo 'compiled sucessfully ....'

                }
            }
        }
		
		stage ('Build Package')
		{
		 steps 
            {
               sh  'mvn clean package'			   
            }
            post
            {
                success
                {
                    echo 'Now Archiving ....'
                    archiveArtifacts artifacts : '**/*.war'
                }
            }
		
		}

        stage ('Deploy successful build in Stage Environment')
        {
            steps
            {
                build job : 'Deploy-Stage-Pipeline'
            }
        }
		
		stage ('Execute Devops regression test suite and verify code quality')
		{
			steps
			{
				build job : 'DevOpsRegressionTests'
			}
			post
			{
				success
				{
					echo 'Regression test suite executed properly - we can gohead for UAT deployment'
				}
				failure
				{
					echo 'Regression test suite failed - Abort UAT deployment'
				}
			}
			
		}

        stage ('Deploy Successful build in UAT Environment')
        {
            steps
            {
                build job : 'Deploy-UAT-Pipeline' 
            }
            post
            {
                success
                {
                    echo 'Deployment on UAT Environment is Successful'
                }
                failure
                {
                    echo 'Deployement Failure on UAT Environment'
                }
            }
        }
        
          
    }
}
