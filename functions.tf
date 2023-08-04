## Copyright (c) 2020, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_functions_application" "fn_application" {
  depends_on     = [oci_queue_queue.test_queue]
  compartment_id = var.compartment_ocid
  display_name   = "cloud-queue-demo-app"
  subnet_ids     = [oci_core_subnet.application_private_subnet.id]


}

resource "oci_functions_function" "function" {
  depends_on     = [null_resource.function_Push2OCIR,oci_functions_application.fn_application, oci_queue_queue.test_queue]
  application_id = oci_functions_application.fn_application.id
  display_name   = "queuelength"
  image          = "${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/queuelength:latest"
  memory_in_mbs  = "256"
  config         = { "DP_ENDPOINT" : "${oci_queue_queue.test_queue.messages_endpoint}", "QUEUE_ID" : "${oci_queue_queue.test_queue.id}" }
}



resource "oci_artifacts_container_repository" "fn_container_repository" {
  #Required
  compartment_id = var.compartment_ocid
  display_name   = var.ocir_repo_name

}

