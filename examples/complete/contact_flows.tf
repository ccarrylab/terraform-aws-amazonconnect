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

resource "aws_connect_contact_flow" "test" {
  instance_id = "a7952ceb-7e2a-4b8a-bc36-ae21e64d65e9"
  name        = "test"
  description = "Test Contact Flow Description"
  type        = "CONTACT_FLOW"
  content     = <<JSON
     {
        "Version": "2019-10-30",
        "StartAction": "12345678-1234-1234-1234-123456789012",
        "Actions": [
            {
                "Identifier": "12345678-1234-1234-1234-123456789012",
                "Type": "MessageParticipant",
                "Transitions": {
                    "NextAction": "abcdef-abcd-abcd-abcd-abcdefghijkl",
                    "Errors": [],
                    "Conditions": []
                },
                "Parameters": {
                    "Text": "Thanks for calling the sample flow!"
                }
            },
            {
                "Identifier": "abcdef-abcd-abcd-abcd-abcdefghijkl",
                "Type": "DisconnectParticipant",
                "Transitions": {},
                "Parameters": {}
            }
        ]
    }
    JSON
  tags = {
    "Name"        = "Test Contact GTSFlow",
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}