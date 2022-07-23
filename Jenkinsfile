pipeline {
    agent any
    stages {
       stage ('Infrastructure Initiation') 
        {
            steps 
            {
                sh 'export AWS_ACCESS_KEY_ID="AKIA4I3EIGZGITZ5ZK6U"'
                sh 'export AWS_DEFAULT_REGION="us-west-2"'
                sh 'export AWS_SECRET_ACCESS_KEY="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"'
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
