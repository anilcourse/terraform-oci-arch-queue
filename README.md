# oci-arch-queue-oke-demo

This quick start will get you started with the Queue architecture demo and provisioning of the resource for the entire architecture which includes deploying KEDA , Queue Consumer and Function with API Gateway.


## Prerequisites

- Permission to `manage` the following types of resources in your Oracle Cloud Infrastructure tenancy: `vcns`, `internet-gateways`, `route-tables`, `network-security-groups`, `subnets`, `OKE`, `functions` , `api gateway` and `Queue`.
- Quota to create all of these services


If you don't have the required permissions and quota, contact your tenancy administrator. See [Policy Reference](https://docs.cloud.oracle.com/en-us/iaas/Content/Identity/Reference/policyreference.htm), [Service Limits](https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm), [Compartment Quotas](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcequotas.htm).

## Deploy Using Oracle Resource Manager

1. Click [![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?terraformVersion=1.1&region=home&zipUrl=https://github.com/anilcourse/terraform-oci-arch-queue/releases/download/1.0.0/terraform-oci-arch-queue.zip)

    If you aren't already signed in, when prompted, enter the tenancy and user credentials.

2. Review and accept the terms and conditions.

3. Select the region where you want to deploy the stack.

4. Follow the on-screen prompts and instructions to create the stack.

5. After creating the stack, click **Terraform Actions**, and select **Plan**.

6. Wait for the job to be completed, and review the plan.

    To make any changes, return to the Stack Details page, click **Edit Stack**, and make the required changes. Then, run the **Plan** action again.

7. If no further changes are necessary, return to the Stack Details page, click **Terraform Actions**, and select **Apply**. 

## Validate the Deployment

- Post the infra deployment, note down `queue_dpendpoint` , `queue_ocid` (part of the resource manager job logs/output) to use it as part of Producer. For more details github link of  <a href="https://github.com/oracle-devrel/oci-arch-queue-oke-demo/blob/main/local-producer/readme.md">Producer</a>
- A sample stack output will be as below

```java
Outputs:
deployed_oke_kubernetes_version = "v1.26.2"
deployed_to_region = "ap-tokyo-1"
dev = "Made with ❤ by Oracle Developers"
kubeconfig_for_kubectl = "export KUBECONFIG=./generated/kubeconfig"
ocir_name = "container_repo1"
ocir_ocid = "ocid1.containerrepo.oc1.ap-tokyo-1.0.iaassiedupu.aaaaaaaarisfwdc55aa5qbvikte6qxw7qsdij3rz4re5qtfxnvdigwtibmmq"
queue_dpendpoint = "https://cell-1.queue.messaging.ap-tokyo-1.oci.oraclecloud.com"
queue_ocid = "ocid1.queue.oc1.ap-tokyo-1.amaaaaaa2wppjyqag6eeyinjug2je6mwh4hazaa3iu6tfdpqt2ppk7njlolq" 
```
## Deploy Using the Terraform CLI

### Clone the Module
Now, you'll want a local copy of this repo. You can make that with the commands:

    git clone https://github.com/oracle-quickstart/oci-sch-log2bucket.git
    cd oci-sch-log2bucket
    ls

### Set Up and Configure Terraform

1. Complete the prerequisites described [here](https://github.com/cloud-partners/oci-prerequisites).

2. Create a `terraform.tfvars` file, and specify the following variables:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
current_user_ocid    = "<user_ocid>"
fingerprint          = "<finger_print>"
private_key_path     = "<pem_private_key_path>"

# Region
region = "<oci_region>"

# Compartment
compartment_ocid = "<compartment_ocid>"

# OCIR credentials
ocir_user_name = "<user_name>"
ocir_user_password = "<auth_code of the user>"

````

### Create the Resources
Run the following commands:

    terraform init
    terraform plan
    terraform apply

### Destroy the Deployment
When you no longer need the deployment, you can run this command to destroy the resources:

    terraform destroy

## Quick Start Architecture 

![Queue Demo Architecture](https://github.com/oracle-devrel/oci-arch-queue-oke-demo/blob/main/images/demo-architecture.png?raw=true)




