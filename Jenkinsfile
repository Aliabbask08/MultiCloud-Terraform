pipeline{
  agent any
  environment {
         AC_KEY = credentials('AWS_ACCESS_KEY')
         SEC_KEY = credentials('AWS_SECRET_KEY')
  
  }
  stages {
    stage("Workspace_cleanup"){
      steps{
         step([$class: 'WsCleanup'])
}
}
    stage("Repo_clone"){
      steps {
        checkout ([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[ url: 'https://github.com/Aliabbask08/MultiCloud-Terraform.git']]])
}
}
    stage("terraform_init"){
       steps{
         script{
           sh '''
               terraform init
           '''
          //sh "bash plugins.sh"
        }
       }
    }
    stage("Plan_state"){
      steps{
         script{
          sh ''' 
              cd aws
              terraform plan -var "access_key=$AC_KEY" -var "secret_key=$SEC_KEY"
              cd -
          '''
         }
      }
    }
    stage("apply_state"){
      steps{
         script{
          sh '''
              cd aws
              terraform apply -var "access_key=$AC_KEY" -var "secret_key=$SEC_KEY" --auto-approve
              cd -
          '''
         }
      }
    } 
}
}
    
