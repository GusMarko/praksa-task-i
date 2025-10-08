resource "kubernetes_namespace" "praksa_task" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "api" {
  name       = "praksa-task-api-${var.environment}"
  chart      = "${path.module}/../api-helmchart"
  namespace  = kubernetes_namespace.praksa_task.id
  values     = [file("${path.module}/../api-helmchart/${var.environment}-values.yaml")]
}

resource "helm_release" "ui" {
  name       = "praksa-task-ui-${var.environment}"
  chart      = "${path.module}/../ui-helmchart"
  namespace  = kubernetes_namespace.praksa_task.id
  values     = [file("${path.module}/../ui-helmchart/${var.environment}-values.yaml")]
}

