# Stack-ses

Simple Email Service stack

This stack will create an SES iam user and a SQS queue if needed to manage bounced emails.

> **Pipeline** The pipeline contain a manual approval between terraform plan and terraform apply.
> That means if you trigger a terraform plan, to apply it, you have to go on terraform apply job
> and click on the `+` button to trigger it.
