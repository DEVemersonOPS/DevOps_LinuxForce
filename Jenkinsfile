pipeline {
    agent any
    environment {
        DOCKERFILE_WEB = 'Dockerfileweb'       // Nome do Dockerfile para a imagem web
        DOCKERFILE_DB = 'Dockerfiledb'         // Nome do Dockerfile para a imagem db
        DOCKERFILE_NGINX = 'Dockerfilenginx'   // Nome do Dockerfile para a imagem nginx
        DOCKER_IMAGE_TAG = 'latest'            // Tag da imagem Docker a ser construída
    }
    stages {

        stage('Build Images') {
            steps {
                script {
                    // Nome das imagens
                    def imageNameWeb = 'devemersonjuniorops/web'
                    def imageNameDB = 'devemersonjuniorops/db'
                    def imageNameNginx = 'devemersonjuniorops/nginx'

                    // Executa o build das imagens com os respectivos Dockerfiles
                    docker.withRegistry('https://registry.hub.docker.com', 'devemersonjuniorops') {
                        def webImage = docker.build("${imageNameWeb}:${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_WEB} .")
                        def dbImage = docker.build("${imageNameDB}:${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_DB} .")
                        def nginxImage = docker.build("${imageNameNginx}:${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_NGINX} .")

                        webImage.push()
                        dbImage.push()
                        nginxImage.push()
                    }
                }
            }
        }
        stage('Teste Aplicação') {
            steps {
                // Testes automatizados da aplicação
		sh 'docker rm -f $(docker ps -a -q)'
                sh 'docker-compose -f Docker-compose.yml up -d'

                // Realize os testes nos serviços em execução
                // Exemplo de teste usando curl para verificar se o serviço web está respondendo
                sh 'curl -I http://localhost:8000'

                sh 'docker-compose -f Docker-compose.yml down'
            }
        }
        stage('Aprovação') {
            steps {
                input 'Deseja prosseguir com o Deploy e Push?'
            }
        }
 }
}
