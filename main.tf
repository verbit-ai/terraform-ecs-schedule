resource "aws_cloudwatch_event_rule" "scheduled_task" {
  name                = "${var.container_name}_scheduled_task"
  description         = "Run ecs task at a scheduled time"
  schedule_expression = "${var.schedule_expression}"
}

resource "aws_cloudwatch_event_target" "scheduled_task" {
  target_id = "${var.container_name}_scheduled_task_target"
  rule      = "${aws_cloudwatch_event_rule.scheduled_task.name}"
  arn       = "${var.cluster_arn}"
  role_arn  = "${var.role_arn}"

  ecs_target {
    task_count          = "${var.task_count}"
    task_definition_arn = "${var.task_def_arn}"
  }

  input = <<DOC
{
  "containerOverrides": [
    {
      "name": "${var.container_name}",
      "command": "${jsonencode(split(',', var.command))}"
    }
  ]
}
DOC
}
