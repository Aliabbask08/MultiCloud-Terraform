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
        checkout ([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[credentialsId: 'instance_id', url: 'gi
t@github.com:Vikas-Tamboli/debug1.git']]])
}
}
    stage("terraform_init"){
       steps{
         script{
          sh "bash plugins.sh"
        }
       }
    }
   stage("Plan_state"){
      steps{
         script{
           cd aws
           terraform plan -var "access_key=$AC_KEY" -var "secret_key=$SEC_KEY"
           cd -
         }
      }
   
   }
    
