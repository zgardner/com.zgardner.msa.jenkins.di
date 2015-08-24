container_volume_mount_path="/var/jenkins_home"
host_volume_mount_path="$(pwd)$container_volume_mount_path"
container_name="com.zgardner.msa.jenkins"
jenkins_version="1.617"
host_jenkins_port="8080"
container_jenkins_port="8080"
jenkins_node_hostname="node.di.jenkins.msa.zgardner.com"
jenkins_node_ip="10.0.2.15"
artifactory_hostname="artifactory.msa.zgardner.com"
artifactory_ip="192.168.1.68"

echo "Killing existing container $container_name..."
docker kill $container_name

echo "Removing existing container $container_name..."
docker rm $container_name

echo "Starting new container $container_name..."
docker run -d --name $container_name -v $host_volume_mount_path:$container_volume_mount_path -p $host_jenkins_port:$container_jenkins_port --add-host="$jenkins_node_hostname:$jenkins_node_ip" --add-host="$artifactory_hostname:$artifactory_ip" jenkins:$mysql_version
