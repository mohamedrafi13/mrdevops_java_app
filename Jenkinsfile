@Library('my-shared-lib') _

pipeline {
    agent any   
        stages {
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
                steps{
                    script {
                        mvnTest()
                    }
                }
            }   
             stage('Integration Test Maven') {
                steps{
                    script {
                        mvnIntegrationTest()
                    }
                }
            }       
       }
    }
