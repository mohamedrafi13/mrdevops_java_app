@Library('my-shared-lib') _

pipeline {
    agent any 

    parameters {
        choice{name: 'action', choices: 'Create\nDelete', description: 'Choose create/Destroy'}
    }  
        stages {

            when { { expression param.action == 'create' }}
            stage('Git CheckOut') {
                steps{
                    script {
                        gitCheckout(
                            branch: 'main', 
                            url: 'https://github.com/mohamedrafi13/mrdevops_java_app.git'
                        )
                    }
                
                
                }
            }           
            stage('Unit Test Maven') {
                when { { expression param.action == 'create' }}
                steps{
                    script {
                        mvnTest()
                    }
                }
            }   
             stage('Integration Test Maven') {
                when { { expression param.action == 'create' }}
                steps{
                    script {
                        mvnIntegrationTest()
                    }
                }
            }       
       }
    }
