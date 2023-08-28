@Library('my-shared-lib') _

pipeline {
    agent any 

    parameters {
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
    }  
        stages {

            stage('Git CheckOut') {
                when { expression {  params.action == 'create' } }
                steps{
                gitCheckout(
                    branch: 'main', 
                    url: 'https://github.com/mohamedrafi13/mrdevops_java_app.git'
                    )
                }
            }
                                
            stage('Unit Test Maven') {
                when { expression { params.action == 'create' } }
                steps{
                    script {
                        mvnTest()
                    }
                }
            }   
             stage('Integration Test Maven') {
                when { expression { params.action == 'create' } } 
                steps{
                    script {
                        mvnIntegrationTest()
                    }
                }
            }   
            stage('Static Code Analysis: Sonarqube') {
                when { expression { params.action == 'create' } }
                steps{
                    script {
                        def SonarqubeCredentialsId = 'sonarqube'
                        staticCodeAnalysis(SonarqubeCredentialsId)
                    }
                }
            }  
              stage('Quality Gate Status Check: Sonarqube') {
                when { expression { params.action == 'create' } }
                steps{
                    script {
                        def SonarqubeCredentialsId = 'sonarqube'
                        qualityGateCheckgit(SonarqubeCredentialsId)
                    }
                }
            }         
       }
    }
