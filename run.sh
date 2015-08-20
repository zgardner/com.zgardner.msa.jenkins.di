container_volume_mount_path="/var/jenkins_home"
host_volume_mount_path="$(pwd)$container_volume_mount_path"
container_name="com.zgardner.msa.jenkins"
jenkins_version="1.617"
host_jenkins_port="8080"
container_jenkins_port="8080"

echo "Killing existing container $container_name..."
docker kill $container_name

echo "Removing existing container $container_name..."
docker rm $container_name

echo "Starting new container $container_name..."
docker run -d --name $container_name -v $host_volume_mount_path:$container_volume_mount_path -p $host_jenkins_port:$container_jenkins_port jenkins:$mysql_version
