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


resource "aws_connect_contact_flow_module" "gts" {
  instance_id = "a7952ceb-7e2a-4b8a-bc36-ae21e64d65e9"
  name        = "gts"
  description = "GTS Contact Flow Module Description"

  content = <<JSON
    {
        "Version": "2019-10-30",
        "StartAction": "12345678-1234-1234-1234-123456789012",
        "Actions": [
            {
                "Identifier": "12345678-1234-1234-1234-123456789012",
                "Parameters": {
                    "Text": "Hello contact flow module"
                },
                "Transitions": {
                    "NextAction": "abcdef-abcd-abcd-abcd-abcdefghijkl",
                    "Errors": [],
                    "Conditions": []
                },
                "Type": "MessageParticipant"
            },
            {
                "Identifier": "abcdef-abcd-abcd-abcd-abcdefghijkl",
                "Type": "DisconnectParticipant",
                "Parameters": {},
                "Transitions": {}
            }
        ],
        "Settings": {
            "InputParameters": [],
            "OutputParameters": [],
            "Transitions": [
                {
                    "DisplayName": "Success",
                    "ReferenceName": "Success",
                    "Description": ""
                },
                {
                    "DisplayName": "Error",
                    "ReferenceName": "Error",
                    "Description": ""
                }
            ]
        }
    }
    JSON

  tags = {
    "Name"        = "Example Contact Flow Module",
    "Application" = "GTS",
    "Method"      = "Create"
  }
}
