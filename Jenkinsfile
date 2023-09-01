@Library('my-shared-lib') _

pipeline {
    agent any 

    parameters {
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultvalue: 'javapp')
        string(name: 'ImageTag', description: "tag of the docker build", defaultvalue: 'v1')
        string(name:  'dockerhub', description "Name of the Application", defaultvalue: 'mohamedrafi')
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
            stage('Quality Gate Analysis: Sonarqube') {
                when { expression { params.action == 'create' } }
                steps{
                    script {
                        def SonarqubeCredentialsId = 'sonarqube'
                        qualityGateCheck(SonarqubeCredentialsId)
                    }
                }
            }    
            stage('Maven Build') {
                when { expression { params.action == 'create' } }
                steps{
                    script {
                        mvnBuild()
                    }
                }
            }   
            stage('Docker Build Image') {
                when { expression { params.action == 'create' } }
                steps{
                    script {
                        dockerBuild("${params.ImageName}","${params.ImageTag}","${params.dockerhub}" )
                    }
                }
            }     
       }
    }

