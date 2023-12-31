variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(any)
}

variable "lambda" {
  type = map(object({
    create                       = optional(bool)
    description                  = optional(string)
    handler                      = optional(string)
    runtime                      = optional(string)
    timeout                      = optional(number)
    memory_size                  = optional(number)
    ephemeral_storage_size       = optional(number)
    architectures                = optional(list(string))
    environment_variables        = optional(map(string))
    maximum_retry_attempts       = optional(number)
    maximum_event_age_in_seconds = optional(number)
    create_async_event_config    = optional(bool)
    policy_statements = optional(map(object({
      effect    = string
      actions   = list(string)
      resources = list(string)
    })))
    provisioned_concurrent_executions  = optional(number)
    cloudwatch_logs_retention_in_days  = optional(number)
    keep_warm                          = optional(bool)
    keep_warm_expression               = optional(string)
    policies                           = optional(list(string))
    db_instance_address                = optional(string)
    db_instance_arn                    = optional(string)
    db_instance_endpoint               = optional(string)
    db_instance_identifier             = optional(string)
    db_instance_master_user_secret_arn = optional(string)
    db_instance_name                   = optional(string)
    db_instance_port                   = optional(number)
    db_security_group_id               = optional(string)
    layers                             = optional(list(string))
    dynamodb_tables = optional(map(object({
      enabled                        = optional(bool)
      table_name                     = string
      batch_size                     = optional(number)
      starting_position              = optional(string)
      parallelization_factor         = optional(number)
      maximum_record_age_in_seconds  = optional(number)
      maximum_retry_attempts         = optional(number)
      bisect_batch_on_function_error = optional(bool)
    })))
    secret_vars = optional(map(object({
      secret_path = optional(string)
      property    = optional(string)
    })))
    cloudwatch_events = optional(map(object({
      rule_name           = optional(string)
      schedule_expression = optional(string)
    })))
  }))
  default = {}
}

