resource "kubernetes_cron_job" "cron" {
  metadata {
    name = "cron"
    namespace = kubernetes_namespace.namespace-terraform.metadata.0.name
  }
  spec {
    concurrency_policy = "Forbid"
    failed_jobs_history_limit = 5
    schedule = "* * * * *"
    starting_deadline_seconds = 10
    successful_jobs_history_limit = 3
    job_template {
      metadata {}
      spec {
        completions = 1
        parallelism = 1
        backoff_limit = 2
        ttl_seconds_after_finished = 10
        template {
          metadata {}
          spec {
            container {
              name = "cron"
              image = var.container_image
              command = ["/bin/sh", "-c", "date; echo Hello from the Kubernetes cluster"]
            }
          }
        }
      }
    }
  }
}