/**
 * Copyright 2025 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "id" {
  description = "The Vertex AI Workbench instance ID."
  value       = google_workbench_instance.vertex_ai_workbench.id
}

output "proxy_uri" {
  description = "The proxy endpoint that is used to access the Jupyter notebook."
  value       = google_workbench_instance.vertex_ai_workbench.proxy_uri
}

output "creator" {
  description = "Email address of entity that sent original CreateInstance request."
  value       = google_workbench_instance.vertex_ai_workbench.creator
}

output "state" {
  description = "The state of the Vertex AI Workbench instance."
  value       = google_workbench_instance.vertex_ai_workbench.state
}

output "upgrade_history" {
  description = "The upgrade history of the Vertex AI Workbench instance."
  value       = google_workbench_instance.vertex_ai_workbench.upgrade_history
}

output "health_state" {
  description = "The health state of the Vertex AI Workbench instance."
  value       = google_workbench_instance.vertex_ai_workbench.health_state
}

output "health_info" {
  description = "Additional information about the the Vertex AI Workbench instance's health."
  value       = google_workbench_instance.vertex_ai_workbench.health_info
}

output "work_bench" {
  description = "Workbenchs created"
  value       = google_workbench_instance.vertex_ai_workbench
}

output "workbench_name" {
  value       = google_workbench_instance.vertex_ai_workbench.id
  description = "The name of the Vertex AI Workbench instance"
}
