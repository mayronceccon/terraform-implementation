prefix = "dev"
node_env = "development"

container_image = "mayronceccon/node-test-kubernetes:latest"

request_memory = "200Mi"
request_cpu = "50m"

limits_memory = "512Mi"
limits_cpu = "100m"

replicas = 2

min_replicas = 2
max_replicas = 5

cpu_average_utilization = 50