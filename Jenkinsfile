pipeline {
    agent any

    stages {
        stage('Run Robot Tests') {
            steps {
                bat 'call run_tests.bat'
            }
        }

        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: 'results/**'
            }
        }
    }

    post {
        failure {
            emailext subject: "❌ Robot Tests Failed",
                     body: "Check Jenkins for details.",
                     to: "phucthonguyen09@gmail.com"
        }
    }
}

