resource "aws_cloudwatch_event_rule" "scheduled_task" {
  name                = "${var.name}_scheduled_task"
  description         = "Run ecs task at a scheduled time"
  schedule_expression = "${var.schedule}"
}

resource "aws_cloudwatch_event_target" "scheduled_task" {
  target_id = "${var.name}_scheduled_task_target"
  rule      = "${aws_cloudwatch_event_rule.scheduled_task.name}"
  arn       = "${var.cluster_arn}"
  role_arn  = "${var.role_arn}"

  ecs_target {
    task_count          = "${var.task_count}"
    task_definition_arn = "${var.task_def_arn}"
  }
}
