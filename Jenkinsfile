@Library('my-shared-lib') _

pipeline {
    agent any   
        stages {
            stage('Git CheckOut') {
                steps{
                gitCheckout(
                    branch: "main", 
                    url: "https://github.com/mohamedrafi13/mrdevops_java_app.git"
                )
                }
            }           
            
        }
}
