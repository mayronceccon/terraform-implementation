prefix = "prod"
node_env = "production"

container_image = "mayronceccon/node-test-kubernetes:latest"

request_memory = "300Mi"
request_cpu = "70m"

limits_memory = "512Mi"
limits_cpu = "100m"

replicas = 3

min_replicas = 3
max_replicas = 5

cpu_average_utilization = 76