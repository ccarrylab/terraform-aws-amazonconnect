resource "random_string" "instance_alias" {
  length  = 32
  special = false
  numeric = false
  upper   = false
}

module "amazon_connect" {
  # source  = "aws-ia/amazonconnect/aws"
  # version = ">= 0.0.1"

  source = "../../"

  instance_identity_management_type = "CONNECT_MANAGED"
  instance_inbound_calls_enabled    = true
  instance_outbound_calls_enabled   = true
  instance_alias                    = aws_connect_instance.instance.id

  # Lex Bot Associations
  bot_associations = {
    example = {
      name = aws_lex_bot.client.name
    }
  }
}

# Lex Bot
resource "aws_lex_bot" "client" {
  name             = "client"
  child_directed   = false
  process_behavior = "BUILD"

  intent {
    intent_name    = aws_lex_intent.client.name
    intent_version = aws_lex_intent.client.version
  }

  abort_statement {
    message {
      content      = "Sorry, I am not able to assist at this time."
      content_type = "PlainText"
    }
  }

  clarification_prompt {
    max_attempts = 2

    message {
      content      = "I didn't understand you, what would you like to do?"
      content_type = "PlainText"
    }
  }
}

resource "aws_lex_intent" "client" {
  name = "client"

  fulfillment_activity {
    type = "ReturnIntent"
  }

  sample_utterances = [
    "client one",
    "client two"
  ]
}
