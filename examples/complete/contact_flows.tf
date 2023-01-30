locals {
  contact_flows = {
    inbound = {
      content = templatefile(
        "${path.module}/contact-flows/inbound.json.tftpl",
        {
          sales_queue_arn   = try(module.amazon_connect.queues["sales"].arn, "")
          support_queue_arn = try(module.amazon_connect.queues["support"].arn, "")
          lambda_arn        = aws_lambda_function.example.arn
          lex_bot_name      = aws_lex_bot.example.name
        }
      )
    }
    quick_connect = {
      type = "QUEUE_TRANSFER"
      content = templatefile(
        "${path.module}/contact-flows/quick_connect.json.tftpl",
        {
          support_queue_arn = try(module.amazon_connect.queues["support"].arn, "")
        }
      )
    }
  }
}

resource "aws_connect_contact_flow_module" "example" {
  instance_id  = "a7952ceb-7e2a-4b8a-bc36-ae21e64d65e9"
  name         = "Example"
  description  = "Example Contact Flow Module Description"
  filename     = "contact_flow_module.json"
  content_hash = filebase64sha256("contact_flow_module.json")

  tags = {
    "Name"        = "Example Contact Flow Module",
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}







