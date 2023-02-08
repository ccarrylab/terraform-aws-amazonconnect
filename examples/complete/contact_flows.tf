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
  instance_id = "9fbc8807-1345-4962-ab2a-83eb1b45fe1e"
  name        = "test"
  description = "Test Contact Flow Description"
  type        = "CONTACT_FLOW"
  content     = <<JSON
    {
  "Version": "2019-10-30",
  "StartAction": "0e61a6c6-6fad-4161-9a9b-84af7f26df53",
  "Metadata": {
    "entryPointPosition": {
      "x": -1088.8,
      "y": 885.6
    },
    "ActionMetadata": {
      "1531c1ce-54dd-4c2f-a3d5-6f784a9b0ff6": {
        "position": {
          "x": 1930.4,
          "y": 1962.4
        }
      },
      "a2e246f0-f42d-4916-af62-b6317397965a": {
        "position": {
          "x": 3368,
          "y": 2717.6000000000004
        }
      },
      "e138482d-c9f8-49f2-8f43-3fe0607b759b": {
        "position": {
          "x": 2748.8,
          "y": 476
        }
      },
      "286db4b7-09e2-42d5-8750-5a6a65bdf55b": {
        "position": {
          "x": 2484,
          "y": 1184
        }
      },
      "800f8a60-70c8-4c46-90a8-50ff69648211": {
        "position": {
          "x": 4768.8,
          "y": 54.400000000000006
        },
        "dynamicParams": []
      },
      "b939137e-3a23-4577-9296-404da129414c": {
        "position": {
          "x": 4783.2,
          "y": 265.6
        },
        "dynamicParams": []
      },
      "3d0234ce-963b-4f07-9992-9722ca4eb21e": {
        "position": {
          "x": 4490.400000000001,
          "y": 267.2
        },
        "conditionMetadata": [
          {
            "id": "4ab31565-6142-44ad-b0f1-328a4fc78ffc",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Sales"
          },
          {
            "id": "4cc6e837-42e5-428f-abc3-eaab5b529594",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Support"
          },
          {
            "id": "6b84907b-89e1-49ec-99d4-640b25794061",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Finance"
          },
          {
            "id": "dfd02f8b-7064-4fd7-9bda-9b2498fca1e2",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "General"
          }
        ]
      },
      "5dfdf74e-0bd0-4bb1-95ff-0bc9bf5f1c37": {
        "position": {
          "x": 4776.8,
          "y": 476.8
        },
        "dynamicParams": []
      },
      "b06e8130-7321-4f2b-9bc6-7843815f575a": {
        "position": {
          "x": 4756,
          "y": 689.6
        },
        "dynamicParams": []
      },
      "ac7b6d87-89c3-4d6a-85f3-fc4012e11b5b": {
        "position": {
          "x": 4220,
          "y": 481.6
        }
      },
      "3518c26d-d445-4700-9cea-b11e9b97df66": {
        "position": {
          "x": 6197.6,
          "y": 595.2
        }
      },
      "db36a72a-21a7-4d3f-9e44-4867b45ecc18": {
        "position": {
          "x": 4200.8,
          "y": 264
        },
        "dynamicParams": []
      },
      "b5b8ccd3-8615-4bc4-8aa1-90f6842689d1": {
        "position": {
          "x": 2529.6000000000004,
          "y": 2356.8
        }
      },
      "66bd5bda-0bbe-46ee-a131-0800e56a428a": {
        "position": {
          "x": 2833.6000000000004,
          "y": 2107.2000000000003
        }
      },
      "395cb454-a50f-4e79-be37-e4750b56db49": {
        "position": {
          "x": 3357.6000000000004,
          "y": 1876.8000000000002
        },
        "parameters": {
          "Attributes": {
            "extensionNumber": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "extensionNumber"
        ]
      },
      "bbf611b6-b5df-4193-ab21-4f7dac6395ac": {
        "position": {
          "x": 3660,
          "y": 1880
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-Get-Extension-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-Get-Extension-Module"
      },
      "eb13d1d4-65df-46b1-8165-08229ba8b541": {
        "position": {
          "x": 4514.400000000001,
          "y": 1925.6000000000001
        }
      },
      "9d63de43-e25a-4f55-b58d-6863077f8182": {
        "position": {
          "x": 4232,
          "y": 1912.8000000000002
        }
      },
      "27a07a13-8915-44ee-b930-417fe083394f": {
        "position": {
          "x": 2804.8,
          "y": 1312
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-Main-Menu-Bot"
            }
          },
          "LexSessionAttributes": {
            "ExtensionSlotCapturePrompt": {
              "useDynamic": true
            }
          }
        },
        "dynamicMetadata": {
          "ExtensionSlotCapturePrompt": true
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-Main-Menu-Bot",
        "conditionMetadata": [
          {
            "id": "c1cab316-7b62-4e13-991b-20d6dbe27f0e",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Sales"
          },
          {
            "id": "4a678ecb-c858-431d-9620-6809609285c7",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Support"
          },
          {
            "id": "0e248384-5e98-4fe5-993f-89c1d4cd0e84",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Finance"
          },
          {
            "id": "8f119f8a-b4a3-4f8c-92d0-7feccaf5d25f",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Operator"
          },
          {
            "id": "7cbf09a1-be38-4f2d-8bae-16dddbed5e77",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Extension"
          }
        ]
      },
      "2aa9aa64-d195-46a8-a94f-7c3c2e4ca14d": {
        "position": {
          "x": 2808.8,
          "y": 790.4000000000001
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-Main-Menu-Bot"
            }
          },
          "LexSessionAttributes": {
            "ExtensionSlotCapturePrompt": {
              "useDynamic": true
            }
          }
        },
        "dynamicMetadata": {
          "ExtensionSlotCapturePrompt": true
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-Main-Menu-Bot",
        "conditionMetadata": [
          {
            "id": "045e8789-dcee-4279-9d60-62455af56f6d",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Sales"
          },
          {
            "id": "bc650f14-b03b-4b96-bfaa-9c44131901a4",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Support"
          },
          {
            "id": "59d29126-668a-4f9d-b89a-3680cd14f711",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Finance"
          },
          {
            "id": "dbe22db3-6152-4cf9-b951-bba1dae24615",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          },
          {
            "id": "303d1ca6-6365-4036-b921-b5193869bdac",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Operator"
          },
          {
            "id": "24f7739b-7620-4bda-a93a-f0fedd6518a9",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Extension"
          }
        ]
      },
      "aa9770dc-9124-4842-88e9-c6d84b17c631": {
        "position": {
          "x": 3044.8,
          "y": 19.200000000000003
        },
        "parameters": {
          "QueueId": {
            "displayName": "BasicQueue"
          }
        },
        "queue": {
          "text": "BasicQueue"
        }
      },
      "d8c978de-c4d3-4a7c-ab2c-c04d42a95c1e": {
        "position": {
          "x": 3068,
          "y": 223.20000000000002
        },
        "parameters": {
          "QueueId": {
            "displayName": "Sales"
          }
        },
        "queue": {
          "text": "Sales"
        }
      },
      "eda25fd0-bd96-45ba-abfe-bca877d349ae": {
        "position": {
          "x": 3084,
          "y": 414.40000000000003
        },
        "parameters": {
          "QueueId": {
            "displayName": "Support"
          }
        },
        "queue": {
          "text": "Support"
        }
      },
      "54ca1617-17cc-4ec2-be9b-f0caa3d1806e": {
        "position": {
          "x": 3098.4,
          "y": 611.2
        },
        "parameters": {
          "QueueId": {
            "displayName": "Finance"
          }
        },
        "queue": {
          "text": "Finance"
        }
      },
      "0fb3f538-d2f7-442f-8200-0b977c930273": {
        "position": {
          "x": 3320.8,
          "y": 8.8
        },
        "parameters": {
          "EventHooks": {
            "CustomerQueue": {
              "displayName": "GTS-Dynamic-QueueFlow"
            }
          }
        },
        "contactFlow": {
          "text": "GTS-Dynamic-QueueFlow",
          "id": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/8cb32c0b-4b06-4158-86e1-47f547afe433"
        },
        "customerOrAgent": true
      },
      "16f45259-0307-4819-b5a0-e94f59efa06a": {
        "position": {
          "x": 3556,
          "y": 9.600000000000001
        },
        "parameters": {
          "QueueId": {
            "useDynamic": true
          }
        },
        "useDynamic": true,
        "queue": "$.Queue.ARN"
      },
      "6e0aa2dd-a8cf-4874-8552-f1ba26adacc0": {
        "position": {
          "x": 2228,
          "y": 2624.8
        }
      },
      "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3": {
        "position": {
          "x": 3132,
          "y": 2664.8
        }
      },
      "7e81c107-7f17-4679-9c3e-beaf46886745": {
        "position": {
          "x": 2540.8,
          "y": 2718.4
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot",
        "conditionMetadata": [
          {
            "id": "f45be749-c292-4ab7-a228-55cda2e6fec8",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Voicemail"
          },
          {
            "id": "6baa31f2-bfd1-440a-b66f-bf080bb44d8f",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          }
        ]
      },
      "421cffb3-627d-4086-8b49-0fe6b0eb8fe5": {
        "position": {
          "x": 2816,
          "y": 2672.8
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "201f17a1-9bee-4631-b02f-b5b57a8b7cc0": {
        "position": {
          "x": 3398.4,
          "y": 1404
        }
      },
      "cc183a4f-0e08-40f6-8b02-799e7b2c8ebb": {
        "position": {
          "x": 3948.8,
          "y": 1208
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-CallbackModule"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-CallbackModule"
      },
      "6e392d00-a515-41a7-aab2-0fe21617b7b2": {
        "position": {
          "x": 3931.2000000000003,
          "y": 1008.8000000000001
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "76a796ee-06d6-4657-a34d-8e1c366e2d8b": {
        "position": {
          "x": 4188.8,
          "y": 29.6
        },
        "parameters": {
          "LambdaFunctionARN": {
            "displayName": "GetCurrentTimeStampLambda"
          }
        },
        "dynamicMetadata": {}
      },
      "a602ae04-3200-46f4-8a6e-d1975388a03e": {
        "position": {
          "x": 3339.2000000000003,
          "y": 239.20000000000002
        },
        "conditionMetadata": [
          {
            "id": "69908a3b-90e2-4673-89d7-deccdfee61cc",
            "operator": {
              "name": "Is greater than",
              "value": "GreaterThan",
              "shortDisplay": ">"
            },
            "value": "5"
          }
        ]
      },
      "a4c00620-7fa6-4398-a137-f2e9eecf4574": {
        "position": {
          "x": 3724.8,
          "y": 1336
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot",
        "conditionMetadata": [
          {
            "id": "9285e8ed-1214-4e84-9963-4b5adfed048c",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Voicemail"
          },
          {
            "id": "0bde3ce8-fe09-4dc0-be85-ff4b1ff3dd35",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          },
          {
            "id": "6988e058-083b-4bd4-ac63-670f451003f7",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "21b86222-1854-4ab7-ac69-a9ecfaef6163",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ScheduledCallback"
          }
        ]
      },
      "89b374d3-da18-40b0-bf0e-cf124bffba60": {
        "position": {
          "x": 3967.2000000000003,
          "y": 1397.6000000000001
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "AC-Blog-Callback-Welcome"
          }
        },
        "ContactFlow": {
          "text": "AC-Blog-Callback-Welcome"
        }
      },
      "127ea2fb-7a5f-423e-b4b9-c5d78b259821": {
        "position": {
          "x": 5683.200000000001,
          "y": 771.2
        }
      },
      "b5b98b1d-8599-4657-af1a-6ba26ae09a63": {
        "position": {
          "x": 5915.200000000001,
          "y": 780
        }
      },
      "d8291569-e322-420f-83f5-1623e4521bd4": {
        "position": {
          "x": 5381.6,
          "y": 444
        }
      },
      "4a41d98c-109b-4fea-85d6-fb3f5bc37b09": {
        "position": {
          "x": 5918.400000000001,
          "y": 235.20000000000002
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-CallbackModule"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-CallbackModule"
      },
      "20d7d21e-ae19-48a3-91b2-3a0d1c4b0995": {
        "position": {
          "x": 5902.400000000001,
          "y": 52.800000000000004
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "90b9cbf9-0d0e-48ae-adca-66ec82432f5f": {
        "position": {
          "x": 5930.400000000001,
          "y": 458.40000000000003
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "AC-Blog-Callback-Welcome"
          }
        },
        "ContactFlow": {
          "text": "AC-Blog-Callback-Welcome"
        }
      },
      "bd44cf21-4027-40a7-b175-5e8ec8fdbb35": {
        "position": {
          "x": 5073.6,
          "y": 312
        }
      },
      "1b10466d-5141-48d7-b619-d2a707a9a76a": {
        "position": {
          "x": 6162.400000000001,
          "y": 365.6
        }
      },
      "93049137-c0bc-4671-9d7a-62c9bcf417de": {
        "position": {
          "x": 5688,
          "y": 394.40000000000003
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot",
        "conditionMetadata": [
          {
            "id": "5b69fc7a-0024-40c7-abdf-277da2899267",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Voicemail"
          },
          {
            "id": "0933203a-a690-439a-8ad0-443993970316",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          },
          {
            "id": "8f672a6e-e98f-41b8-85bd-1f62784ba698",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "facebef5-1e40-4b27-bffd-707c77b0b941",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ScheduledCallback"
          }
        ]
      },
      "29d7f613-d596-4172-8fd2-c3fc37921163": {
        "position": {
          "x": 1108.8,
          "y": 1181.6000000000001
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "GTS-Dynamic-Switchboard-Chat"
          }
        },
        "ContactFlow": {
          "text": "GTS-Dynamic-Switchboard-Chat"
        }
      },
      "fb0ec88f-629c-4518-a131-9b7f63c5f023": {
        "position": {
          "x": 826.4000000000001,
          "y": 1192
        },
        "parameters": {
          "Attributes": {
            "AfterHoursPrompt": {
              "useDynamic": true
            },
            "HolidayClosedPrompt": {
              "useDynamic": true
            },
            "InvalidEntryPrompt": {
              "useDynamic": true
            },
            "MainMenuPrompt": {
              "useDynamic": true
            },
            "NoInputPrompt": {
              "useDynamic": true
            },
            "WelcomePrompt": {
              "useDynamic": true
            },
            "VoiceMailFinancePrompt": {
              "useDynamic": true
            },
            "VoiceMailGeneralPrompt": {
              "useDynamic": true
            },
            "VoiceMailSalesPrompt": {
              "useDynamic": true
            },
            "VoiceMailSupportPrompt": {
              "useDynamic": true
            },
            "GoodbyePrompt": {
              "useDynamic": true
            },
            "AgentConnectErrorPrompt": {
              "useDynamic": true
            },
            "VMInstructionsPrompt": {
              "useDynamic": true
            },
            "FatalErrorPrompt": {
              "useDynamic": true
            },
            "VoicemailFinishedPrompt": {
              "useDynamic": true
            },
            "EnterAgentExtensionPrompt": {
              "useDynamic": true
            },
            "AgentNotAvailableWording": {
              "useDynamic": true
            },
            "ExtensionSlotCapturePrompt": {
              "useDynamic": true
            },
            "dialedPhoneNumber": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "AfterHoursPrompt",
          "HolidayClosedPrompt",
          "InvalidEntryPrompt",
          "MainMenuPrompt",
          "NoInputPrompt",
          "WelcomePrompt",
          "VoiceMailFinancePrompt",
          "VoiceMailGeneralPrompt",
          "VoiceMailSalesPrompt",
          "VoiceMailSupportPrompt",
          "GoodbyePrompt",
          "AgentConnectErrorPrompt",
          "VMInstructionsPrompt",
          "FatalErrorPrompt",
          "VoicemailFinishedPrompt",
          "EnterAgentExtensionPrompt",
          "AgentNotAvailableWording",
          "ExtensionSlotCapturePrompt",
          "dialedPhoneNumber"
        ]
      },
      "f881de3a-ddd8-46da-9166-7f0133344d4d": {
        "position": {
          "x": 2189.6,
          "y": 1729.6000000000001
        },
        "parameters": {
          "HoursOfOperationId": {
            "displayName": "GTS Hours of Operations"
          }
        },
        "Hours": {
          "id": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/operating-hours/39fc3b10-25f3-44b8-86dd-fc4b30924f69",
          "text": "GTS Hours of Operations"
        }
      },
      "aaa773cf-f966-4eae-b0a3-9713ea50c2fc": {
        "position": {
          "x": 573.6,
          "y": 1245.6000000000001
        },
        "dynamicMetadata": {
          "DialedPhoneNumber": false
        }
      },
      "0e61a6c6-6fad-4161-9a9b-84af7f26df53": {
        "position": {
          "x": -937.6,
          "y": 930.4000000000001
        }
      },
      "646ad3ca-6133-418b-b85c-2818b526fe53": {
        "position": {
          "x": -925.6,
          "y": 1104.8
        }
      },
      "07c8b65e-8392-4cf3-81b5-bf5b20c9c0cc": {
        "position": {
          "x": -924,
          "y": 1302.4
        },
        "overrideConsoleVoice": true
      },
      "6135942e-d54e-4714-97b8-405675c4ec6c": {
        "position": {
          "x": -902.4000000000001,
          "y": 1492
        },
        "conditionMetadata": [
          {
            "id": "67d7b2c7-ec41-4b56-a175-396fe57e9257",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CHAT"
          },
          {
            "id": "1938853a-7320-4ed4-96e2-f54320014c1a",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "TASK"
          }
        ]
      },
      "bda63b8c-0685-43b2-af0e-a55efe5d0e5a": {
        "position": {
          "x": -935.2,
          "y": 1824.8000000000002
        },
        "parameters": {
          "LambdaFunctionARN": {
            "displayName": "GTS-Pull-Emergency-Message-From-Table"
          },
          "LambdaInvocationAttributes": {
            "DialedPhoneNumber": {
              "useDynamic": true
            }
          }
        },
        "dynamicMetadata": {
          "DialedPhoneNumber": true
        }
      },
      "7d3f048b-7463-4e3f-a98a-098311141393": {
        "position": {
          "x": 1920,
          "y": 1387.2
        },
        "conditionMetadata": [
          {
            "id": "71923460-0941-4704-8a2a-f7d862a0edf3",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "True"
          },
          {
            "id": "9c2f4982-923d-41d5-a9cb-9a6503b33815",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "False"
          }
        ]
      },
      "6a96bd2d-fe2b-4a5f-ae3c-4f6ca888cc6d": {
        "position": {
          "x": 1668,
          "y": 1032.8
        }
      },
      "055b9f81-a09b-4668-8016-237d4e7327dc": {
        "position": {
          "x": 1974.4,
          "y": 983.2
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot",
        "conditionMetadata": [
          {
            "id": "54e5a59c-ce11-4f31-8f17-60d0ef91b14c",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Voicemail"
          },
          {
            "id": "2eb0f50f-ebc5-4c08-bb8b-caa499ce95cf",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          }
        ]
      },
      "fe7cc7eb-7c25-43c8-98e0-cbf33898912e": {
        "position": {
          "x": 1564.8000000000002,
          "y": 1595.2
        },
        "parameters": {
          "Attributes": {
            "isHoliday": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "isHoliday"
        ]
      },
      "0adf2413-1b59-466e-b767-29a3c8a052cb": {
        "position": {
          "x": 1193.6000000000001,
          "y": 1637.6000000000001
        },
        "dynamicMetadata": {}
      },
      "c8b68be3-bb7d-4bc2-b9be-06afd1d5d6e2": {
        "position": {
          "x": 412,
          "y": 1682.4
        }
      },
      "6f817b66-dfa4-47bb-b177-262ea26ce737": {
        "position": {
          "x": -660,
          "y": 1768.8000000000002
        },
        "parameters": {
          "Attributes": {
            "RedFlag": {
              "useDynamic": true
            },
            "MessageOfTheDay": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "RedFlag",
          "MessageOfTheDay"
        ]
      },
      "37f24a02-6000-42da-b565-889ea243b3ff": {
        "position": {
          "x": 185.60000000000002,
          "y": 1726.4
        },
        "parameters": {
          "Attributes": {
            "AfterHoursPrompt": {
              "useDynamic": true
            },
            "HolidayClosedPrompt": {
              "useDynamic": true
            },
            "InvalidEntryPrompt": {
              "useDynamic": true
            },
            "MainMenuPrompt": {
              "useDynamic": true
            },
            "NoInputPrompt": {
              "useDynamic": true
            },
            "WelcomePrompt": {
              "useDynamic": true
            },
            "VoiceMailFinancePrompt": {
              "useDynamic": true
            },
            "VoiceMailGeneralPrompt": {
              "useDynamic": true
            },
            "VoiceMailSalesPrompt": {
              "useDynamic": true
            },
            "VoiceMailSupportPrompt": {
              "useDynamic": true
            },
            "GoodbyePrompt": {
              "useDynamic": true
            },
            "AgentConnectErrorPrompt": {
              "useDynamic": true
            },
            "VMInstructionsPrompt": {
              "useDynamic": true
            },
            "FatalErrorPrompt": {
              "useDynamic": true
            },
            "VoicemailFinishedPrompt": {
              "useDynamic": true
            },
            "EnterAgentExtensionPrompt": {
              "useDynamic": true
            },
            "AgentNotAvailableWording": {
              "useDynamic": true
            },
            "ExtensionSlotCapturePrompt": {
              "useDynamic": true
            },
            "dialedPhoneNumber": {
              "useDynamic": true
            },
            "HigherThanNormalCallVolumePrompt": {
              "useDynamic": true
            },
            "QueueAtCapacityPrompt": {
              "useDynamic": true
            },
            "QueueWaitTimeLimitPrompt": {
              "useDynamic": true
            },
            "ScheduledCallbackAnsweredPrompt": {
              "useDynamic": true
            },
            "DateTimeSceduleCapturePrompt": {
              "useDynamic": true
            },
            "DateTimeNotRecognizedPrompt": {
              "useDynamic": true
            },
            "RepeatDateTimeEnteredPrompt": {
              "useDynamic": true
            },
            "DateTimeRequestedOOHPrompt": {
              "useDynamic": true
            },
            "DateTimeRequestedTooFarAdvancePrompt": {
              "useDynamic": true
            },
            "DateTimeRequestedHasPassedPrompt": {
              "useDynamic": true
            },
            "DateTimeRequestedAvailablePrompt": {
              "useDynamic": true
            },
            "DateTimeRequestedNoSlotsPrompt": {
              "useDynamic": true
            },
            "DateTimeSpeakAvailableSlotsPrompt": {
              "useDynamic": true
            },
            "DateTimeConfirmRetryPrompt": {
              "useDynamic": true
            },
            "DateTimeRetryConfirmedPrompt": {
              "useDynamic": true
            },
            "DateTimeScheduleConfirmedPrompt": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "AfterHoursPrompt",
          "HolidayClosedPrompt",
          "InvalidEntryPrompt",
          "MainMenuPrompt",
          "NoInputPrompt",
          "WelcomePrompt",
          "VoiceMailFinancePrompt",
          "VoiceMailGeneralPrompt",
          "VoiceMailSalesPrompt",
          "VoiceMailSupportPrompt",
          "GoodbyePrompt",
          "AgentConnectErrorPrompt",
          "VMInstructionsPrompt",
          "FatalErrorPrompt",
          "VoicemailFinishedPrompt",
          "EnterAgentExtensionPrompt",
          "AgentNotAvailableWording",
          "ExtensionSlotCapturePrompt",
          "dialedPhoneNumber",
          "HigherThanNormalCallVolumePrompt",
          "QueueAtCapacityPrompt",
          "QueueWaitTimeLimitPrompt",
          "ScheduledCallbackAnsweredPrompt",
          "DateTimeSceduleCapturePrompt",
          "DateTimeNotRecognizedPrompt",
          "RepeatDateTimeEnteredPrompt",
          "DateTimeRequestedOOHPrompt",
          "DateTimeRequestedTooFarAdvancePrompt",
          "DateTimeRequestedHasPassedPrompt",
          "DateTimeRequestedAvailablePrompt",
          "DateTimeRequestedNoSlotsPrompt",
          "DateTimeSpeakAvailableSlotsPrompt",
          "DateTimeConfirmRetryPrompt",
          "DateTimeRetryConfirmedPrompt",
          "DateTimeScheduleConfirmedPrompt"
        ]
      },
      "ba4f0a3e-594a-4a68-b29d-0e270de71046": {
        "position": {
          "x": 1925.6000000000001,
          "y": 1712
        }
      },
      "507ee35b-a05d-4180-9755-c761788f6f6f": {
        "position": {
          "x": -43.2,
          "y": 1774.4
        },
        "parameters": {
          "LambdaInvocationAttributes": {
            "DialedPhoneNumber": {
              "useDynamic": true
            }
          }
        },
        "dynamicMetadata": {
          "DialedPhoneNumber": true
        }
      },
      "79456dbc-4c66-4559-bc3b-8523163eab05": {
        "position": {
          "x": 1628.8000000000002,
          "y": 720.8000000000001
        }
      },
      "49d729e2-6f6e-4a03-b177-fe523d134d6b": {
        "position": {
          "x": 2448.8,
          "y": 954.4000000000001
        }
      },
      "a6c51175-8232-4e38-abed-78f5383338ed": {
        "position": {
          "x": 2208.8,
          "y": 637.6
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "4b8456ea-0309-425a-91a8-6822fcb951fd": {
        "position": {
          "x": 706.4000000000001,
          "y": 1463.2
        },
        "conditionMetadata": [
          {
            "id": "240feb99-dc31-4e3d-8424-6a0ad383ae51",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "yes"
          },
          {
            "id": "2313fcab-5469-4a4e-a162-79a2beb4a81f",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "no"
          }
        ]
      },
      "1e3bfb7f-b8b9-4299-80ca-4243815387ff": {
        "position": {
          "x": 1916,
          "y": 664
        },
        "conditionMetadata": [
          {
            "id": "74857674-54d3-4b1b-b1e3-5b43f5c72077",
            "value": "1"
          }
        ]
      }
    },
    "name": "GTS-Dynamic-Switchboard",
    "description": "",
    "type": "contactFlow",
    "status": "published",
    "hash": {}
  },
  "Actions": [
    {
      "Parameters": {},
      "Identifier": "1531c1ce-54dd-4c2f-a3d5-6f784a9b0ff6",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {},
      "Identifier": "a2e246f0-f42d-4916-af62-b6317397965a",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "e138482d-c9f8-49f2-8f43-3fe0607b759b",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "2aa9aa64-d195-46a8-a94f-7c3c2e4ca14d",
        "Conditions": [
          {
            "NextAction": "2aa9aa64-d195-46a8-a94f-7c3c2e4ca14d",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "2aa9aa64-d195-46a8-a94f-7c3c2e4ca14d",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "286db4b7-09e2-42d5-8750-5a6a65bdf55b",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "800f8a60-70c8-4c46-90a8-50ff69648211",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
        "Errors": [
          {
            "NextAction": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "b939137e-3a23-4577-9296-404da129414c",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
        "Errors": [
          {
            "NextAction": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.callerQueue"
      },
      "Identifier": "3d0234ce-963b-4f07-9992-9722ca4eb21e",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "b06e8130-7321-4f2b-9bc6-7843815f575a",
        "Conditions": [
          {
            "NextAction": "800f8a60-70c8-4c46-90a8-50ff69648211",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Sales"
              ]
            }
          },
          {
            "NextAction": "b939137e-3a23-4577-9296-404da129414c",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Support"
              ]
            }
          },
          {
            "NextAction": "5dfdf74e-0bd0-4bb1-95ff-0bc9bf5f1c37",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Finance"
              ]
            }
          },
          {
            "NextAction": "b06e8130-7321-4f2b-9bc6-7843815f575a",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "General"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "b06e8130-7321-4f2b-9bc6-7843815f575a",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "5dfdf74e-0bd0-4bb1-95ff-0bc9bf5f1c37",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
        "Errors": [
          {
            "NextAction": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "b06e8130-7321-4f2b-9bc6-7843815f575a",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
        "Errors": [
          {
            "NextAction": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Error setting contact attribute"
      },
      "Identifier": "ac7b6d87-89c3-4d6a-85f3-fc4012e11b5b",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "3d0234ce-963b-4f07-9992-9722ca4eb21e",
        "Errors": [
          {
            "NextAction": "3d0234ce-963b-4f07-9992-9722ca4eb21e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "3518c26d-d445-4700-9cea-b11e9b97df66",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "Attributes": {
          "callerQueue": "$.Queue.Name",
          "queueStartTimestamp": "$.External.queueStartTimestamp"
        }
      },
      "Identifier": "db36a72a-21a7-4d3f-9e44-4867b45ecc18",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "3d0234ce-963b-4f07-9992-9722ca4eb21e",
        "Errors": [
          {
            "NextAction": "ac7b6d87-89c3-4d6a-85f3-fc4012e11b5b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "b5b8ccd3-8615-4bc4-8aa1-90f6842689d1",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3",
        "Conditions": [
          {
            "NextAction": "2aa9aa64-d195-46a8-a94f-7c3c2e4ca14d",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.InvalidEntryPrompt\n</speak>"
      },
      "Identifier": "66bd5bda-0bbe-46ee-a131-0800e56a428a",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "b5b8ccd3-8615-4bc4-8aa1-90f6842689d1",
        "Errors": [
          {
            "NextAction": "b5b8ccd3-8615-4bc4-8aa1-90f6842689d1",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "extensionNumber": "$.Lex.Slots.ExtensionSlot"
        }
      },
      "Identifier": "395cb454-a50f-4e79-be37-e4750b56db49",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "bbf611b6-b5df-4193-ab21-4f7dac6395ac",
        "Errors": [
          {
            "NextAction": "bbf611b6-b5df-4193-ab21-4f7dac6395ac",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "e841e885-387a-4b7e-975a-aa8f6538b0c9"
      },
      "Identifier": "bbf611b6-b5df-4193-ab21-4f7dac6395ac",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "9d63de43-e25a-4f55-b58d-6863077f8182",
        "Errors": [
          {
            "NextAction": "9d63de43-e25a-4f55-b58d-6863077f8182",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "eb13d1d4-65df-46b1-8165-08229ba8b541",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.GoodbyePrompt\n</speak>"
      },
      "Identifier": "9d63de43-e25a-4f55-b58d-6863077f8182",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "eb13d1d4-65df-46b1-8165-08229ba8b541",
        "Errors": [
          {
            "NextAction": "eb13d1d4-65df-46b1-8165-08229ba8b541",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.MainMenuPrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/DLI5SGQSFG/YBNHHR9AIM"
        },
        "LexSessionAttributes": {
          "ExtensionSlotCapturePrompt": "$.Attributes.ExtensionSlotCapturePrompt"
        }
      },
      "Identifier": "27a07a13-8915-44ee-b930-417fe083394f",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "66bd5bda-0bbe-46ee-a131-0800e56a428a",
        "Conditions": [
          {
            "NextAction": "d8c978de-c4d3-4a7c-ab2c-c04d42a95c1e",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Sales"
              ]
            }
          },
          {
            "NextAction": "eda25fd0-bd96-45ba-abfe-bca877d349ae",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Support"
              ]
            }
          },
          {
            "NextAction": "54ca1617-17cc-4ec2-be9b-f0caa3d1806e",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Finance"
              ]
            }
          },
          {
            "NextAction": "aa9770dc-9124-4842-88e9-c6d84b17c631",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Operator"
              ]
            }
          },
          {
            "NextAction": "395cb454-a50f-4e79-be37-e4750b56db49",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Extension"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "66bd5bda-0bbe-46ee-a131-0800e56a428a",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "66bd5bda-0bbe-46ee-a131-0800e56a428a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.MainMenuFailPrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/DLI5SGQSFG/YBNHHR9AIM"
        },
        "LexSessionAttributes": {
          "ExtensionSlotCapturePrompt": "$.External.ExtensionSlotCapturePrompt"
        }
      },
      "Identifier": "2aa9aa64-d195-46a8-a94f-7c3c2e4ca14d",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "66bd5bda-0bbe-46ee-a131-0800e56a428a",
        "Conditions": [
          {
            "NextAction": "d8c978de-c4d3-4a7c-ab2c-c04d42a95c1e",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Sales"
              ]
            }
          },
          {
            "NextAction": "eda25fd0-bd96-45ba-abfe-bca877d349ae",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Support"
              ]
            }
          },
          {
            "NextAction": "54ca1617-17cc-4ec2-be9b-f0caa3d1806e",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Finance"
              ]
            }
          },
          {
            "NextAction": "e138482d-c9f8-49f2-8f43-3fe0607b759b",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          },
          {
            "NextAction": "aa9770dc-9124-4842-88e9-c6d84b17c631",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Operator"
              ]
            }
          },
          {
            "NextAction": "395cb454-a50f-4e79-be37-e4750b56db49",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Extension"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "66bd5bda-0bbe-46ee-a131-0800e56a428a",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "66bd5bda-0bbe-46ee-a131-0800e56a428a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
      },
      "Identifier": "aa9770dc-9124-4842-88e9-c6d84b17c631",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "0fb3f538-d2f7-442f-8200-0b977c930273",
        "Errors": [
          {
            "NextAction": "0fb3f538-d2f7-442f-8200-0b977c930273",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
      },
      "Identifier": "d8c978de-c4d3-4a7c-ab2c-c04d42a95c1e",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "0fb3f538-d2f7-442f-8200-0b977c930273",
        "Errors": [
          {
            "NextAction": "0fb3f538-d2f7-442f-8200-0b977c930273",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
      },
      "Identifier": "eda25fd0-bd96-45ba-abfe-bca877d349ae",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "0fb3f538-d2f7-442f-8200-0b977c930273",
        "Errors": [
          {
            "NextAction": "0fb3f538-d2f7-442f-8200-0b977c930273",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
      },
      "Identifier": "54ca1617-17cc-4ec2-be9b-f0caa3d1806e",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "0fb3f538-d2f7-442f-8200-0b977c930273",
        "Errors": [
          {
            "NextAction": "0fb3f538-d2f7-442f-8200-0b977c930273",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "EventHooks": {
          "CustomerQueue": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/8cb32c0b-4b06-4158-86e1-47f547afe433"
        }
      },
      "Identifier": "0fb3f538-d2f7-442f-8200-0b977c930273",
      "Type": "UpdateContactEventHooks",
      "Transitions": {
        "NextAction": "16f45259-0307-4819-b5a0-e94f59efa06a",
        "Errors": [
          {
            "NextAction": "16f45259-0307-4819-b5a0-e94f59efa06a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "$.Queue.ARN"
      },
      "Identifier": "16f45259-0307-4819-b5a0-e94f59efa06a",
      "Type": "GetMetricData",
      "Transitions": {
        "NextAction": "a602ae04-3200-46f4-8a6e-d1975388a03e",
        "Errors": [
          {
            "NextAction": "a602ae04-3200-46f4-8a6e-d1975388a03e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "6e0aa2dd-a8cf-4874-8552-f1ba26adacc0",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "7e81c107-7f17-4679-9c3e-beaf46886745",
        "Conditions": [
          {
            "NextAction": "7e81c107-7f17-4679-9c3e-beaf46886745",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "7e81c107-7f17-4679-9c3e-beaf46886745",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.GoodbyePrompt\n</speak>"
      },
      "Identifier": "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "a2e246f0-f42d-4916-af62-b6317397965a",
        "Errors": [
          {
            "NextAction": "a2e246f0-f42d-4916-af62-b6317397965a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.AfterHoursPrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TEQDKPA1QQ/O2HB1BBTRW"
        }
      },
      "Identifier": "7e81c107-7f17-4679-9c3e-beaf46886745",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3",
        "Conditions": [
          {
            "NextAction": "421cffb3-627d-4086-8b49-0fe6b0eb8fe5",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Voicemail"
              ]
            }
          },
          {
            "NextAction": "6e0aa2dd-a8cf-4874-8552-f1ba26adacc0",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "8b870bae-ab28-4eb4-8da0-cf31a6e4be40"
      },
      "Identifier": "421cffb3-627d-4086-8b49-0fe6b0eb8fe5",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3",
        "Errors": [
          {
            "NextAction": "8369bf78-a6e2-41d5-aebe-aeb2e3421dd3",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "201f17a1-9bee-4631-b02f-b5b57a8b7cc0",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "a4c00620-7fa6-4398-a137-f2e9eecf4574",
        "Conditions": [
          {
            "NextAction": "a4c00620-7fa6-4398-a137-f2e9eecf4574",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "a4c00620-7fa6-4398-a137-f2e9eecf4574",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "63903492-812b-422e-817e-72e13f81ab73"
      },
      "Identifier": "cc183a4f-0e08-40f6-8b02-799e7b2c8ebb",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Errors": [
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "8b870bae-ab28-4eb4-8da0-cf31a6e4be40"
      },
      "Identifier": "6e392d00-a515-41a7-aab2-0fe21617b7b2",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Errors": [
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:GetCurrentTimeStampLambda",
        "InvocationTimeLimitSeconds": "3"
      },
      "Identifier": "76a796ee-06d6-4657-a34d-8e1c366e2d8b",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "db36a72a-21a7-4d3f-9e44-4867b45ecc18",
        "Errors": [
          {
            "NextAction": "db36a72a-21a7-4d3f-9e44-4867b45ecc18",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Metrics.Queue.Size"
      },
      "Identifier": "a602ae04-3200-46f4-8a6e-d1975388a03e",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "76a796ee-06d6-4657-a34d-8e1c366e2d8b",
        "Conditions": [
          {
            "NextAction": "a4c00620-7fa6-4398-a137-f2e9eecf4574",
            "Condition": {
              "Operator": "NumberGreaterThan",
              "Operands": [
                "5"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "76a796ee-06d6-4657-a34d-8e1c366e2d8b",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.HigherThanNormalCallVolumePrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TEQDKPA1QQ/O2HB1BBTRW"
        }
      },
      "Identifier": "a4c00620-7fa6-4398-a137-f2e9eecf4574",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Conditions": [
          {
            "NextAction": "6e392d00-a515-41a7-aab2-0fe21617b7b2",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Voicemail"
              ]
            }
          },
          {
            "NextAction": "201f17a1-9bee-4631-b02f-b5b57a8b7cc0",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          },
          {
            "NextAction": "cc183a4f-0e08-40f6-8b02-799e7b2c8ebb",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "89b374d3-da18-40b0-bf0e-cf124bffba60",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ScheduledCallback"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "76a796ee-06d6-4657-a34d-8e1c366e2d8b",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/8cb32c0b-4b06-4158-86e1-47f547afe433"
      },
      "Identifier": "89b374d3-da18-40b0-bf0e-cf124bffba60",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Errors": [
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.InvalidEntryPrompt\n</speak>"
      },
      "Identifier": "127ea2fb-7a5f-423e-b4b9-c5d78b259821",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "b5b98b1d-8599-4657-af1a-6ba26ae09a63",
        "Errors": [
          {
            "NextAction": "b5b98b1d-8599-4657-af1a-6ba26ae09a63",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "b5b98b1d-8599-4657-af1a-6ba26ae09a63",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Conditions": [
          {
            "NextAction": "93049137-c0bc-4671-9d7a-62c9bcf417de",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "d8291569-e322-420f-83f5-1623e4521bd4",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "93049137-c0bc-4671-9d7a-62c9bcf417de",
        "Conditions": [
          {
            "NextAction": "93049137-c0bc-4671-9d7a-62c9bcf417de",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "93049137-c0bc-4671-9d7a-62c9bcf417de",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "63903492-812b-422e-817e-72e13f81ab73"
      },
      "Identifier": "4a41d98c-109b-4fea-85d6-fb3f5bc37b09",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Errors": [
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "8b870bae-ab28-4eb4-8da0-cf31a6e4be40"
      },
      "Identifier": "20d7d21e-ae19-48a3-91b2-3a0d1c4b0995",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Errors": [
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/8cb32c0b-4b06-4158-86e1-47f547afe433"
      },
      "Identifier": "90b9cbf9-0d0e-48ae-adca-66ec82432f5f",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Errors": [
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "bd44cf21-4027-40a7-b175-5e8ec8fdbb35",
      "Type": "TransferContactToQueue",
      "Transitions": {
        "NextAction": "9d63de43-e25a-4f55-b58d-6863077f8182",
        "Errors": [
          {
            "NextAction": "93049137-c0bc-4671-9d7a-62c9bcf417de",
            "ErrorType": "QueueAtCapacity"
          },
          {
            "NextAction": "9d63de43-e25a-4f55-b58d-6863077f8182",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.GoodbyePrompt\n</speak>"
      },
      "Identifier": "1b10466d-5141-48d7-b619-d2a707a9a76a",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "3518c26d-d445-4700-9cea-b11e9b97df66",
        "Errors": [
          {
            "NextAction": "3518c26d-d445-4700-9cea-b11e9b97df66",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.QueueAtCapacityPrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TEQDKPA1QQ/O2HB1BBTRW"
        }
      },
      "Identifier": "93049137-c0bc-4671-9d7a-62c9bcf417de",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
        "Conditions": [
          {
            "NextAction": "20d7d21e-ae19-48a3-91b2-3a0d1c4b0995",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Voicemail"
              ]
            }
          },
          {
            "NextAction": "d8291569-e322-420f-83f5-1623e4521bd4",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          },
          {
            "NextAction": "4a41d98c-109b-4fea-85d6-fb3f5bc37b09",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "90b9cbf9-0d0e-48ae-adca-66ec82432f5f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ScheduledCallback"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "127ea2fb-7a5f-423e-b4b9-c5d78b259821",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "1b10466d-5141-48d7-b619-d2a707a9a76a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/8cb32c0b-4b06-4158-86e1-47f547afe433"
      },
      "Identifier": "29d7f613-d596-4172-8fd2-c3fc37921163",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "AfterHoursPrompt": "$.External.AfterHoursPrompt",
          "HolidayClosedPrompt": "$.External.HolidayClosedPrompt",
          "InvalidEntryPrompt": "$.External.InvalidEntryPrompt",
          "MainMenuPrompt": "$.External.MainMenuPrompt",
          "NoInputPrompt": "$.External.NoInputPrompt",
          "WelcomePrompt": "$.External.WelcomePrompt",
          "VoiceMailFinancePrompt": "$.External.VoiceMailFinancePrompt",
          "VoiceMailGeneralPrompt": "$.External.VoiceMailGeneralPrompt",
          "VoiceMailSalesPrompt": "$.External.VoiceMailSalesPrompt",
          "VoiceMailSupportPrompt": "$.External.VoiceMailSupportPrompt",
          "GoodbyePrompt": "$.External.GoodbyePrompt",
          "AgentConnectErrorPrompt": "$.External.AgentConnectErrorPrompt",
          "VMInstructionsPrompt": "$.External.VMInstructionsPrompt",
          "FatalErrorPrompt": "$.External.FatalErrorPrompt",
          "VoicemailFinishedPrompt": "$.External.VoicemailFinishedPrompt",
          "EnterAgentExtensionPrompt": "$.External.EnterAgentExtensionPrompt",
          "AgentNotAvailableWording": "$.External.AgentNotAvailableWording",
          "ExtensionSlotCapturePrompt": "$.External.ExtensionSlotCapturePrompt",
          "dialedPhoneNumber": "$.SystemEndpoint.Address"
        }
      },
      "Identifier": "fb0ec88f-629c-4518-a131-9b7f63c5f023",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "29d7f613-d596-4172-8fd2-c3fc37921163",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "HoursOfOperationId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/operating-hours/0ccc573f-d431-4b39-bb3b-6ea69ab87019"
      },
      "Identifier": "f881de3a-ddd8-46da-9166-7f0133344d4d",
      "Type": "CheckHoursOfOperation",
      "Transitions": {
        "NextAction": "7e81c107-7f17-4679-9c3e-beaf46886745",
        "Conditions": [
          {
            "NextAction": "27a07a13-8915-44ee-b930-417fe083394f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "True"
              ]
            }
          },
          {
            "NextAction": "7e81c107-7f17-4679-9c3e-beaf46886745",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "False"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "7e81c107-7f17-4679-9c3e-beaf46886745",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:GTS-Dynamic-Pull-Prompt-From-Table-Lambda",
        "InvocationTimeLimitSeconds": "8",
        "LambdaInvocationAttributes": {
          "DialedPhoneNumber": "+19092939891"
        }
      },
      "Identifier": "aaa773cf-f966-4eae-b0a3-9713ea50c2fc",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "fb0ec88f-629c-4518-a131-9b7f63c5f023",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowLoggingBehavior": "Enabled"
      },
      "Identifier": "0e61a6c6-6fad-4161-9a9b-84af7f26df53",
      "Type": "UpdateFlowLoggingBehavior",
      "Transitions": {
        "NextAction": "646ad3ca-6133-418b-b85c-2818b526fe53"
      }
    },
    {
      "Parameters": {
        "RecordingBehavior": {
          "RecordedParticipants": [
            "Agent",
            "Customer"
          ]
        },
        "AnalyticsBehavior": {
          "Enabled": "True",
          "AnalyticsLanguage": "en-US",
          "AnalyticsRedactionBehavior": "Disabled",
          "AnalyticsRedactionResults": "None",
          "ChannelConfiguration": {
            "Chat": {
              "AnalyticsModes": []
            },
            "Voice": {
              "AnalyticsModes": [
                "RealTime"
              ]
            }
          }
        }
      },
      "Identifier": "646ad3ca-6133-418b-b85c-2818b526fe53",
      "Type": "UpdateContactRecordingBehavior",
      "Transitions": {
        "NextAction": "07c8b65e-8392-4cf3-81b5-bf5b20c9c0cc"
      }
    },
    {
      "Parameters": {
        "TextToSpeechVoice": "Joanna",
        "TextToSpeechEngine": "Neural",
        "TextToSpeechStyle": "Conversational"
      },
      "Identifier": "07c8b65e-8392-4cf3-81b5-bf5b20c9c0cc",
      "Type": "UpdateContactTextToSpeechVoice",
      "Transitions": {
        "NextAction": "6135942e-d54e-4714-97b8-405675c4ec6c"
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Channel"
      },
      "Identifier": "6135942e-d54e-4714-97b8-405675c4ec6c",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "bda63b8c-0685-43b2-af0e-a55efe5d0e5a",
        "Conditions": [
          {
            "NextAction": "aaa773cf-f966-4eae-b0a3-9713ea50c2fc",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CHAT"
              ]
            }
          },
          {
            "NextAction": "bda63b8c-0685-43b2-af0e-a55efe5d0e5a",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "TASK"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "bda63b8c-0685-43b2-af0e-a55efe5d0e5a",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:GTS-Pull-Emergency-Message-From-Table",
        "InvocationTimeLimitSeconds": "8",
        "LambdaInvocationAttributes": {
          "DialedPhoneNumber": "$.SystemEndpoint.Address"
        }
      },
      "Identifier": "bda63b8c-0685-43b2-af0e-a55efe5d0e5a",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "6f817b66-dfa4-47bb-b177-262ea26ce737",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.isHoliday"
      },
      "Identifier": "7d3f048b-7463-4e3f-a98a-098311141393",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
        "Conditions": [
          {
            "NextAction": "055b9f81-a09b-4668-8016-237d4e7327dc",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "True"
              ]
            }
          },
          {
            "NextAction": "f881de3a-ddd8-46da-9166-7f0133344d4d",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "False"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "6a96bd2d-fe2b-4a5f-ae3c-4f6ca888cc6d",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "055b9f81-a09b-4668-8016-237d4e7327dc",
        "Conditions": [
          {
            "NextAction": "055b9f81-a09b-4668-8016-237d4e7327dc",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "055b9f81-a09b-4668-8016-237d4e7327dc",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.HolidayClosedPrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TEQDKPA1QQ/O2HB1BBTRW"
        }
      },
      "Identifier": "055b9f81-a09b-4668-8016-237d4e7327dc",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
        "Conditions": [
          {
            "NextAction": "a6c51175-8232-4e38-abed-78f5383338ed",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Voicemail"
              ]
            }
          },
          {
            "NextAction": "6a96bd2d-fe2b-4a5f-ae3c-4f6ca888cc6d",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "isHoliday": "$.External.isHoliday"
        }
      },
      "Identifier": "fe7cc7eb-7c25-43c8-98e0-cbf33898912e",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "7d3f048b-7463-4e3f-a98a-098311141393",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:GTS-Gold-Holiday-Lambda",
        "InvocationTimeLimitSeconds": "3"
      },
      "Identifier": "0adf2413-1b59-466e-b767-29a3c8a052cb",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "fe7cc7eb-7c25-43c8-98e0-cbf33898912e",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.WelcomePrompt\n</speak>"
      },
      "Identifier": "c8b68be3-bb7d-4bc2-b9be-06afd1d5d6e2",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "4b8456ea-0309-425a-91a8-6822fcb951fd",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "RedFlag": "$.External.RedFlag",
          "MessageOfTheDay": "$.External.MessageOfTheDay"
        }
      },
      "Identifier": "6f817b66-dfa4-47bb-b177-262ea26ce737",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "507ee35b-a05d-4180-9755-c761788f6f6f",
        "Errors": [
          {
            "NextAction": "507ee35b-a05d-4180-9755-c761788f6f6f",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "AfterHoursPrompt": "$.External.AfterHoursPrompt",
          "HolidayClosedPrompt": "$.External.HolidayClosedPrompt",
          "InvalidEntryPrompt": "$.External.InvalidEntryPrompt",
          "MainMenuPrompt": "$.External.MainMenuPrompt",
          "NoInputPrompt": "$.External.NoInputPrompt",
          "WelcomePrompt": "$.External.WelcomePrompt",
          "VoiceMailFinancePrompt": "$.External.VoiceMailFinancePrompt",
          "VoiceMailGeneralPrompt": "$.External.VoiceMailGeneralPrompt",
          "VoiceMailSalesPrompt": "$.External.VoiceMailSalesPrompt",
          "VoiceMailSupportPrompt": "$.External.VoiceMailSupportPrompt",
          "GoodbyePrompt": "$.External.GoodbyePrompt",
          "AgentConnectErrorPrompt": "$.External.AgentConnectErrorPrompt",
          "VMInstructionsPrompt": "$.External.VMInstructionsPrompt",
          "FatalErrorPrompt": "$.External.FatalErrorPrompt",
          "VoicemailFinishedPrompt": "$.External.VoicemailFinishedPrompt",
          "EnterAgentExtensionPrompt": "$.External.EnterAgentExtensionPrompt",
          "AgentNotAvailableWording": "$.External.AgentNotAvailableWording",
          "ExtensionSlotCapturePrompt": "$.External.ExtensionSlotCapturePrompt",
          "dialedPhoneNumber": "$.SystemEndpoint.Address",
          "HigherThanNormalCallVolumePrompt": "$.External.HigherThanNormalCallVolumePrompt",
          "QueueAtCapacityPrompt": "$.External.QueueAtCapacityPrompt",
          "QueueWaitTimeLimitPrompt": "$.External.QueueWaitTimeLimitPrompt",
          "ScheduledCallbackAnsweredPrompt": "$.External.ScheduledCallbackAnsweredPrompt",
          "DateTimeSceduleCapturePrompt": "$.External.DateTimeSceduleCapturePrompt",
          "DateTimeNotRecognizedPrompt": "$.External.DateTimeNotRecognizedPrompt",
          "RepeatDateTimeEnteredPrompt": "$.External.RepeatDateTimeEnteredPrompt",
          "DateTimeRequestedOOHPrompt": "$.External.DateTimeRequestedOOHPrompt",
          "DateTimeRequestedTooFarAdvancePrompt": "$.External.DateTimeRequestedTooFarAdvancePrompt",
          "DateTimeRequestedHasPassedPrompt": "$.External.DateTimeRequestedHasPassedPrompt",
          "DateTimeRequestedAvailablePrompt": "$.External.DateTimeRequestedAvailablePrompt",
          "DateTimeRequestedNoSlotsPrompt": "$.External.DateTimeRequestedNoSlotsPrompt",
          "DateTimeSpeakAvailableSlotsPrompt": "$.External.DateTimeSpeakAvailableSlotsPrompt",
          "DateTimeConfirmRetryPrompt": "$.External.DateTimeConfirmRetryPrompt",
          "DateTimeRetryConfirmedPrompt": "$.External.DateTimeRetryConfirmedPrompt",
          "DateTimeScheduleConfirmedPrompt": "$.External.DateTimeScheduleConfirmedPrompt"
        }
      },
      "Identifier": "37f24a02-6000-42da-b565-889ea243b3ff",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "c8b68be3-bb7d-4bc2-b9be-06afd1d5d6e2",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.FatalErrorPrompt\n</speak>"
      },
      "Identifier": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "1531c1ce-54dd-4c2f-a3d5-6f784a9b0ff6",
        "Errors": [
          {
            "NextAction": "1531c1ce-54dd-4c2f-a3d5-6f784a9b0ff6",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:GTS-Dynamic-Pull-Prompt-From-Table-Lambda",
        "InvocationTimeLimitSeconds": "8",
        "LambdaInvocationAttributes": {
          "DialedPhoneNumber": "$.SystemEndpoint.Address"
        }
      },
      "Identifier": "507ee35b-a05d-4180-9755-c761788f6f6f",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "37f24a02-6000-42da-b565-889ea243b3ff",
        "Errors": [
          {
            "NextAction": "ba4f0a3e-594a-4a68-b29d-0e270de71046",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "79456dbc-4c66-4559-bc3b-8523163eab05",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "1e3bfb7f-b8b9-4299-80ca-4243815387ff",
        "Conditions": [
          {
            "NextAction": "1e3bfb7f-b8b9-4299-80ca-4243815387ff",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "1e3bfb7f-b8b9-4299-80ca-4243815387ff",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.GoodbyePrompt\n</speak>"
      },
      "Identifier": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "286db4b7-09e2-42d5-8750-5a6a65bdf55b",
        "Errors": [
          {
            "NextAction": "286db4b7-09e2-42d5-8750-5a6a65bdf55b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "8b870bae-ab28-4eb4-8da0-cf31a6e4be40"
      },
      "Identifier": "a6c51175-8232-4e38-abed-78f5383338ed",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
        "Errors": [
          {
            "NextAction": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.RedFlag"
      },
      "Identifier": "4b8456ea-0309-425a-91a8-6822fcb951fd",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "0adf2413-1b59-466e-b767-29a3c8a052cb",
        "Conditions": [
          {
            "NextAction": "1e3bfb7f-b8b9-4299-80ca-4243815387ff",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "yes"
              ]
            }
          },
          {
            "NextAction": "0adf2413-1b59-466e-b767-29a3c8a052cb",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "no"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "0adf2413-1b59-466e-b767-29a3c8a052cb",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "StoreInput": "False",
        "InputTimeLimitSeconds": "5",
        "SSML": "<speak>\n$.Attributes.MessageOfTheDay.\nIf you would like to leave a voicemail, please press 1.\n</speak>"
      },
      "Identifier": "1e3bfb7f-b8b9-4299-80ca-4243815387ff",
      "Type": "GetParticipantInput",
      "Transitions": {
        "NextAction": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
        "Conditions": [
          {
            "NextAction": "a6c51175-8232-4e38-abed-78f5383338ed",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "1"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "79456dbc-4c66-4559-bc3b-8523163eab05",
            "ErrorType": "InputTimeLimitExceeded"
          },
          {
            "NextAction": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "49d729e2-6f6e-4a03-b177-fe523d134d6b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
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

resource "aws_connect_contact_flow_module" "GTS-Dynamic-Callback" {
  instance_id = "9fbc8807-1345-4962-ab2a-83eb1b45fe1e"
  name        = "GTS-Dynamic-Callback"
  description = "GTS-Dynamic-CallbackModule"

  content = <<JSON
    {
  "Version": "2019-10-30",
  "StartAction": "b17642b4-1a91-44dd-b962-22c5103b2421",
  "Metadata": {
    "entryPointPosition": {
      "x": 40,
      "y": 40
    },
    "ActionMetadata": {
      "51ccc869-b6de-4f02-b235-ee483a3e800a": {
        "position": {
          "x": 1108,
          "y": 368
        }
      },
      "5f549ee4-5942-40ed-9aae-5622db0d4c11": {
        "position": {
          "x": 878.4000000000001,
          "y": 23.200000000000003
        }
      },
      "b17642b4-1a91-44dd-b962-22c5103b2421": {
        "position": {
          "x": 636.8000000000001,
          "y": 116
        },
        "conditionMetadata": [],
        "countryCodePrefix": "+1"
      },
      "97c306a2-8a70-4604-a431-4f03c5c97c5b": {
        "position": {
          "x": 1596.8000000000002,
          "y": 341.6
        }
      },
      "9695ce5d-39eb-4f88-badf-495f7337f9cd": {
        "position": {
          "x": 1860.8000000000002,
          "y": 285.6
        }
      },
      "1187e023-0492-4771-81f7-dc97b94db640": {
        "position": {
          "x": 1149.6000000000001,
          "y": 15.200000000000001
        }
      },
      "c68e72e8-c746-4255-afca-b8717e0d142a": {
        "position": {
          "x": 1385.6000000000001,
          "y": 110.4
        },
        "parameters": {
          "QueueId": {
            "displayName": "General Callback"
          }
        },
        "queue": {
          "id": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/a159b5a4-07df-4049-a2f1-ad0b90520a55",
          "text": "General Callback"
        }
      }
    },
    "name": "GTS-Dynamic-CallbackModule",
    "description": "",
    "status": "published",
    "hash": {}
  },
  "Actions": [
    {
      "Parameters": {
        "Text": "The number entered is invalid. Please try again."
      },
      "Identifier": "51ccc869-b6de-4f02-b235-ee483a3e800a",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "b17642b4-1a91-44dd-b962-22c5103b2421"
      }
    },
    {
      "Parameters": {
        "CallbackNumber": "$.StoredCustomerInput"
      },
      "Identifier": "5f549ee4-5942-40ed-9aae-5622db0d4c11",
      "Type": "UpdateContactCallbackNumber",
      "Transitions": {
        "NextAction": "1187e023-0492-4771-81f7-dc97b94db640",
        "Errors": [
          {
            "NextAction": "51ccc869-b6de-4f02-b235-ee483a3e800a",
            "ErrorType": "InvalidCallbackNumber"
          },
          {
            "NextAction": "51ccc869-b6de-4f02-b235-ee483a3e800a",
            "ErrorType": "CallbackNumberNotDialable"
          }
        ]
      }
    },
    {
      "Parameters": {
        "StoreInput": "True",
        "InputTimeLimitSeconds": "5",
        "Text": "Enter the number you would like to be called back at.",
        "InputValidation": {
          "PhoneNumberValidation": {
            "NumberFormat": "Local",
            "CountryCode": "US"
          }
        }
      },
      "Identifier": "b17642b4-1a91-44dd-b962-22c5103b2421",
      "Type": "GetParticipantInput",
      "Transitions": {
        "NextAction": "5f549ee4-5942-40ed-9aae-5622db0d4c11",
        "Errors": [
          {
            "NextAction": "51ccc869-b6de-4f02-b235-ee483a3e800a",
            "ErrorType": "NoMatchingError"
          },
          {
            "NextAction": "51ccc869-b6de-4f02-b235-ee483a3e800a",
            "ErrorType": "InvalidPhoneNumber"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Something went wrong. Goodbye."
      },
      "Identifier": "97c306a2-8a70-4604-a431-4f03c5c97c5b",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "9695ce5d-39eb-4f88-badf-495f7337f9cd"
      }
    },
    {
      "Parameters": {},
      "Identifier": "9695ce5d-39eb-4f88-badf-495f7337f9cd",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "Text": "You will be called back when the next agent is available."
      },
      "Identifier": "1187e023-0492-4771-81f7-dc97b94db640",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "c68e72e8-c746-4255-afca-b8717e0d142a"
      }
    },
    {
      "Parameters": {
        "RetryDelaySeconds": "600",
        "InitialCallDelaySeconds": "5",
        "MaximumConnectionAttempts": "1",
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/a159b5a4-07df-4049-a2f1-ad0b90520a55"
      },
      "Identifier": "c68e72e8-c746-4255-afca-b8717e0d142a",
      "Type": "CreateCallbackContact",
      "Transitions": {
        "NextAction": "9695ce5d-39eb-4f88-badf-495f7337f9cd",
        "Errors": [
          {
            "NextAction": "97c306a2-8a70-4604-a431-4f03c5c97c5b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
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
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}

resource "aws_connect_contact_flow" "GTS-Partner-Assessment-Update-Address" {
  instance_id = "9fbc8807-1345-4962-ab2a-83eb1b45fe1e"
  name        = "GTS-Partner-Assessment-Update-Address"
  description = "GTS Test Contact Flow Description"
  type        = "CONTACT_FLOW"
  content     = <<JSON
    {
  "Version": "2019-10-30",
  "StartAction": "f204fadb-9100-4162-af1a-9676c99df908",
  "Metadata": {
    "entryPointPosition": {
      "x": 14.4,
      "y": 2241.6
    },
    "ActionMetadata": {
      "bae57eec-f1bc-46fc-8887-ce71a92cbe1f": {
        "position": {
          "x": 6359.200000000001,
          "y": 1984.8000000000002
        }
      },
      "c1e679f6-feb6-4ff7-a203-5906346ff81c": {
        "position": {
          "x": 6928,
          "y": 1978.4
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "AC-Blog-Callback-Welcome"
          }
        },
        "ContactFlow": {
          "text": "AC-Blog-Callback-Welcome"
        }
      },
      "f77d43ad-eb26-4647-8292-5087498e82cd": {
        "position": {
          "x": 6909.6,
          "y": 1788.8000000000002
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-CallbackModule"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-CallbackModule"
      },
      "e638ed23-425e-4cd4-b0a7-b74349a570ff": {
        "position": {
          "x": 6892,
          "y": 1589.6000000000001
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "2d9ecf46-3772-4ddb-b39f-32efdff6e953": {
        "position": {
          "x": 8644,
          "y": 1352
        }
      },
      "c166882c-a66c-44b6-9543-eae0c8ccbc24": {
        "position": {
          "x": 8342.4,
          "y": 1024.8
        }
      },
      "ead6b6e1-2b0f-419f-bef1-a0e2469da5ca": {
        "position": {
          "x": 8648.800000000001,
          "y": 975.2
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot",
        "conditionMetadata": [
          {
            "id": "ccbcb45a-bf76-44bd-9164-ba9ed4662609",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Voicemail"
          },
          {
            "id": "898f6aad-441e-4b61-8b2a-5760c0a4635d",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          },
          {
            "id": "d2112834-50f3-4f34-ab4b-dd50c4d5a357",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "3d420391-72f5-494d-afc6-848a4593dc2f",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ScheduleCallback"
          }
        ]
      },
      "a86e0c54-169e-40d4-8de3-d6cf84374e7d": {
        "position": {
          "x": 9158.4,
          "y": 1176
        }
      },
      "61ac624d-c290-47bf-b560-817f3c5a227c": {
        "position": {
          "x": 8876,
          "y": 1360.8000000000002
        }
      },
      "522cb640-a42e-4a51-869b-a400b81458ee": {
        "position": {
          "x": 8879.2,
          "y": 816
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-CallbackModule"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-CallbackModule"
      },
      "0351736a-85f5-4d61-8657-38c4572f56b7": {
        "position": {
          "x": 8863.2,
          "y": 633.6
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "4b0a776b-1046-4039-9320-34dce3eb1853": {
        "position": {
          "x": 8891.2,
          "y": 1039.2
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "AC-Blog-Callback-Welcome"
          }
        },
        "ContactFlow": {
          "text": "AC-Blog-Callback-Welcome"
        }
      },
      "1ace16f1-2248-4d93-8a01-9661a80b8760": {
        "position": {
          "x": 9123.2,
          "y": 946.4000000000001
        }
      },
      "52428d70-eb8b-4169-8fd9-ad7d1e01b1dc": {
        "position": {
          "x": 8078.400000000001,
          "y": 1224.8
        }
      },
      "8d30dae0-8819-4d23-9341-6ee628ffeed5": {
        "position": {
          "x": 8088,
          "y": 1444.8000000000002
        }
      },
      "e7f494fa-6f1e-4161-ada7-2ee862962f3c": {
        "position": {
          "x": 6531.200000000001,
          "y": 452.8
        },
        "parameters": {
          "QueueId": {
            "useDynamic": true
          }
        },
        "useDynamic": true,
        "queue": "$.Queue.ARN"
      },
      "8074910a-d05a-4cbe-8a29-0694d4f1bfa1": {
        "position": {
          "x": 7729.6,
          "y": 635.2
        },
        "dynamicParams": []
      },
      "84687607-38b5-4672-b19a-f58b3d8f76dc": {
        "position": {
          "x": 7744,
          "y": 846.4000000000001
        },
        "dynamicParams": []
      },
      "bc712c82-e767-4f20-af66-5a63dc48d590": {
        "position": {
          "x": 7737.6,
          "y": 1057.6000000000001
        },
        "dynamicParams": []
      },
      "70a339a6-815b-4e12-80c0-a561b105de87": {
        "position": {
          "x": 8034.400000000001,
          "y": 892.8000000000001
        }
      },
      "6f84f00f-7d98-4e33-bcad-b0791fe61367": {
        "position": {
          "x": 7716.8,
          "y": 1270.4
        },
        "dynamicParams": []
      },
      "73f7fa46-ad4f-445e-aaed-a39112864f32": {
        "position": {
          "x": 7697.6,
          "y": 1483.2
        },
        "dynamicParams": []
      },
      "df501e08-992f-4dd3-b622-bc2fac98a8d8": {
        "position": {
          "x": 1202.4,
          "y": 2564
        }
      },
      "65e1c107-a126-4e48-a830-927eecf90a21": {
        "position": {
          "x": 6493.6,
          "y": 649.6
        }
      },
      "8b828c2f-d2a4-494a-a040-7b30d79f6628": {
        "position": {
          "x": 6199.200000000001,
          "y": 922.4000000000001
        },
        "parameters": {
          "Attributes": {
            "BranchAddress": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "BranchAddress"
        ]
      },
      "93299230-cc94-41cd-9623-703db9670b0f": {
        "position": {
          "x": 5116,
          "y": 2356.8
        }
      },
      "1e0910d8-8300-406c-91f2-41428735a3cb": {
        "position": {
          "x": 2114.4,
          "y": 1176.8
        },
        "parameters": {
          "LambdaInvocationAttributes": {
            "CallerPhoneNumber": {
              "useDynamic": true
            },
            "NewAddress": {
              "useDynamic": true
            }
          }
        },
        "dynamicMetadata": {
          "CallerPhoneNumber": true,
          "NewAddress": true
        }
      },
      "29c63ff6-9db5-43be-825f-a6b189a9c14c": {
        "position": {
          "x": 2108.8,
          "y": 1395.2
        },
        "parameters": {
          "LambdaInvocationAttributes": {
            "CallerPhoneNumber": {
              "useDynamic": true
            },
            "NewAddress": {
              "useDynamic": true
            }
          }
        },
        "dynamicMetadata": {
          "CallerPhoneNumber": true,
          "NewAddress": true
        }
      },
      "35357463-cebc-4529-b871-f426fd116b76": {
        "position": {
          "x": 6685.6,
          "y": 1916.8000000000002
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot",
        "conditionMetadata": [
          {
            "id": "f0724523-eacd-4225-b8c0-ec4933a612d3",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Voicemail"
          },
          {
            "id": "de081c33-aaca-423b-a086-ee4002430d18",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          },
          {
            "id": "ff251e27-c7f6-419e-8368-581244c66a22",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "55219e87-7134-4c6f-8b5d-a62391ce22cf",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ScheduleCallback"
          }
        ]
      },
      "4c67d87b-c104-43f2-ab58-b8bbf1878692": {
        "position": {
          "x": 6448,
          "y": 820.8000000000001
        },
        "conditionMetadata": [
          {
            "id": "18dae2fc-4c3e-434c-9091-d11b28ab4ebe",
            "operator": {
              "name": "Is greater than",
              "value": "GreaterThan",
              "shortDisplay": ">"
            },
            "value": "5"
          }
        ]
      },
      "8303aa2a-1436-4916-b4ce-fa2d72d22805": {
        "position": {
          "x": 7451.200000000001,
          "y": 848
        },
        "conditionMetadata": [
          {
            "id": "af5be653-faf7-4086-a4fe-3bc99187ae21",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Sales"
          },
          {
            "id": "621cb87f-ceaf-4690-a8a0-a516d2ba0a16",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Support"
          },
          {
            "id": "f3514fd6-91a4-4bb7-bfce-2377358f2e10",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Finance"
          },
          {
            "id": "facac330-0d94-4140-bb30-ef2e74bd778a",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "General"
          },
          {
            "id": "7a644377-06c7-4e8e-a264-35c1af6fa02a",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Promotions"
          }
        ]
      },
      "a2f95793-268e-4312-bf0c-a7b20baa8900": {
        "position": {
          "x": 7180.8,
          "y": 1062.4
        }
      },
      "2a9271ba-7d31-4a4a-916b-88e8c87c13b7": {
        "position": {
          "x": 7149.6,
          "y": 610.4
        },
        "dynamicMetadata": {}
      },
      "0777399f-3fe9-4b2c-97ba-ac405ab0348d": {
        "position": {
          "x": 7161.6,
          "y": 844.8000000000001
        },
        "parameters": {
          "Attributes": {
            "callerQueue": {
              "useDynamic": true
            },
            "queueStartTimestamp": {
              "useDynamic": true
            },
            "dialedPhoneNumber": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "callerQueue",
          "queueStartTimestamp",
          "dialedPhoneNumber"
        ]
      },
      "5c72abcc-86d0-4ef4-a8b9-cc99c8b4fcc4": {
        "position": {
          "x": 2487.2000000000003,
          "y": 2208.8
        },
        "dynamicParams": []
      },
      "d1593efb-bc3e-4ce6-9226-7ea0893a2839": {
        "position": {
          "x": 2478.4,
          "y": 2412
        },
        "dynamicParams": []
      },
      "1bbdc0d1-1e0d-48c5-a689-4271eecab11c": {
        "position": {
          "x": 811.2,
          "y": 1811.2
        }
      },
      "19f7e8f4-6538-4268-9c67-23c3031d630b": {
        "position": {
          "x": 363.20000000000005,
          "y": 2084
        }
      },
      "ee6d8382-be92-4072-af08-07eb3e37c52c": {
        "position": {
          "x": 861.6,
          "y": 2100
        },
        "parameters": {
          "Attributes": {
            "Address1": {
              "useDynamic": true
            },
            "StreetNumber": {
              "useDynamic": true
            },
            "AddressLine1": {
              "useDynamic": true
            },
            "SuiteAptNum": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "Address1",
          "StreetNumber",
          "AddressLine1",
          "SuiteAptNum"
        ]
      },
      "f204fadb-9100-4162-af1a-9676c99df908": {
        "position": {
          "x": 596.8000000000001,
          "y": 2080
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Customer-Capture-Street-Name"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Customer-Capture-Street-Name",
        "conditionMetadata": [
          {
            "id": "a078d6b9-45a4-4e0f-a0b1-d0973c8fa57e",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Address"
          }
        ]
      },
      "23dabea4-5f0d-4983-8934-2b944bd932a6": {
        "position": {
          "x": 1483.2,
          "y": 1726.4
        }
      },
      "d511cf2d-77e9-4ae3-bbd5-9a47256df08f": {
        "position": {
          "x": 1216,
          "y": 1494.4
        }
      },
      "749fe413-dad4-4aa6-9640-9e89106a8de3": {
        "position": {
          "x": 1452.8000000000002,
          "y": 1434.4
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "5fbfbccb-7122-4472-a1db-f68c4b24c87f",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "f1228b77-b462-4ecc-8dcc-420797b75a2c",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "c6a2ed32-2b1d-4b0f-a84c-c0e5b1e5caa8": {
        "position": {
          "x": 2490.4,
          "y": 1744
        }
      },
      "a37280fd-c7c3-4829-a64b-c106f78e504a": {
        "position": {
          "x": 1718.4,
          "y": 2360.8
        }
      },
      "6865cc93-26c8-4aa3-9fff-2ea3308fad5e": {
        "position": {
          "x": 1473.6000000000001,
          "y": 2040
        }
      },
      "67c875c1-15a2-4d69-ac2a-ab364e9f63db": {
        "position": {
          "x": 2097.6,
          "y": 2363.2000000000003
        },
        "conditionMetadata": [
          {
            "id": "7e2226a1-a91e-45d3-865d-2c6e7d77da2b",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "1"
          },
          {
            "id": "2ce73503-7108-454a-880b-6454e57961da",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "2"
          }
        ]
      },
      "274224c7-e2cd-46e8-8c7e-8eeb8fec0c52": {
        "position": {
          "x": 1246.4,
          "y": 2112
        },
        "conditionMetadata": [
          {
            "id": "7fae6062-d10a-4878-8daa-a1342466877a",
            "operator": {
              "name": "Is greater than",
              "value": "GreaterThan",
              "shortDisplay": ">"
            },
            "value": "0"
          }
        ]
      },
      "e2f568e1-8359-4ec0-8eca-c6da798c80ea": {
        "position": {
          "x": 1833.6000000000001,
          "y": 1287.2
        },
        "conditionMetadata": [
          {
            "id": "61022cab-588e-484d-830c-c21e2026b879",
            "operator": {
              "name": "Is greater than",
              "value": "GreaterThan",
              "shortDisplay": ">"
            },
            "value": "0"
          }
        ]
      },
      "ae72fcb0-a49e-46f3-9a21-08e6d24f0c49": {
        "position": {
          "x": 1716.8000000000002,
          "y": 2084
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "a1fe70b1-6ee8-4b46-8168-ef1207c3c82e",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "47ab8a58-f27d-48b1-9585-310f399988c8",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "8e7b6f75-abde-4881-991c-ce6ea5f394a3": {
        "position": {
          "x": 2860.8,
          "y": 1713.6000000000001
        }
      },
      "1e19dae4-3bf5-4411-b79a-6e3fb7ab3baf": {
        "position": {
          "x": 2571.2000000000003,
          "y": 1474.4
        }
      },
      "52ee7e0a-4181-4c2a-9e79-ed39d7700da0": {
        "position": {
          "x": 5088.8,
          "y": 1338.4
        },
        "dynamicParams": []
      },
      "f489cc08-5a9f-4056-a8a2-b8f92bee2095": {
        "position": {
          "x": 5088.8,
          "y": 1531.2
        },
        "dynamicParams": []
      },
      "40ef122a-7ef7-4a11-bad6-967560588eea": {
        "position": {
          "x": 5122.400000000001,
          "y": 1868
        },
        "dynamicParams": []
      },
      "b1097025-219e-4396-b7c9-811b0224e131": {
        "position": {
          "x": 5122.400000000001,
          "y": 2060.8
        },
        "dynamicParams": []
      },
      "f1644ea7-d2d9-49f4-93b7-f5f968bcaf83": {
        "position": {
          "x": 4138.400000000001,
          "y": 410.40000000000003
        },
        "dynamicParams": []
      },
      "7bd66d87-9205-46f6-9b25-3b0a6ca64594": {
        "position": {
          "x": 4138.400000000001,
          "y": 603.2
        },
        "dynamicParams": []
      },
      "5e55fb3a-5b3f-4553-a5e6-a3e5d394ae37": {
        "position": {
          "x": 4741.6,
          "y": 1311.2
        },
        "conditionMetadata": [
          {
            "id": "4be1cddf-3d2e-44dd-bfc6-e778451849f8",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "1"
          },
          {
            "id": "446c100f-08c2-426a-b9c5-c2ae9ac991cb",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "2"
          }
        ]
      },
      "9350acf3-e23c-4de9-8867-ea022b3b1f7a": {
        "position": {
          "x": 4528,
          "y": 1472.8000000000002
        }
      },
      "523eb46b-ba30-4654-84c2-5c4a15613792": {
        "position": {
          "x": 4228.8,
          "y": 1200
        }
      },
      "6e5e5c16-5f70-4f44-9044-264fde6877ca": {
        "position": {
          "x": 4234.400000000001,
          "y": 1471.2
        },
        "parameters": {
          "Attributes": {
            "State": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "State"
        ]
      },
      "0a77e59e-98b0-46a6-acb3-260c23086e47": {
        "position": {
          "x": 4510.400000000001,
          "y": 1173.6000000000001
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "a86bf860-3d56-459f-a746-f249c3ffe4a3",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "302e867c-a93c-46f1-ab5e-f021de215e7c",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "8b01b5de-4605-4b07-85cf-729dab84719f": {
        "position": {
          "x": 4262.400000000001,
          "y": 1729.6000000000001
        }
      },
      "b8e3b920-790e-4aa4-8216-5b404aeffed3": {
        "position": {
          "x": 4092,
          "y": 2036
        },
        "parameters": {
          "Attributes": {
            "PostalCode": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "PostalCode"
        ]
      },
      "d219d02d-33aa-4d7b-8b2c-a0ed929fc334": {
        "position": {
          "x": 2336.8,
          "y": 1320
        },
        "parameters": {
          "ProfileRequestData": {
            "FirstName": {
              "useDynamic": true
            },
            "LastName": {
              "useDynamic": true
            },
            "Address1": {
              "useDynamic": true
            },
            "Address2": {
              "useDynamic": true
            },
            "City": {
              "useDynamic": true
            },
            "PostalCode": {
              "useDynamic": true
            },
            "State": {
              "useDynamic": true
            }
          }
        },
        "useDynamic": {
          "FirstName": true,
          "LastName": true,
          "Address1": true,
          "Address2": true,
          "City": true,
          "PostalCode": true,
          "State": true
        },
        "customerProfilesAction": "UpdateCustomerProfile"
      },
      "050fa989-ed3e-450f-b9ac-b2ac736209af": {
        "position": {
          "x": 2094.4,
          "y": 1786.4
        }
      },
      "edc2cf82-253c-4618-a548-e135d77deb2e": {
        "position": {
          "x": 2170.4,
          "y": 1975.2
        },
        "conditionMetadata": [
          {
            "id": "3f45e342-bba3-4ec8-953a-85f52a2cd7d2",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CHAT"
          }
        ]
      },
      "4f02daa8-66e9-433b-908a-a9b5e54f3a8f": {
        "position": {
          "x": 4544,
          "y": 1703.2
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "849ef311-74ea-4563-a8ae-285acaca191d",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "2215b0a0-1299-4113-8204-7593577d7423",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "3471eb38-02c3-4683-902a-e2b424afe101": {
        "position": {
          "x": 3791.2000000000003,
          "y": 383.20000000000005
        },
        "conditionMetadata": [
          {
            "id": "3c2afc43-7261-4412-ad8b-feb0ac82a656",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "1"
          },
          {
            "id": "c2e863e8-3490-4af8-bf63-277be00365a7",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "2"
          }
        ]
      },
      "620ded2c-bc8b-4fbc-8961-317ea9364cba": {
        "position": {
          "x": 3577.6000000000004,
          "y": 544.8000000000001
        }
      },
      "acd4cd0a-5c0b-4951-ad86-811218876dfc": {
        "position": {
          "x": 3278.4,
          "y": 272
        }
      },
      "7b3ea31d-7cc9-4423-86ce-165609cb2e09": {
        "position": {
          "x": 3095.2000000000003,
          "y": 533.6
        },
        "parameters": {
          "Attributes": {
            "City": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "City"
        ]
      },
      "27975726-8d4f-4510-9ad1-b015ee2d69aa": {
        "position": {
          "x": 3560,
          "y": 245.60000000000002
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "4ff1f943-2812-4ec7-a224-40845ce5ad64",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "25034bce-5146-4f2a-aa6c-1ba1f06ccfa0",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "ddf442a9-0087-4c08-8daa-3c52a83b162b": {
        "position": {
          "x": 4775.2,
          "y": 1840.8000000000002
        },
        "conditionMetadata": [
          {
            "id": "6fd01600-d0f9-41eb-8339-c81922b78e99",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "1"
          },
          {
            "id": "ddb543e8-b249-4ac4-95b6-894704cfe2ca",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "2"
          }
        ]
      },
      "1437d271-2422-4055-abd9-703fa20af6b1": {
        "position": {
          "x": 4561.6,
          "y": 2002.4
        }
      },
      "8ac60536-10df-486d-972e-e8455ef39826": {
        "position": {
          "x": 4306.400000000001,
          "y": 1955.2
        },
        "conditionMetadata": [
          {
            "id": "34ef52c7-8fd8-445f-98dc-eb624f0984d8",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CHAT"
          }
        ]
      },
      "bf772dae-035e-456c-9e0a-3d5add487514": {
        "position": {
          "x": 4563.2,
          "y": 2331.2000000000003
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "aeb6b30a-8443-4f0c-ab4c-c02ac8ab2039",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "95be5aa3-a7a0-4d98-8d40-53a10e3b495d",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "186e07e4-7e9b-430e-854f-d07a5c2a6278": {
        "position": {
          "x": 5334.400000000001,
          "y": 946.4000000000001
        }
      },
      "f3726801-e803-4f23-8dc5-a8680c715b41": {
        "position": {
          "x": 5035.200000000001,
          "y": 673.6
        }
      },
      "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0": {
        "position": {
          "x": 2845.6000000000004,
          "y": 1404
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Customer-Capture-City-And-State"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Customer-Capture-City-And-State",
        "conditionMetadata": [
          {
            "id": "90c2a296-f31e-42ec-b110-84ba5ca417ab",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "City"
          },
          {
            "id": "8a751cf9-d9c9-48be-966b-1d686de0842d",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "State"
          },
          {
            "id": "4884e785-bb2f-4551-9338-e3c1a930d632",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ZipCode"
          }
        ]
      },
      "f35841d5-0209-43cd-ad6c-1460fad01e82": {
        "position": {
          "x": 5012,
          "y": 350.40000000000003
        },
        "parameters": {
          "ProfileRequestData": {
            "FirstName": {
              "useDynamic": true
            },
            "LastName": {
              "useDynamic": true
            },
            "Address1": {
              "useDynamic": true
            },
            "Address2": {
              "useDynamic": true
            },
            "City": {
              "useDynamic": true
            },
            "PostalCode": {
              "useDynamic": true
            },
            "State": {
              "useDynamic": true
            }
          }
        },
        "useDynamic": {
          "FirstName": true,
          "LastName": true,
          "Address1": true,
          "Address2": true,
          "City": true,
          "PostalCode": true,
          "State": true
        },
        "customerProfilesAction": "UpdateCustomerProfile"
      },
      "a06528fb-3394-418f-a2bd-9c4bf3e3f82c": {
        "position": {
          "x": 6167.200000000001,
          "y": 14.4
        },
        "parameters": {
          "QueueId": {
            "displayName": "Promotions"
          }
        },
        "queue": {
          "text": "Promotions"
        }
      },
      "905d6025-6d3e-433e-a07f-ede211f69eda": {
        "position": {
          "x": 6180.8,
          "y": 236
        },
        "parameters": {
          "QueueId": {
            "displayName": "Support"
          }
        },
        "queue": {
          "text": "Support"
        }
      },
      "a971cabb-9892-4026-9ef2-bb39277a9602": {
        "position": {
          "x": 5905.6,
          "y": 963.2
        }
      },
      "241e8851-4880-4af6-bf99-4151f3a87957": {
        "position": {
          "x": 5621.6,
          "y": 561.6
        }
      },
      "16402232-3009-4941-a6c2-325657133afe": {
        "position": {
          "x": 6205.6,
          "y": 1172
        }
      },
      "307cffe1-335f-4f5e-9f46-7dea67b376f8": {
        "position": {
          "x": 6191.200000000001,
          "y": 460
        }
      },
      "e2bf3eda-bb8a-4837-ac8b-09422472412c": {
        "position": {
          "x": 6191.200000000001,
          "y": 674.4000000000001
        },
        "parameters": {
          "LambdaInvocationAttributes": {
            "PostalCode": {
              "useDynamic": true
            },
            "CallerPhoneNumber": {
              "useDynamic": true
            }
          }
        },
        "dynamicMetadata": {
          "PostalCode": true,
          "CallerPhoneNumber": true
        }
      },
      "337e73c2-20cf-4ab3-9a74-33bb6af0570a": {
        "position": {
          "x": 2474.4,
          "y": 1938.4
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "35fb5848-81b9-403c-aae6-bfe6ea830125",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "0d27eba2-2195-43fe-9b91-47ceaabad6ca",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "2431e6db-3728-4dbe-ad9d-b5a656fa5831": {
        "position": {
          "x": 2766.4,
          "y": 2109.6
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "bb649113-3ccd-4223-943c-93168d6c9c31",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "1e166e3d-3c8e-4778-8dff-2f1282c744e3",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "5266f026-fdb1-4b27-96c9-4a7d1a2f8bfa": {
        "position": {
          "x": 5326.400000000001,
          "y": 622.4000000000001
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Yes-or-No"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Yes-or-No",
        "conditionMetadata": [
          {
            "id": "9fd57bdd-0988-433e-bb43-fb05ab312490",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Yes"
          },
          {
            "id": "a42af2d0-854a-4d79-9aa5-ca0c1c12290a",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          }
        ]
      },
      "689fb514-4cbc-40fa-a36c-54548fcda2dd": {
        "position": {
          "x": 5882.400000000001,
          "y": 490.40000000000003
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Partner-Assessment-Update-Address-Menu"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Partner-Assessment-Update-Address-Menu",
        "conditionMetadata": [
          {
            "id": "4fe33d74-e18f-4529-a1a3-ee8f66f0f1a9",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "PromotionOffer"
          },
          {
            "id": "803c9cb0-640a-4a26-a51f-981546e3bec8",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Agent"
          },
          {
            "id": "a2cb84fb-df2f-4a2e-84b2-db9359262edc",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "No"
          },
          {
            "id": "f087b4e3-3b88-43a1-9ac8-47fc8d08e348",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "GetNearestBranch"
          }
        ]
      }
    },
    "name": "GTS-Partner-Assessment-Update-Address",
    "description": "",
    "type": "contactFlow",
    "status": "published",
    "hash": {}
  },
  "Actions": [
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "bae57eec-f1bc-46fc-8887-ce71a92cbe1f",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "35357463-cebc-4529-b871-f426fd116b76",
        "Conditions": [
          {
            "NextAction": "35357463-cebc-4529-b871-f426fd116b76",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "35357463-cebc-4529-b871-f426fd116b76",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/655e19d2-af79-4874-b500-98b9a977dd92"
      },
      "Identifier": "c1e679f6-feb6-4ff7-a203-5906346ff81c",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Errors": [
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "63903492-812b-422e-817e-72e13f81ab73"
      },
      "Identifier": "f77d43ad-eb26-4647-8292-5087498e82cd",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Errors": [
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "8b870bae-ab28-4eb4-8da0-cf31a6e4be40"
      },
      "Identifier": "e638ed23-425e-4cd4-b0a7-b74349a570ff",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Errors": [
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.InvalidEntryPrompt\n</speak>"
      },
      "Identifier": "2d9ecf46-3772-4ddb-b39f-32efdff6e953",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "61ac624d-c290-47bf-b560-817f3c5a227c",
        "Errors": [
          {
            "NextAction": "61ac624d-c290-47bf-b560-817f3c5a227c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "c166882c-a66c-44b6-9543-eae0c8ccbc24",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "ead6b6e1-2b0f-419f-bef1-a0e2469da5ca",
        "Conditions": [
          {
            "NextAction": "ead6b6e1-2b0f-419f-bef1-a0e2469da5ca",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "ead6b6e1-2b0f-419f-bef1-a0e2469da5ca",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.QueueAtCapacityPrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TEQDKPA1QQ/O2HB1BBTRW"
        }
      },
      "Identifier": "ead6b6e1-2b0f-419f-bef1-a0e2469da5ca",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Conditions": [
          {
            "NextAction": "0351736a-85f5-4d61-8657-38c4572f56b7",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Voicemail"
              ]
            }
          },
          {
            "NextAction": "c166882c-a66c-44b6-9543-eae0c8ccbc24",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          },
          {
            "NextAction": "522cb640-a42e-4a51-869b-a400b81458ee",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "4b0a776b-1046-4039-9320-34dce3eb1853",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ScheduleCallback"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "2d9ecf46-3772-4ddb-b39f-32efdff6e953",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "a86e0c54-169e-40d4-8de3-d6cf84374e7d",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "61ac624d-c290-47bf-b560-817f3c5a227c",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Conditions": [
          {
            "NextAction": "ead6b6e1-2b0f-419f-bef1-a0e2469da5ca",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "63903492-812b-422e-817e-72e13f81ab73"
      },
      "Identifier": "522cb640-a42e-4a51-869b-a400b81458ee",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Errors": [
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "8b870bae-ab28-4eb4-8da0-cf31a6e4be40"
      },
      "Identifier": "0351736a-85f5-4d61-8657-38c4572f56b7",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Errors": [
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/655e19d2-af79-4874-b500-98b9a977dd92"
      },
      "Identifier": "4b0a776b-1046-4039-9320-34dce3eb1853",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Errors": [
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.GoodbyePrompt\n</speak>"
      },
      "Identifier": "1ace16f1-2248-4d93-8a01-9661a80b8760",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "a86e0c54-169e-40d4-8de3-d6cf84374e7d",
        "Errors": [
          {
            "NextAction": "a86e0c54-169e-40d4-8de3-d6cf84374e7d",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.GoodbyePrompt\n</speak>"
      },
      "Identifier": "52428d70-eb8b-4169-8fd9-ad7d1e01b1dc",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "8d30dae0-8819-4d23-9341-6ee628ffeed5",
        "Errors": [
          {
            "NextAction": "8d30dae0-8819-4d23-9341-6ee628ffeed5",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "8d30dae0-8819-4d23-9341-6ee628ffeed5",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "QueueId": "$.Queue.ARN"
      },
      "Identifier": "e7f494fa-6f1e-4161-ada7-2ee862962f3c",
      "Type": "GetMetricData",
      "Transitions": {
        "NextAction": "4c67d87b-c104-43f2-ab58-b8bbf1878692",
        "Errors": [
          {
            "NextAction": "4c67d87b-c104-43f2-ab58-b8bbf1878692",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "8074910a-d05a-4cbe-8a29-0694d4f1bfa1",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
        "Errors": [
          {
            "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "84687607-38b5-4672-b19a-f58b3d8f76dc",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
        "Errors": [
          {
            "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "bc712c82-e767-4f20-af66-5a63dc48d590",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
        "Errors": [
          {
            "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "70a339a6-815b-4e12-80c0-a561b105de87",
      "Type": "TransferContactToQueue",
      "Transitions": {
        "NextAction": "52428d70-eb8b-4169-8fd9-ad7d1e01b1dc",
        "Errors": [
          {
            "NextAction": "ead6b6e1-2b0f-419f-bef1-a0e2469da5ca",
            "ErrorType": "QueueAtCapacity"
          },
          {
            "NextAction": "52428d70-eb8b-4169-8fd9-ad7d1e01b1dc",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "6f84f00f-7d98-4e33-bcad-b0791fe61367",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
        "Errors": [
          {
            "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "73f7fa46-ad4f-445e-aaed-a39112864f32",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
        "Errors": [
          {
            "NextAction": "70a339a6-815b-4e12-80c0-a561b105de87",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, it seems I've been unable to assist you efficiently. Please hold a moment while I send you to an agent for proper assistance. Thank you!"
      },
      "Identifier": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "905d6025-6d3e-433e-a07f-ede211f69eda",
        "Errors": [
          {
            "NextAction": "905d6025-6d3e-433e-a07f-ede211f69eda",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "65e1c107-a126-4e48-a830-927eecf90a21",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "Attributes": {
          "BranchAddress": "$.External.BranchAddress"
        }
      },
      "Identifier": "8b828c2f-d2a4-494a-a040-7b30d79f6628",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "16402232-3009-4941-a6c2-325657133afe",
        "Errors": [
          {
            "NextAction": "16402232-3009-4941-a6c2-325657133afe",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, it seems I've been unable to assist you efficiently. Please hold a moment while I send you to an agent for proper assistance. Thank you!"
      },
      "Identifier": "93299230-cc94-41cd-9623-703db9670b0f",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "905d6025-6d3e-433e-a07f-ede211f69eda",
        "Errors": [
          {
            "NextAction": "905d6025-6d3e-433e-a07f-ede211f69eda",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:UpdateAddressSendSNS",
        "InvocationTimeLimitSeconds": "3",
        "LambdaInvocationAttributes": {
          "CallerPhoneNumber": "$.CustomerEndpoint.Address",
          "NewAddress": "$.Attributes.AddressLine1, number $.Attributes.SuiteAptNum"
        }
      },
      "Identifier": "1e0910d8-8300-406c-91f2-41428735a3cb",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "d219d02d-33aa-4d7b-8b2c-a0ed929fc334",
        "Errors": [
          {
            "NextAction": "d219d02d-33aa-4d7b-8b2c-a0ed929fc334",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:UpdateAddressSendSNS",
        "InvocationTimeLimitSeconds": "3",
        "LambdaInvocationAttributes": {
          "CallerPhoneNumber": "$.CustomerEndpoint.Address",
          "NewAddress": "$.Attributes.AddressLine1"
        }
      },
      "Identifier": "29c63ff6-9db5-43be-825f-a6b189a9c14c",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "d219d02d-33aa-4d7b-8b2c-a0ed929fc334",
        "Errors": [
          {
            "NextAction": "d219d02d-33aa-4d7b-8b2c-a0ed929fc334",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.HigherThanNormalCallVolumePrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TEQDKPA1QQ/O2HB1BBTRW"
        }
      },
      "Identifier": "35357463-cebc-4529-b871-f426fd116b76",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
        "Conditions": [
          {
            "NextAction": "e638ed23-425e-4cd4-b0a7-b74349a570ff",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Voicemail"
              ]
            }
          },
          {
            "NextAction": "bae57eec-f1bc-46fc-8887-ce71a92cbe1f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          },
          {
            "NextAction": "f77d43ad-eb26-4647-8292-5087498e82cd",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "c1e679f6-feb6-4ff7-a203-5906346ff81c",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ScheduleCallback"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "2a9271ba-7d31-4a4a-916b-88e8c87c13b7",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "1ace16f1-2248-4d93-8a01-9661a80b8760",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Metrics.Queue.Size"
      },
      "Identifier": "4c67d87b-c104-43f2-ab58-b8bbf1878692",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "2a9271ba-7d31-4a4a-916b-88e8c87c13b7",
        "Conditions": [
          {
            "NextAction": "35357463-cebc-4529-b871-f426fd116b76",
            "Condition": {
              "Operator": "NumberGreaterThan",
              "Operands": [
                "5"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "2a9271ba-7d31-4a4a-916b-88e8c87c13b7",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.callerQueue"
      },
      "Identifier": "8303aa2a-1436-4916-b4ce-fa2d72d22805",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "6f84f00f-7d98-4e33-bcad-b0791fe61367",
        "Conditions": [
          {
            "NextAction": "8074910a-d05a-4cbe-8a29-0694d4f1bfa1",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Sales"
              ]
            }
          },
          {
            "NextAction": "84687607-38b5-4672-b19a-f58b3d8f76dc",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Support"
              ]
            }
          },
          {
            "NextAction": "bc712c82-e767-4f20-af66-5a63dc48d590",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Finance"
              ]
            }
          },
          {
            "NextAction": "6f84f00f-7d98-4e33-bcad-b0791fe61367",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "General"
              ]
            }
          },
          {
            "NextAction": "73f7fa46-ad4f-445e-aaed-a39112864f32",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Promotions"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "6f84f00f-7d98-4e33-bcad-b0791fe61367",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Error setting contact attribute"
      },
      "Identifier": "a2f95793-268e-4312-bf0c-a7b20baa8900",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "8303aa2a-1436-4916-b4ce-fa2d72d22805",
        "Errors": [
          {
            "NextAction": "8303aa2a-1436-4916-b4ce-fa2d72d22805",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:GetCurrentTimeStampLambda",
        "InvocationTimeLimitSeconds": "3"
      },
      "Identifier": "2a9271ba-7d31-4a4a-916b-88e8c87c13b7",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "0777399f-3fe9-4b2c-97ba-ac405ab0348d",
        "Errors": [
          {
            "NextAction": "0777399f-3fe9-4b2c-97ba-ac405ab0348d",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callerQueue": "$.Queue.Name",
          "queueStartTimestamp": "$.External.queueStartTimestamp",
          "dialedPhoneNumber": "$.SystemEndpoint.Address"
        }
      },
      "Identifier": "0777399f-3fe9-4b2c-97ba-ac405ab0348d",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "8303aa2a-1436-4916-b4ce-fa2d72d22805",
        "Errors": [
          {
            "NextAction": "a2f95793-268e-4312-bf0c-a7b20baa8900",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "AddressAttempt": "2"
        }
      },
      "Identifier": "5c72abcc-86d0-4ef4-a8b9-cc99c8b4fcc4",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "f204fadb-9100-4162-af1a-9676c99df908",
        "Errors": [
          {
            "NextAction": "f204fadb-9100-4162-af1a-9676c99df908",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "AddressAttempt": "1"
        }
      },
      "Identifier": "d1593efb-bc3e-4ce6-9226-7ea0893a2839",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "f204fadb-9100-4162-af1a-9676c99df908",
        "Errors": [
          {
            "NextAction": "f204fadb-9100-4162-af1a-9676c99df908",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "1bbdc0d1-1e0d-48c5-a689-4271eecab11c",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
        "Conditions": [
          {
            "NextAction": "19f7e8f4-6538-4268-9c67-23c3031d630b",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please try again."
      },
      "Identifier": "19f7e8f4-6538-4268-9c67-23c3031d630b",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "f204fadb-9100-4162-af1a-9676c99df908",
        "Errors": [
          {
            "NextAction": "f204fadb-9100-4162-af1a-9676c99df908",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "Address1": "$.Lex.Slots.Address1",
          "StreetNumber": "$.Lex.Slots.StreetNumber",
          "AddressLine1": "$.Attributes.StreetNumber $.Attributes.Address1",
          "SuiteAptNum": "$.Lex.Slots.SuiteAptNum"
        }
      },
      "Identifier": "ee6d8382-be92-4072-af08-07eb3e37c52c",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "274224c7-e2cd-46e8-8c7e-8eeb8fec0c52",
        "Errors": [
          {
            "NextAction": "274224c7-e2cd-46e8-8c7e-8eeb8fec0c52",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Please speak your full Address excluding City, State, and Postal Code. If this address includes an apartment or suite number, please also include that.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/MWQK84JZLW/BIQ11JVBHA"
        }
      },
      "Identifier": "f204fadb-9100-4162-af1a-9676c99df908",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "1bbdc0d1-1e0d-48c5-a689-4271eecab11c",
        "Conditions": [
          {
            "NextAction": "ee6d8382-be92-4072-af08-07eb3e37c52c",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Address"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "1bbdc0d1-1e0d-48c5-a689-4271eecab11c",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "1bbdc0d1-1e0d-48c5-a689-4271eecab11c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "23dabea4-5f0d-4983-8934-2b944bd932a6",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
        "Conditions": [
          {
            "NextAction": "d511cf2d-77e9-4ae3-bbd5-9a47256df08f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please try again."
      },
      "Identifier": "d511cf2d-77e9-4ae3-bbd5-9a47256df08f",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "749fe413-dad4-4aa6-9640-9e89106a8de3",
        "Errors": [
          {
            "NextAction": "749fe413-dad4-4aa6-9640-9e89106a8de3",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Got it! As I understand it, you want to update your address to the following: $.Attributes.AddressLine1, number $.Attributes.SuiteAptNum.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "749fe413-dad4-4aa6-9640-9e89106a8de3",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "23dabea4-5f0d-4983-8934-2b944bd932a6",
        "Conditions": [
          {
            "NextAction": "e2f568e1-8359-4ec0-8eca-c6da798c80ea",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "67c875c1-15a2-4d69-ac2a-ab364e9f63db",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "23dabea4-5f0d-4983-8934-2b944bd932a6",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "23dabea4-5f0d-4983-8934-2b944bd932a6",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "c6a2ed32-2b1d-4b0f-a84c-c0e5b1e5caa8",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
        "Conditions": [
          {
            "NextAction": "050fa989-ed3e-450f-b9ac-b2ac736209af",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "a37280fd-c7c3-4829-a64b-c106f78e504a",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
        "Conditions": [
          {
            "NextAction": "6865cc93-26c8-4aa3-9fff-2ea3308fad5e",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please try again."
      },
      "Identifier": "6865cc93-26c8-4aa3-9fff-2ea3308fad5e",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "ae72fcb0-a49e-46f3-9a21-08e6d24f0c49",
        "Errors": [
          {
            "NextAction": "ae72fcb0-a49e-46f3-9a21-08e6d24f0c49",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.AddressAttempt"
      },
      "Identifier": "67c875c1-15a2-4d69-ac2a-ab364e9f63db",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "d1593efb-bc3e-4ce6-9226-7ea0893a2839",
        "Conditions": [
          {
            "NextAction": "5c72abcc-86d0-4ef4-a8b9-cc99c8b4fcc4",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "1"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "2"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "d1593efb-bc3e-4ce6-9226-7ea0893a2839",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.SuiteAptNum"
      },
      "Identifier": "274224c7-e2cd-46e8-8c7e-8eeb8fec0c52",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "ae72fcb0-a49e-46f3-9a21-08e6d24f0c49",
        "Conditions": [
          {
            "NextAction": "749fe413-dad4-4aa6-9640-9e89106a8de3",
            "Condition": {
              "Operator": "NumberGreaterThan",
              "Operands": [
                "0"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "ae72fcb0-a49e-46f3-9a21-08e6d24f0c49",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.SuiteAptNum"
      },
      "Identifier": "e2f568e1-8359-4ec0-8eca-c6da798c80ea",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "29c63ff6-9db5-43be-825f-a6b189a9c14c",
        "Conditions": [
          {
            "NextAction": "1e0910d8-8300-406c-91f2-41428735a3cb",
            "Condition": {
              "Operator": "NumberGreaterThan",
              "Operands": [
                "0"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "29c63ff6-9db5-43be-825f-a6b189a9c14c",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Got it! As I understand it, you want to update your address to the following: $.Attributes.AddressLine1.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "ae72fcb0-a49e-46f3-9a21-08e6d24f0c49",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "a37280fd-c7c3-4829-a64b-c106f78e504a",
        "Conditions": [
          {
            "NextAction": "e2f568e1-8359-4ec0-8eca-c6da798c80ea",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "67c875c1-15a2-4d69-ac2a-ab364e9f63db",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "a37280fd-c7c3-4829-a64b-c106f78e504a",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "a37280fd-c7c3-4829-a64b-c106f78e504a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "8e7b6f75-abde-4881-991c-ce6ea5f394a3",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
        "Conditions": [
          {
            "NextAction": "1e19dae4-3bf5-4411-b79a-6e3fb7ab3baf",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please try again."
      },
      "Identifier": "1e19dae4-3bf5-4411-b79a-6e3fb7ab3baf",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
        "Errors": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "StateAttempt": "2"
        }
      },
      "Identifier": "52ee7e0a-4181-4c2a-9e79-ed39d7700da0",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
        "Errors": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "StateAttempt": "1"
        }
      },
      "Identifier": "f489cc08-5a9f-4056-a8a2-b8f92bee2095",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
        "Errors": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "PostalCodeAttempt": "2"
        }
      },
      "Identifier": "40ef122a-7ef7-4a11-bad6-967560588eea",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
        "Errors": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "PostalCodeAttempt": "1"
        }
      },
      "Identifier": "b1097025-219e-4396-b7c9-811b0224e131",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
        "Errors": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "CityAttempt": "2"
        }
      },
      "Identifier": "f1644ea7-d2d9-49f4-93b7-f5f968bcaf83",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
        "Errors": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "CityAttempt": "1"
        }
      },
      "Identifier": "7bd66d87-9205-46f6-9b25-3b0a6ca64594",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
        "Errors": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.StateAttempt"
      },
      "Identifier": "5e55fb3a-5b3f-4553-a5e6-a3e5d394ae37",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "f489cc08-5a9f-4056-a8a2-b8f92bee2095",
        "Conditions": [
          {
            "NextAction": "52ee7e0a-4181-4c2a-9e79-ed39d7700da0",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "1"
              ]
            }
          },
          {
            "NextAction": "93299230-cc94-41cd-9623-703db9670b0f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "2"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "f489cc08-5a9f-4056-a8a2-b8f92bee2095",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "9350acf3-e23c-4de9-8867-ea022b3b1f7a",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "93299230-cc94-41cd-9623-703db9670b0f",
        "Conditions": [
          {
            "NextAction": "523eb46b-ba30-4654-84c2-5c4a15613792",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "93299230-cc94-41cd-9623-703db9670b0f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please say yes, or no."
      },
      "Identifier": "523eb46b-ba30-4654-84c2-5c4a15613792",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "0a77e59e-98b0-46a6-acb3-260c23086e47",
        "Errors": [
          {
            "NextAction": "0a77e59e-98b0-46a6-acb3-260c23086e47",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "State": "$.Lex.Slots.StateName"
        }
      },
      "Identifier": "6e5e5c16-5f70-4f44-9044-264fde6877ca",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "0a77e59e-98b0-46a6-acb3-260c23086e47",
        "Errors": [
          {
            "NextAction": "0a77e59e-98b0-46a6-acb3-260c23086e47",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Got it! As I understand it, you want to update your State to $.Attributes.State?",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "0a77e59e-98b0-46a6-acb3-260c23086e47",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "9350acf3-e23c-4de9-8867-ea022b3b1f7a",
        "Conditions": [
          {
            "NextAction": "f35841d5-0209-43cd-ad6c-1460fad01e82",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "5e55fb3a-5b3f-4553-a5e6-a3e5d394ae37",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "9350acf3-e23c-4de9-8867-ea022b3b1f7a",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "9350acf3-e23c-4de9-8867-ea022b3b1f7a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please say yes, or no."
      },
      "Identifier": "8b01b5de-4605-4b07-85cf-729dab84719f",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "8ac60536-10df-486d-972e-e8455ef39826",
        "Errors": [
          {
            "NextAction": "8ac60536-10df-486d-972e-e8455ef39826",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "PostalCode": "$.Lex.Slots.PostalCode"
        }
      },
      "Identifier": "b8e3b920-790e-4aa4-8216-5b404aeffed3",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "8ac60536-10df-486d-972e-e8455ef39826",
        "Errors": [
          {
            "NextAction": "8ac60536-10df-486d-972e-e8455ef39826",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ProfileRequestData": {
          "FirstName": "$.Attributes.FirstName",
          "LastName": "$.Attributes.LastName",
          "Address1": "$.Attributes.AddressLine1",
          "Address2": "$.Attributes.SuiteAptNum",
          "City": "$.Attributes.City",
          "PostalCode": "$.Attributes.PostalCode",
          "State": "$.Attributes.State"
        },
        "ProfileResponseData": [
          "FirstName",
          "LastName",
          "Address1",
          "Address2",
          "City",
          "PostalCode",
          "State"
        ]
      },
      "Identifier": "d219d02d-33aa-4d7b-8b2c-a0ed929fc334",
      "Type": "UpdateCustomerProfile",
      "Transitions": {
        "NextAction": "edc2cf82-253c-4618-a548-e135d77deb2e",
        "Errors": [
          {
            "NextAction": "edc2cf82-253c-4618-a548-e135d77deb2e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please say yes, or no."
      },
      "Identifier": "050fa989-ed3e-450f-b9ac-b2ac736209af",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "edc2cf82-253c-4618-a548-e135d77deb2e",
        "Errors": [
          {
            "NextAction": "edc2cf82-253c-4618-a548-e135d77deb2e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Channel"
      },
      "Identifier": "edc2cf82-253c-4618-a548-e135d77deb2e",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "337e73c2-20cf-4ab3-9a74-33bb6af0570a",
        "Conditions": [
          {
            "NextAction": "2431e6db-3728-4dbe-ad9d-b5a656fa5831",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CHAT"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "337e73c2-20cf-4ab3-9a74-33bb6af0570a",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Got it! As I understand it, you want to update your Postal Code to <say-as interpret-as=\"digits\">$.Attributes.PostalCode</say-as>?",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "4f02daa8-66e9-433b-908a-a9b5e54f3a8f",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "1437d271-2422-4055-abd9-703fa20af6b1",
        "Conditions": [
          {
            "NextAction": "f35841d5-0209-43cd-ad6c-1460fad01e82",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "ddf442a9-0087-4c08-8daa-3c52a83b162b",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "1437d271-2422-4055-abd9-703fa20af6b1",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "1437d271-2422-4055-abd9-703fa20af6b1",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.CityAttempt"
      },
      "Identifier": "3471eb38-02c3-4683-902a-e2b424afe101",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "7bd66d87-9205-46f6-9b25-3b0a6ca64594",
        "Conditions": [
          {
            "NextAction": "f1644ea7-d2d9-49f4-93b7-f5f968bcaf83",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "1"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "2"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "7bd66d87-9205-46f6-9b25-3b0a6ca64594",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "620ded2c-bc8b-4fbc-8961-317ea9364cba",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
        "Conditions": [
          {
            "NextAction": "acd4cd0a-5c0b-4951-ad86-811218876dfc",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please say yes, or no."
      },
      "Identifier": "acd4cd0a-5c0b-4951-ad86-811218876dfc",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "27975726-8d4f-4510-9ad1-b015ee2d69aa",
        "Errors": [
          {
            "NextAction": "27975726-8d4f-4510-9ad1-b015ee2d69aa",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "City": "$.Lex.Slots.CityName"
        }
      },
      "Identifier": "7b3ea31d-7cc9-4423-86ce-165609cb2e09",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "27975726-8d4f-4510-9ad1-b015ee2d69aa",
        "Errors": [
          {
            "NextAction": "27975726-8d4f-4510-9ad1-b015ee2d69aa",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Got it! As I understand it, you want to update your City to $.Attributes.City?",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "27975726-8d4f-4510-9ad1-b015ee2d69aa",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "620ded2c-bc8b-4fbc-8961-317ea9364cba",
        "Conditions": [
          {
            "NextAction": "f35841d5-0209-43cd-ad6c-1460fad01e82",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "3471eb38-02c3-4683-902a-e2b424afe101",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "620ded2c-bc8b-4fbc-8961-317ea9364cba",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "620ded2c-bc8b-4fbc-8961-317ea9364cba",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.PostalCodeAttempt"
      },
      "Identifier": "ddf442a9-0087-4c08-8daa-3c52a83b162b",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "b1097025-219e-4396-b7c9-811b0224e131",
        "Conditions": [
          {
            "NextAction": "40ef122a-7ef7-4a11-bad6-967560588eea",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "1"
              ]
            }
          },
          {
            "NextAction": "93299230-cc94-41cd-9623-703db9670b0f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "2"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "b1097025-219e-4396-b7c9-811b0224e131",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "1437d271-2422-4055-abd9-703fa20af6b1",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "93299230-cc94-41cd-9623-703db9670b0f",
        "Conditions": [
          {
            "NextAction": "8b01b5de-4605-4b07-85cf-729dab84719f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "93299230-cc94-41cd-9623-703db9670b0f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Channel"
      },
      "Identifier": "8ac60536-10df-486d-972e-e8455ef39826",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "4f02daa8-66e9-433b-908a-a9b5e54f3a8f",
        "Conditions": [
          {
            "NextAction": "bf772dae-035e-456c-9e0a-3d5add487514",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CHAT"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "4f02daa8-66e9-433b-908a-a9b5e54f3a8f",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "Got it! As I understand it, you want to update your Postal Code to $.Attributes.PostalCode?",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "bf772dae-035e-456c-9e0a-3d5add487514",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "1437d271-2422-4055-abd9-703fa20af6b1",
        "Conditions": [
          {
            "NextAction": "f35841d5-0209-43cd-ad6c-1460fad01e82",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "ddf442a9-0087-4c08-8daa-3c52a83b162b",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "1437d271-2422-4055-abd9-703fa20af6b1",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "1437d271-2422-4055-abd9-703fa20af6b1",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "186e07e4-7e9b-430e-854f-d07a5c2a6278",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
        "Conditions": [
          {
            "NextAction": "f3726801-e803-4f23-8dc5-a8680c715b41",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please say yes, or no."
      },
      "Identifier": "f3726801-e803-4f23-8dc5-a8680c715b41",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "5266f026-fdb1-4b27-96c9-4a7d1a2f8bfa",
        "Errors": [
          {
            "NextAction": "5266f026-fdb1-4b27-96c9-4a7d1a2f8bfa",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Please state the new City, State, or Zip Code you are wanting to update.\n\nIf you need to update more than one, you will be given the opportunity to update another value after each update.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/787UO3BDCM/EMYIV2MRF8"
        }
      },
      "Identifier": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "8e7b6f75-abde-4881-991c-ce6ea5f394a3",
        "Conditions": [
          {
            "NextAction": "7b3ea31d-7cc9-4423-86ce-165609cb2e09",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "City"
              ]
            }
          },
          {
            "NextAction": "6e5e5c16-5f70-4f44-9044-264fde6877ca",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "State"
              ]
            }
          },
          {
            "NextAction": "b8e3b920-790e-4aa4-8216-5b404aeffed3",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ZipCode"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "8e7b6f75-abde-4881-991c-ce6ea5f394a3",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "8e7b6f75-abde-4881-991c-ce6ea5f394a3",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ProfileRequestData": {
          "FirstName": "$.Attributes.FirstName",
          "LastName": "$.Attributes.LastName",
          "Address1": "$.Attributes.AddressLine1",
          "Address2": "$.Attributes.SuiteAptNum",
          "City": "$.Attributes.City",
          "PostalCode": "$.Attributes.PostalCode",
          "State": "$.Attributes.State"
        },
        "ProfileResponseData": [
          "FirstName",
          "LastName",
          "Address1",
          "Address2",
          "City",
          "PostalCode",
          "State"
        ]
      },
      "Identifier": "f35841d5-0209-43cd-ad6c-1460fad01e82",
      "Type": "UpdateCustomerProfile",
      "Transitions": {
        "NextAction": "5266f026-fdb1-4b27-96c9-4a7d1a2f8bfa",
        "Errors": [
          {
            "NextAction": "5266f026-fdb1-4b27-96c9-4a7d1a2f8bfa",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
      },
      "Identifier": "a06528fb-3394-418f-a2bd-9c4bf3e3f82c",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "e7f494fa-6f1e-4161-ada7-2ee862962f3c",
        "Errors": [
          {
            "NextAction": "e7f494fa-6f1e-4161-ada7-2ee862962f3c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
      },
      "Identifier": "905d6025-6d3e-433e-a07f-ede211f69eda",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "e7f494fa-6f1e-4161-ada7-2ee862962f3c",
        "Errors": [
          {
            "NextAction": "e7f494fa-6f1e-4161-ada7-2ee862962f3c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "a971cabb-9892-4026-9ef2-bb39277a9602",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
        "Conditions": [
          {
            "NextAction": "241e8851-4880-4af6-bf99-4151f3a87957",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "df501e08-992f-4dd3-b622-bc2fac98a8d8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please say yes, or no."
      },
      "Identifier": "241e8851-4880-4af6-bf99-4151f3a87957",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "689fb514-4cbc-40fa-a36c-54548fcda2dd",
        "Errors": [
          {
            "NextAction": "689fb514-4cbc-40fa-a36c-54548fcda2dd",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "The branch nearest to you is $.Attributes.BranchAddress. We have also sent an s-n-s text to your phone number for your convenience."
      },
      "Identifier": "16402232-3009-4941-a6c2-325657133afe",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "689fb514-4cbc-40fa-a36c-54548fcda2dd",
        "Errors": [
          {
            "NextAction": "689fb514-4cbc-40fa-a36c-54548fcda2dd",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Understood. Thank you for calling Global Technology Solutions, L-L-C. Have a great day!"
      },
      "Identifier": "307cffe1-335f-4f5e-9f46-7dea67b376f8",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "65e1c107-a126-4e48-a830-927eecf90a21",
        "Errors": [
          {
            "NextAction": "65e1c107-a126-4e48-a830-927eecf90a21",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:GTS-Assessment-GetBranchAddress",
        "InvocationTimeLimitSeconds": "3",
        "LambdaInvocationAttributes": {
          "PostalCode": "$.Attributes.PostalCode",
          "CallerPhoneNumber": "$.CustomerEndpoint.Address"
        }
      },
      "Identifier": "e2bf3eda-bb8a-4837-ac8b-09422472412c",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "8b828c2f-d2a4-494a-a040-7b30d79f6628",
        "Errors": [
          {
            "NextAction": "93299230-cc94-41cd-9623-703db9670b0f",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "Would you like to update your city state or zipcode? Currently these are set to: $.Attributes.City $.Attributes.State, <say-as interpret-as=\"digits\">$.Attributes.PostalCode</say-as>.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "337e73c2-20cf-4ab3-9a74-33bb6af0570a",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "c6a2ed32-2b1d-4b0f-a84c-c0e5b1e5caa8",
        "Conditions": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "689fb514-4cbc-40fa-a36c-54548fcda2dd",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "c6a2ed32-2b1d-4b0f-a84c-c0e5b1e5caa8",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "c6a2ed32-2b1d-4b0f-a84c-c0e5b1e5caa8",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Would you like to update your city state or zipcode? Currently these are set to: $.Attributes.City $.Attributes.State, $.Attributes.PostalCode.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "2431e6db-3728-4dbe-ad9d-b5a656fa5831",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "c6a2ed32-2b1d-4b0f-a84c-c0e5b1e5caa8",
        "Conditions": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "689fb514-4cbc-40fa-a36c-54548fcda2dd",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "c6a2ed32-2b1d-4b0f-a84c-c0e5b1e5caa8",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "c6a2ed32-2b1d-4b0f-a84c-c0e5b1e5caa8",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Great. Finally, would you like to return to the previous menu and continue to update your information?",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/CADJYDHARY/3VDBPGTXYF"
        }
      },
      "Identifier": "5266f026-fdb1-4b27-96c9-4a7d1a2f8bfa",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "186e07e4-7e9b-430e-854f-d07a5c2a6278",
        "Conditions": [
          {
            "NextAction": "e68c7e9a-a5a2-4251-8f3e-a9d4c6584fe0",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Yes"
              ]
            }
          },
          {
            "NextAction": "689fb514-4cbc-40fa-a36c-54548fcda2dd",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "186e07e4-7e9b-430e-854f-d07a5c2a6278",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "186e07e4-7e9b-430e-854f-d07a5c2a6278",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Can I help you with anything else today?",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/31MDJORUST/IBA7IZAJ7S"
        }
      },
      "Identifier": "689fb514-4cbc-40fa-a36c-54548fcda2dd",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "a971cabb-9892-4026-9ef2-bb39277a9602",
        "Conditions": [
          {
            "NextAction": "a06528fb-3394-418f-a2bd-9c4bf3e3f82c",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "PromotionOffer"
              ]
            }
          },
          {
            "NextAction": "905d6025-6d3e-433e-a07f-ede211f69eda",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Agent"
              ]
            }
          },
          {
            "NextAction": "307cffe1-335f-4f5e-9f46-7dea67b376f8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "No"
              ]
            }
          },
          {
            "NextAction": "e2bf3eda-bb8a-4837-ac8b-09422472412c",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "GetNearestBranch"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "a971cabb-9892-4026-9ef2-bb39277a9602",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "a971cabb-9892-4026-9ef2-bb39277a9602",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    }
  ]
}
    JSON
  tags = {
    "Name"        = "GTS Test Contact Flow",
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}


resource "aws_connect_contact_flow" "GTS-Partner-Assessment-Entry" {
  instance_id = "9fbc8807-1345-4962-ab2a-83eb1b45fe1e"
  name        = "GTS-Partner-Assessment-Entry"
  description = "GTS-Partner-Assessment-Entry"
  type        = "CONTACT_FLOW"
  content     = <<JSON
    {
  "Version": "2019-10-30",
  "StartAction": "a3de72ca-9ce1-48f9-99b6-4f22da89ea6a",
  "Metadata": {
    "entryPointPosition": {
      "x": 14.4,
      "y": 544.8000000000001
    },
    "ActionMetadata": {
      "a3de72ca-9ce1-48f9-99b6-4f22da89ea6a": {
        "position": {
          "x": 240.8,
          "y": 570.4
        }
      },
      "122b3152-5a13-4849-abf5-3989ae9afc71": {
        "position": {
          "x": 244.8,
          "y": 754.4000000000001
        }
      },
      "09c3d542-8816-480e-aafb-854b43c3e37e": {
        "position": {
          "x": 254.4,
          "y": 927.2
        },
        "overrideConsoleVoice": false
      },
      "76e55ced-a6e1-4afd-8eb9-40263ae7e883": {
        "position": {
          "x": 2624.8,
          "y": 308.8
        },
        "conditionMetadata": [
          {
            "id": "e0ce7ac4-8b5b-4785-a60a-0f22b5896f55",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "52fc4b9e-a02e-40f9-8a5f-1de520a7bd29",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CallbackModule"
          },
          {
            "id": "f7df2ae3-e234-4cfc-8bee-018529fc18c1",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "VoicemailModule"
          }
        ]
      },
      "a4c79b30-ab72-4a49-833a-1e9c95ce4cc3": {
        "position": {
          "x": 1694.4,
          "y": 955.2
        }
      },
      "44917995-9106-49d2-aba1-67ca0ebc9e19": {
        "position": {
          "x": 1696.8000000000002,
          "y": 1094.4
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "GTS-Partner-Assessment-Update-Address"
          }
        },
        "ContactFlow": {
          "text": "GTS-Partner-Assessment-Update-Address"
        }
      },
      "4f2c48be-62bc-4a71-86b7-00c869b1cf70": {
        "position": {
          "x": 2308,
          "y": 625.6
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Partner-Assessment-Authenticate-User"
          }
        },
        "contactFlowModuleName": "GTS-Partner-Assessment-Authenticate-User"
      },
      "b58cbbad-a7db-4b90-9f1e-720d978d742f": {
        "position": {
          "x": 2315.2000000000003,
          "y": 364.8
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Partner-Assessment-Make-Payment-Module"
          }
        },
        "contactFlowModuleName": "GTS-Partner-Assessment-Make-Payment-Module"
      },
      "be36a267-4a9f-4301-bd80-c66464f49790": {
        "position": {
          "x": 2621.6000000000004,
          "y": 568.8000000000001
        },
        "conditionMetadata": [
          {
            "id": "f306a27f-89ef-45a6-9bd5-dccbc5527274",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "97108de1-9841-4f7c-be23-27513b68444c",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CallbackModule"
          },
          {
            "id": "3e936f08-0b10-4658-b884-85d344278b10",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "VoicemailModule"
          }
        ]
      },
      "c63bd7cd-b209-426a-a1c7-79bdecc26f62": {
        "position": {
          "x": 2046.4,
          "y": 443.20000000000005
        },
        "conditionMetadata": [
          {
            "id": "be4f6d0d-be05-4a83-a417-00eef036b81e",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "True"
          },
          {
            "id": "0d4bf552-8804-44c4-a00f-6da34679d556",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "False"
          }
        ]
      },
      "1f994c48-8d24-4426-9c3c-936f89c57dcd": {
        "position": {
          "x": 2317.6,
          "y": 1060.8
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Partner-Assessment-Authenticate-User"
          }
        },
        "contactFlowModuleName": "GTS-Partner-Assessment-Authenticate-User"
      },
      "76800757-c9db-4872-ada1-b8e1dbfbfc95": {
        "position": {
          "x": 2640,
          "y": 1030.4
        },
        "conditionMetadata": [
          {
            "id": "0b293711-a4b0-415c-8db5-9a9a71054c2b",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "507c3fd9-9c3f-40ef-ab19-c50fae62ed7a",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CallbackModule"
          },
          {
            "id": "be793a19-9915-45d4-8d61-de977146acad",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "VoicemailModule"
          }
        ]
      },
      "3e1ad5d1-4c79-46d8-8915-30f196a169dc": {
        "position": {
          "x": 5516.8,
          "y": 2489.6000000000004
        }
      },
      "5a0029f7-9507-4313-a2f3-1857cf238185": {
        "position": {
          "x": 5002.400000000001,
          "y": 2665.6000000000004
        }
      },
      "bf8eb035-f4f4-4223-b4db-2a56db986bdb": {
        "position": {
          "x": 5234.400000000001,
          "y": 2674.4
        }
      },
      "f96d4cb8-50e7-4082-a316-055d6a6e29da": {
        "position": {
          "x": 4700.8,
          "y": 2338.4
        }
      },
      "ba27a9e1-a3b2-4613-a5bc-978ee32c6020": {
        "position": {
          "x": 5237.6,
          "y": 2129.6
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-CallbackModule"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-CallbackModule"
      },
      "92cb8aa7-a3b6-463d-949d-e2cd500c3010": {
        "position": {
          "x": 5221.6,
          "y": 1947.2
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "8453ce39-5624-4abf-ab03-60be447552c2": {
        "position": {
          "x": 5249.6,
          "y": 2352.8
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "AC-Blog-Callback-Welcome"
          }
        },
        "ContactFlow": {
          "text": "AC-Blog-Callback-Welcome"
        }
      },
      "45629001-fca1-4ced-850d-7cdd451691f4": {
        "position": {
          "x": 5481.6,
          "y": 2260
        }
      },
      "129f2322-a19e-44cb-b30b-42ab456cc24b": {
        "position": {
          "x": 2875.2000000000003,
          "y": 1904
        },
        "parameters": {
          "QueueId": {
            "useDynamic": true
          }
        },
        "useDynamic": true,
        "queue": "$.Queue.ARN"
      },
      "e2c4850a-70d2-42db-80bf-56d9a26f15ea": {
        "position": {
          "x": 2717.6000000000004,
          "y": 3298.4
        }
      },
      "f6c3f8ae-6f7f-4154-a261-9f292e9a6b42": {
        "position": {
          "x": 3286.4,
          "y": 3292
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "AC-Blog-Callback-Welcome"
          }
        },
        "ContactFlow": {
          "text": "AC-Blog-Callback-Welcome"
        }
      },
      "139e9527-b350-46f7-86e4-66189e743994": {
        "position": {
          "x": 3268,
          "y": 3102.4
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-CallbackModule"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-CallbackModule"
      },
      "91bb59ab-3f82-4e5a-826c-fd3e1ee2e9bf": {
        "position": {
          "x": 3250.4,
          "y": 2903.2000000000003
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "4b3521d9-df60-49b7-8032-34039ee99e11": {
        "position": {
          "x": 3044,
          "y": 3230.4
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot",
        "conditionMetadata": [
          {
            "id": "41b357de-c5d4-42e7-b1c9-876b4bb42139",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Voicemail"
          },
          {
            "id": "28794686-c378-4413-8d5d-5439f9a1b1b7",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          },
          {
            "id": "3c0f37a1-c0aa-468d-8e5f-8f27ed86bd33",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "ef10f317-1dae-4aaa-b4fe-8d7ab82dc830",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ScheduleCallback"
          }
        ]
      },
      "53b133da-8090-4f92-bf63-f53089ff30bc": {
        "position": {
          "x": 2658.4,
          "y": 2133.6
        },
        "conditionMetadata": [
          {
            "id": "9f014ea7-46f7-4666-bdf4-5500345a713c",
            "operator": {
              "name": "Is greater than",
              "value": "GreaterThan",
              "shortDisplay": ">"
            },
            "value": "5"
          }
        ]
      },
      "56839759-f866-4e17-91eb-2c60f0ffbfe4": {
        "position": {
          "x": 5007.200000000001,
          "y": 2288.8
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Tier-OOH-Holiday-Bot",
        "conditionMetadata": [
          {
            "id": "3649b6d7-8b05-41d1-9cbd-6925833d9168",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Voicemail"
          },
          {
            "id": "f624f3b7-74ad-4ed3-8228-7d877a83e0c6",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Repeat"
          },
          {
            "id": "e0d3c292-a18a-4314-b8ae-337fbd1e698e",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "e99ce65e-d712-4111-abc9-ac2d53b3d0b7",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ScheduleCallback"
          }
        ]
      },
      "1098b0c0-08aa-47fe-b3f3-5142ed308752": {
        "position": {
          "x": 4088,
          "y": 1948.8000000000002
        },
        "dynamicParams": []
      },
      "e578e347-3a1e-4bcc-b024-76c56c656c4a": {
        "position": {
          "x": 4102.400000000001,
          "y": 2160
        },
        "dynamicParams": []
      },
      "4082b8e0-b539-41a8-aa78-7090ff62ce9f": {
        "position": {
          "x": 4096,
          "y": 2371.2000000000003
        },
        "dynamicParams": []
      },
      "9a32bfb7-b972-4c9c-a610-12f22c340096": {
        "position": {
          "x": 4075.2000000000003,
          "y": 2584
        },
        "dynamicParams": []
      },
      "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f": {
        "position": {
          "x": 4394.400000000001,
          "y": 2240
        }
      },
      "60de70f4-534d-44e2-8647-19d523105866": {
        "position": {
          "x": 256,
          "y": 1092.8
        },
        "parameters": {
          "EventHooks": {
            "CustomerQueue": {
              "displayName": "GTS-QueueFlow"
            }
          }
        },
        "contactFlow": {
          "text": "GTS-QueueFlow",
          "id": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/580a0d67-e34c-4455-8a9a-2b53de334570"
        },
        "customerOrAgent": true
      },
      "e8691336-2cbb-41b5-b57f-192fda32c0c1": {
        "position": {
          "x": 3508,
          "y": 1924
        },
        "dynamicMetadata": {}
      },
      "cecb152f-c966-4a49-99cb-b06d122cf89a": {
        "position": {
          "x": 3809.6000000000004,
          "y": 2161.6
        },
        "conditionMetadata": [
          {
            "id": "80bff017-a1ee-4807-be25-9b012dfdd0f3",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Sales"
          },
          {
            "id": "a1c4a6af-be65-4f9c-ad2c-2a82e18979d5",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Support"
          },
          {
            "id": "82110a3d-17ce-4db0-922f-59020117d469",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "Finance"
          },
          {
            "id": "c868471f-8ad1-4770-b90d-935fbc0bed9a",
            "operator": {
              "name": "Contains",
              "value": "Contains",
              "shortDisplay": "contains"
            },
            "value": "General"
          }
        ]
      },
      "7c9dd547-b4b0-4f24-a6dd-d18c2e6130d1": {
        "position": {
          "x": 3539.2000000000003,
          "y": 2376
        }
      },
      "62654a17-de37-4150-828e-cd873ad8d766": {
        "position": {
          "x": 3520,
          "y": 2158.4
        },
        "parameters": {
          "Attributes": {
            "callerQueue": {
              "useDynamic": true
            },
            "queueStartTimestamp": {
              "useDynamic": true
            },
            "dialedPhoneNumber": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "callerQueue",
          "queueStartTimestamp",
          "dialedPhoneNumber"
        ]
      },
      "8a526ca3-92bd-406d-924b-22922e5f8a7c": {
        "position": {
          "x": 1692,
          "y": 1357.6000000000001
        },
        "dynamicParams": []
      },
      "84cfdb18-8f84-4e0d-a6b4-dba7a7c8bd06": {
        "position": {
          "x": 2037.6000000000001,
          "y": 686.4000000000001
        },
        "dynamicParams": []
      },
      "1f1cfdcd-fbfd-4718-a3a8-891f7d0325f5": {
        "position": {
          "x": 2066.4,
          "y": 1108
        },
        "dynamicParams": []
      },
      "4131d0b7-6ae4-4526-b096-cbccd1e3b7a7": {
        "position": {
          "x": 1677.6000000000001,
          "y": 1979.2
        }
      },
      "7204c717-fd20-48bf-b27f-ddc73dd3d686": {
        "position": {
          "x": 1372,
          "y": 1744
        }
      },
      "957ed229-68c2-4ee3-9314-2d3dff8996fd": {
        "position": {
          "x": 2064.8,
          "y": 867.2
        },
        "conditionMetadata": [
          {
            "id": "e0dd88a1-a310-444f-a463-658b7bfd4807",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "True"
          },
          {
            "id": "b0f71595-b278-477a-a05d-18adf9cc8b6b",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "False"
          }
        ]
      },
      "5a284bd1-54e3-4914-95a5-90082f3fd61c": {
        "position": {
          "x": 2641.6000000000004,
          "y": 848.8000000000001
        },
        "dynamicParams": []
      },
      "7b0b76ce-c2b4-40f6-b9b2-0ee471347ffe": {
        "position": {
          "x": 2309.6,
          "y": 855.2
        }
      },
      "51ac748d-e7ab-48e9-87ad-ae910dfb4e4f": {
        "position": {
          "x": 2640,
          "y": 1903.2
        },
        "parameters": {
          "EventHooks": {
            "CustomerQueue": {
              "displayName": "GTS-Dynamic-QueueFlow"
            }
          }
        },
        "contactFlow": {
          "text": "GTS-Dynamic-QueueFlow",
          "id": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/580a0d67-e34c-4455-8a9a-2b53de334570"
        },
        "customerOrAgent": true
      },
      "755cca97-8b71-4d3b-96ba-596b31557fd3": {
        "position": {
          "x": 1976,
          "y": 1852
        }
      },
      "1ff8b532-701a-4a25-b24e-47b05fff8bf3": {
        "position": {
          "x": 1693.6000000000001,
          "y": 2200
        }
      },
      "706b1333-cb68-4d2a-a4eb-67a682bca519": {
        "position": {
          "x": 2260,
          "y": 1911.2
        },
        "parameters": {
          "QueueId": {
            "displayName": "Support"
          }
        },
        "queue": {
          "text": "Support"
        }
      },
      "5a0f53db-5140-4a47-ab6d-ef7510a2875c": {
        "position": {
          "x": 1683.2,
          "y": 1603.2
        },
        "parameters": {
          "Text": {
            "useDynamic": true
          },
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Partner-Assessment-Main-Menu-Bot"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Partner-Assessment-Main-Menu-Bot",
        "useDynamic": true,
        "conditionMetadata": [
          {
            "id": "b8e85df2-a664-44c0-9ad9-9b3293624b2d",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "UpdateAddress"
          },
          {
            "id": "aadb3382-66b0-4898-8311-a0e9a361a6e0",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "MakeCreditPayment"
          },
          {
            "id": "acd000e1-0b4e-4ffe-ae4b-40dd36becdd7",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "GetOutstandingBalance"
          },
          {
            "id": "a45ee4ed-b64f-4941-be72-a4b23aa7a32b",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ReportFraudulentCharge"
          },
          {
            "id": "8a393fb4-579d-429d-bebc-3ef92cd293ad",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Agent"
          }
        ]
      },
      "eaea756f-39f8-4f2c-b357-daa5d102e822": {
        "position": {
          "x": 2093.6,
          "y": 1626.4
        },
        "dynamicParams": []
      },
      "3619cc9b-6891-4e06-a0eb-d2c5023a9b07": {
        "position": {
          "x": 2333.6,
          "y": 1306.4
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Partner-Assessment-Capture-Fraud-Date-Amount-Module"
          }
        },
        "contactFlowModuleName": "GTS-Partner-Assessment-Capture-Fraud-Date-Amount-Module"
      },
      "96b4ea07-82e8-4468-8330-ac0bef9b26e0": {
        "position": {
          "x": 2338.4,
          "y": 1498.4
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Partner-Assessment-Authenticate-User"
          }
        },
        "contactFlowModuleName": "GTS-Partner-Assessment-Authenticate-User"
      },
      "0c99df8d-6b88-4bef-a91b-04d7e85470ca": {
        "position": {
          "x": 2087.2000000000003,
          "y": 1345.6000000000001
        },
        "conditionMetadata": [
          {
            "id": "e978e738-2c5d-4e9e-bb31-5b3e91dc3684",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "True"
          },
          {
            "id": "a6154cf9-0a3f-445e-a846-9c556ac50f06",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "False"
          }
        ]
      },
      "1d1723b6-5a00-47fe-b74d-4d6be6e46965": {
        "position": {
          "x": 2657.6000000000004,
          "y": 1562.4
        },
        "conditionMetadata": [
          {
            "id": "03396aac-0f5e-44f5-86d1-2b80b00de77f",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "68e12301-581e-4bfc-b7d8-1eb59c1eac01",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CallbackModule"
          },
          {
            "id": "3a4dac38-324b-4e12-bd54-04719a1f5963",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "VoicemailModule"
          }
        ]
      },
      "ad6b09c4-d505-4fcf-b494-e6be88b7a96c": {
        "position": {
          "x": 3597.6000000000004,
          "y": 71.2
        }
      },
      "573c1457-44bb-4c23-8bfc-2ca9d5dd5924": {
        "position": {
          "x": 2744,
          "y": 1300.8000000000002
        },
        "conditionMetadata": [
          {
            "id": "e053190c-5c4a-4241-a60d-2a32c95b57d8",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Callback"
          },
          {
            "id": "0aa0c4e9-f899-4b43-bf96-eaead55be63a",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CallbackModule"
          },
          {
            "id": "a9f5f7a0-c1b0-4e47-92b6-1f0bc887c144",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "VoicemailModule"
          }
        ]
      },
      "86ff5858-9923-4124-b13f-82b239400198": {
        "position": {
          "x": 3084,
          "y": 14.4
        },
        "parameters": {
          "ContactFlowId": {
            "displayName": "AC-Blog-Callback-Welcome"
          }
        },
        "ContactFlow": {
          "text": "AC-Blog-Callback-Welcome"
        }
      },
      "2c348a2d-f6f9-4403-b28a-014e2a876935": {
        "position": {
          "x": 3105.6000000000004,
          "y": 156
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-CallbackModule"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-CallbackModule"
      },
      "7b7b6a0a-e5a6-4cf5-b847-509ee863f748": {
        "position": {
          "x": 3115.2000000000003,
          "y": 328.8
        },
        "parameters": {
          "FlowModuleId": {
            "displayName": "GTS-Dynamic-General-Inbox-VM-Module"
          }
        },
        "contactFlowModuleName": "GTS-Dynamic-General-Inbox-VM-Module"
      },
      "5d3188c7-8503-4a81-b2de-2287655bcb70": {
        "position": {
          "x": 3363.2000000000003,
          "y": 36.800000000000004
        }
      },
      "00cc4446-5f6c-4e5f-bb23-9901934ea7a3": {
        "position": {
          "x": 253.60000000000002,
          "y": 1344
        },
        "conditionMetadata": [
          {
            "id": "511a4e8c-ac67-4f5b-9d9b-643c4c06e2cf",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "CHAT"
          }
        ]
      },
      "40c9aae8-8b15-4be0-8d08-15dc8c54562b": {
        "position": {
          "x": 1276.8000000000002,
          "y": 898.4000000000001
        },
        "parameters": {
          "Attributes": {
            "FirstName": {
              "useDynamic": true
            },
            "LastName": {
              "useDynamic": true
            },
            "AddressLine1": {
              "useDynamic": true
            },
            "City": {
              "useDynamic": true
            },
            "PostalCode": {
              "useDynamic": true
            },
            "State": {
              "useDynamic": true
            },
            "AddressLine2": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "FirstName",
          "LastName",
          "AddressLine1",
          "City",
          "PostalCode",
          "State",
          "AddressLine2"
        ]
      },
      "ea05d812-33f3-46a4-a077-78d827ecf2fd": {
        "position": {
          "x": 1210.4,
          "y": 2311.2000000000003
        }
      },
      "1f304d89-de7f-4e7d-bd63-44b6824da964": {
        "position": {
          "x": 501.6,
          "y": 1128
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "displayName": "ContactFlow",
              "useLexBotDropdown": true,
              "lexV2BotName": "CapturePhoneNumber"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "CapturePhoneNumber",
        "lexV2BotAliasName": "ContactFlow",
        "conditionMetadata": [
          {
            "id": "845e1c6b-b842-497f-90dd-13efbbc5769b",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "PhoneNumber"
          }
        ]
      },
      "e482a8fc-8cbe-4145-b77c-65078a86e708": {
        "position": {
          "x": 487.20000000000005,
          "y": 1468
        },
        "parameters": {
          "Attributes": {
            "CallerNumber": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "CallerNumber"
        ]
      },
      "66e70481-fdf9-49b9-93e0-8743fbabdac7": {
        "position": {
          "x": 1333.6000000000001,
          "y": 1260.8000000000002
        },
        "parameters": {
          "ProfileRequestData": {
            "PhoneNumber": {
              "useDynamic": true
            }
          }
        },
        "useDynamic": {
          "PhoneNumber": true
        },
        "customerProfilesAction": "GetCustomerProfile"
      },
      "a8429dd4-d5f8-4bf1-8c70-bd3da66e377d": {
        "position": {
          "x": 743.2,
          "y": 1068.8
        },
        "parameters": {
          "Attributes": {
            "PhoneNumSlot": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "PhoneNumSlot"
        ]
      },
      "fe4a2638-d5b6-4804-8913-f2b6dced0443": {
        "position": {
          "x": 850.4000000000001,
          "y": 1284.8000000000002
        }
      }
    },
    "name": "GTS-Partner-Assessment-Entry",
    "description": "",
    "type": "contactFlow",
    "status": "published",
    "hash": {}
  },
  "Actions": [
    {
      "Parameters": {
        "FlowLoggingBehavior": "Enabled"
      },
      "Identifier": "a3de72ca-9ce1-48f9-99b6-4f22da89ea6a",
      "Type": "UpdateFlowLoggingBehavior",
      "Transitions": {
        "NextAction": "122b3152-5a13-4849-abf5-3989ae9afc71"
      }
    },
    {
      "Parameters": {
        "RecordingBehavior": {
          "RecordedParticipants": [
            "Agent",
            "Customer"
          ]
        },
        "AnalyticsBehavior": {
          "Enabled": "True",
          "AnalyticsLanguage": "en-US",
          "AnalyticsRedactionBehavior": "Disabled",
          "AnalyticsRedactionResults": "None",
          "ChannelConfiguration": {
            "Chat": {
              "AnalyticsModes": []
            },
            "Voice": {
              "AnalyticsModes": [
                "RealTime"
              ]
            }
          }
        }
      },
      "Identifier": "122b3152-5a13-4849-abf5-3989ae9afc71",
      "Type": "UpdateContactRecordingBehavior",
      "Transitions": {
        "NextAction": "09c3d542-8816-480e-aafb-854b43c3e37e"
      }
    },
    {
      "Parameters": {
        "TextToSpeechVoice": "Joanna"
      },
      "Identifier": "09c3d542-8816-480e-aafb-854b43c3e37e",
      "Type": "UpdateContactTextToSpeechVoice",
      "Transitions": {
        "NextAction": "60de70f4-534d-44e2-8647-19d523105866"
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.Transfer"
      },
      "Identifier": "76e55ced-a6e1-4afd-8eb9-40263ae7e883",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "5a284bd1-54e3-4914-95a5-90082f3fd61c",
        "Conditions": [
          {
            "NextAction": "86ff5858-9923-4124-b13f-82b239400198",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "2c348a2d-f6f9-4403-b28a-014e2a876935",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CallbackModule"
              ]
            }
          },
          {
            "NextAction": "7b7b6a0a-e5a6-4cf5-b847-509ee863f748",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "VoicemailModule"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "5a284bd1-54e3-4914-95a5-90082f3fd61c",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "a4c79b30-ab72-4a49-833a-1e9c95ce4cc3",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/580a0d67-e34c-4455-8a9a-2b53de334570"
      },
      "Identifier": "44917995-9106-49d2-aba1-67ca0ebc9e19",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "a4c79b30-ab72-4a49-833a-1e9c95ce4cc3",
        "Errors": [
          {
            "NextAction": "a4c79b30-ab72-4a49-833a-1e9c95ce4cc3",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "4f2c48be-62bc-4a71-86b7-00c869b1cf70",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "be36a267-4a9f-4301-bd80-c66464f49790",
        "Errors": [
          {
            "NextAction": "be36a267-4a9f-4301-bd80-c66464f49790",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "b58cbbad-a7db-4b90-9f1e-720d978d742f",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "76e55ced-a6e1-4afd-8eb9-40263ae7e883",
        "Errors": [
          {
            "NextAction": "76e55ced-a6e1-4afd-8eb9-40263ae7e883",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.Transfer"
      },
      "Identifier": "be36a267-4a9f-4301-bd80-c66464f49790",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "c63bd7cd-b209-426a-a1c7-79bdecc26f62",
        "Conditions": [
          {
            "NextAction": "86ff5858-9923-4124-b13f-82b239400198",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "2c348a2d-f6f9-4403-b28a-014e2a876935",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CallbackModule"
              ]
            }
          },
          {
            "NextAction": "7b7b6a0a-e5a6-4cf5-b847-509ee863f748",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "VoicemailModule"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "c63bd7cd-b209-426a-a1c7-79bdecc26f62",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.Authenticated"
      },
      "Identifier": "c63bd7cd-b209-426a-a1c7-79bdecc26f62",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "4f2c48be-62bc-4a71-86b7-00c869b1cf70",
        "Conditions": [
          {
            "NextAction": "b58cbbad-a7db-4b90-9f1e-720d978d742f",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "True"
              ]
            }
          },
          {
            "NextAction": "4f2c48be-62bc-4a71-86b7-00c869b1cf70",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "False"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "4f2c48be-62bc-4a71-86b7-00c869b1cf70",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "1f994c48-8d24-4426-9c3c-936f89c57dcd",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "76800757-c9db-4872-ada1-b8e1dbfbfc95",
        "Errors": [
          {
            "NextAction": "76800757-c9db-4872-ada1-b8e1dbfbfc95",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.Transfer"
      },
      "Identifier": "76800757-c9db-4872-ada1-b8e1dbfbfc95",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "957ed229-68c2-4ee3-9314-2d3dff8996fd",
        "Conditions": [
          {
            "NextAction": "86ff5858-9923-4124-b13f-82b239400198",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "2c348a2d-f6f9-4403-b28a-014e2a876935",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CallbackModule"
              ]
            }
          },
          {
            "NextAction": "7b7b6a0a-e5a6-4cf5-b847-509ee863f748",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "VoicemailModule"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "957ed229-68c2-4ee3-9314-2d3dff8996fd",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "3e1ad5d1-4c79-46d8-8915-30f196a169dc",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.InvalidEntryPrompt\n</speak>"
      },
      "Identifier": "5a0029f7-9507-4313-a2f3-1857cf238185",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "bf8eb035-f4f4-4223-b4db-2a56db986bdb",
        "Errors": [
          {
            "NextAction": "bf8eb035-f4f4-4223-b4db-2a56db986bdb",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "bf8eb035-f4f4-4223-b4db-2a56db986bdb",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Conditions": [
          {
            "NextAction": "56839759-f866-4e17-91eb-2c60f0ffbfe4",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "f96d4cb8-50e7-4082-a316-055d6a6e29da",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "56839759-f866-4e17-91eb-2c60f0ffbfe4",
        "Conditions": [
          {
            "NextAction": "56839759-f866-4e17-91eb-2c60f0ffbfe4",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "56839759-f866-4e17-91eb-2c60f0ffbfe4",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "ba27a9e1-a3b2-4613-a5bc-978ee32c6020",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Errors": [
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "92cb8aa7-a3b6-463d-949d-e2cd500c3010",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Errors": [
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/580a0d67-e34c-4455-8a9a-2b53de334570"
      },
      "Identifier": "8453ce39-5624-4abf-ab03-60be447552c2",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Errors": [
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.GoodbyePrompt\n</speak>"
      },
      "Identifier": "45629001-fca1-4ced-850d-7cdd451691f4",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "3e1ad5d1-4c79-46d8-8915-30f196a169dc",
        "Errors": [
          {
            "NextAction": "3e1ad5d1-4c79-46d8-8915-30f196a169dc",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "$.Queue.ARN"
      },
      "Identifier": "129f2322-a19e-44cb-b30b-42ab456cc24b",
      "Type": "GetMetricData",
      "Transitions": {
        "NextAction": "53b133da-8090-4f92-bf63-f53089ff30bc",
        "Errors": [
          {
            "NextAction": "53b133da-8090-4f92-bf63-f53089ff30bc",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "3"
      },
      "Identifier": "e2c4850a-70d2-42db-80bf-56d9a26f15ea",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "4b3521d9-df60-49b7-8032-34039ee99e11",
        "Conditions": [
          {
            "NextAction": "4b3521d9-df60-49b7-8032-34039ee99e11",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "4b3521d9-df60-49b7-8032-34039ee99e11",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/580a0d67-e34c-4455-8a9a-2b53de334570"
      },
      "Identifier": "f6c3f8ae-6f7f-4154-a261-9f292e9a6b42",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Errors": [
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "139e9527-b350-46f7-86e4-66189e743994",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Errors": [
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "91bb59ab-3f82-4e5a-826c-fd3e1ee2e9bf",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Errors": [
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.HigherThanNormalCallVolumePrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TEQDKPA1QQ/O2HB1BBTRW"
        }
      },
      "Identifier": "4b3521d9-df60-49b7-8032-34039ee99e11",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Conditions": [
          {
            "NextAction": "91bb59ab-3f82-4e5a-826c-fd3e1ee2e9bf",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Voicemail"
              ]
            }
          },
          {
            "NextAction": "e2c4850a-70d2-42db-80bf-56d9a26f15ea",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          },
          {
            "NextAction": "139e9527-b350-46f7-86e4-66189e743994",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "f6c3f8ae-6f7f-4154-a261-9f292e9a6b42",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ScheduleCallback"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "e8691336-2cbb-41b5-b57f-192fda32c0c1",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Metrics.Queue.Size"
      },
      "Identifier": "53b133da-8090-4f92-bf63-f53089ff30bc",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "e8691336-2cbb-41b5-b57f-192fda32c0c1",
        "Conditions": [
          {
            "NextAction": "4b3521d9-df60-49b7-8032-34039ee99e11",
            "Condition": {
              "Operator": "NumberGreaterThan",
              "Operands": [
                "5"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "e8691336-2cbb-41b5-b57f-192fda32c0c1",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\n$.Attributes.QueueAtCapacityPrompt\n</speak>",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TEQDKPA1QQ/O2HB1BBTRW"
        }
      },
      "Identifier": "56839759-f866-4e17-91eb-2c60f0ffbfe4",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
        "Conditions": [
          {
            "NextAction": "92cb8aa7-a3b6-463d-949d-e2cd500c3010",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Voicemail"
              ]
            }
          },
          {
            "NextAction": "f96d4cb8-50e7-4082-a316-055d6a6e29da",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Repeat"
              ]
            }
          },
          {
            "NextAction": "ba27a9e1-a3b2-4613-a5bc-978ee32c6020",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "8453ce39-5624-4abf-ab03-60be447552c2",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ScheduleCallback"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "5a0029f7-9507-4313-a2f3-1857cf238185",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "45629001-fca1-4ced-850d-7cdd451691f4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "1098b0c0-08aa-47fe-b3f3-5142ed308752",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
        "Errors": [
          {
            "NextAction": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "e578e347-3a1e-4bcc-b024-76c56c656c4a",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
        "Errors": [
          {
            "NextAction": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "4082b8e0-b539-41a8-aa78-7090ff62ce9f",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
        "Errors": [
          {
            "NextAction": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callbackQueueName": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
        }
      },
      "Identifier": "9a32bfb7-b972-4c9c-a610-12f22c340096",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
        "Errors": [
          {
            "NextAction": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "a9d2fdba-9465-4f32-8e39-ca8fb9c1cf0f",
      "Type": "TransferContactToQueue",
      "Transitions": {
        "NextAction": "56839759-f866-4e17-91eb-2c60f0ffbfe4",
        "Errors": [
          {
            "NextAction": "56839759-f866-4e17-91eb-2c60f0ffbfe4",
            "ErrorType": "QueueAtCapacity"
          },
          {
            "NextAction": "56839759-f866-4e17-91eb-2c60f0ffbfe4",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "EventHooks": {
          "CustomerQueue": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/580a0d67-e34c-4455-8a9a-2b53de334570"
        }
      },
      "Identifier": "60de70f4-534d-44e2-8647-19d523105866",
      "Type": "UpdateContactEventHooks",
      "Transitions": {
        "NextAction": "00cc4446-5f6c-4e5f-bb23-9901934ea7a3",
        "Errors": [
          {
            "NextAction": "00cc4446-5f6c-4e5f-bb23-9901934ea7a3",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LambdaFunctionARN": "arn:aws:lambda:us-west-2:770688834456:function:GetCurrentTimeStampLambda",
        "InvocationTimeLimitSeconds": "3"
      },
      "Identifier": "e8691336-2cbb-41b5-b57f-192fda32c0c1",
      "Type": "InvokeLambdaFunction",
      "Transitions": {
        "NextAction": "62654a17-de37-4150-828e-cd873ad8d766",
        "Errors": [
          {
            "NextAction": "62654a17-de37-4150-828e-cd873ad8d766",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.callerQueue"
      },
      "Identifier": "cecb152f-c966-4a49-99cb-b06d122cf89a",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "9a32bfb7-b972-4c9c-a610-12f22c340096",
        "Conditions": [
          {
            "NextAction": "1098b0c0-08aa-47fe-b3f3-5142ed308752",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Sales"
              ]
            }
          },
          {
            "NextAction": "e578e347-3a1e-4bcc-b024-76c56c656c4a",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Support"
              ]
            }
          },
          {
            "NextAction": "4082b8e0-b539-41a8-aa78-7090ff62ce9f",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "Finance"
              ]
            }
          },
          {
            "NextAction": "9a32bfb7-b972-4c9c-a610-12f22c340096",
            "Condition": {
              "Operator": "TextContains",
              "Operands": [
                "General"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "9a32bfb7-b972-4c9c-a610-12f22c340096",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Error setting contact attribute"
      },
      "Identifier": "7c9dd547-b4b0-4f24-a6dd-d18c2e6130d1",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "cecb152f-c966-4a49-99cb-b06d122cf89a",
        "Errors": [
          {
            "NextAction": "cecb152f-c966-4a49-99cb-b06d122cf89a",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "callerQueue": "$.Queue.Name",
          "queueStartTimestamp": "$.External.queueStartTimestamp",
          "dialedPhoneNumber": "$.SystemEndpoint.Address"
        }
      },
      "Identifier": "62654a17-de37-4150-828e-cd873ad8d766",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "cecb152f-c966-4a49-99cb-b06d122cf89a",
        "Errors": [
          {
            "NextAction": "7c9dd547-b4b0-4f24-a6dd-d18c2e6130d1",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "Intent": "Update Address"
        }
      },
      "Identifier": "8a526ca3-92bd-406d-924b-22922e5f8a7c",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "44917995-9106-49d2-aba1-67ca0ebc9e19",
        "Errors": [
          {
            "NextAction": "44917995-9106-49d2-aba1-67ca0ebc9e19",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "Intent": "Make Credit Payment"
        }
      },
      "Identifier": "84cfdb18-8f84-4e0d-a6b4-dba7a7c8bd06",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "c63bd7cd-b209-426a-a1c7-79bdecc26f62",
        "Errors": [
          {
            "NextAction": "c63bd7cd-b209-426a-a1c7-79bdecc26f62",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "Intent": "Get Balance"
        }
      },
      "Identifier": "1f1cfdcd-fbfd-4718-a3a8-891f7d0325f5",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "957ed229-68c2-4ee3-9314-2d3dff8996fd",
        "Errors": [
          {
            "NextAction": "957ed229-68c2-4ee3-9314-2d3dff8996fd",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "4131d0b7-6ae4-4526-b096-cbccd1e3b7a7",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "1ff8b532-701a-4a25-b24e-47b05fff8bf3",
        "Conditions": [
          {
            "NextAction": "7204c717-fd20-48bf-b27f-ddc73dd3d686",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "1ff8b532-701a-4a25-b24e-47b05fff8bf3",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "DoneLooping"
              ]
            }
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, but that was not a valid response. Please try again."
      },
      "Identifier": "7204c717-fd20-48bf-b27f-ddc73dd3d686",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "5a0f53db-5140-4a47-ab6d-ef7510a2875c",
        "Errors": [
          {
            "NextAction": "5a0f53db-5140-4a47-ab6d-ef7510a2875c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.Authenticated"
      },
      "Identifier": "957ed229-68c2-4ee3-9314-2d3dff8996fd",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "1f994c48-8d24-4426-9c3c-936f89c57dcd",
        "Conditions": [
          {
            "NextAction": "7b0b76ce-c2b4-40f6-b9b2-0ee471347ffe",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "True"
              ]
            }
          },
          {
            "NextAction": "1f994c48-8d24-4426-9c3c-936f89c57dcd",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "False"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "1f994c48-8d24-4426-9c3c-936f89c57dcd",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "AssessmentEntryPrompt": "What else can we help you with today?"
        }
      },
      "Identifier": "5a284bd1-54e3-4914-95a5-90082f3fd61c",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "5a0f53db-5140-4a47-ab6d-ef7510a2875c",
        "Errors": [
          {
            "NextAction": "5a0f53db-5140-4a47-ab6d-ef7510a2875c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Your current outstanding balance is $ $.Attributes.OutstandingBalance\n"
      },
      "Identifier": "7b0b76ce-c2b4-40f6-b9b2-0ee471347ffe",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "5a284bd1-54e3-4914-95a5-90082f3fd61c",
        "Errors": [
          {
            "NextAction": "5a284bd1-54e3-4914-95a5-90082f3fd61c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "EventHooks": {
          "CustomerQueue": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/580a0d67-e34c-4455-8a9a-2b53de334570"
        }
      },
      "Identifier": "51ac748d-e7ab-48e9-87ad-ae910dfb4e4f",
      "Type": "UpdateContactEventHooks",
      "Transitions": {
        "NextAction": "129f2322-a19e-44cb-b30b-42ab456cc24b",
        "Errors": [
          {
            "NextAction": "129f2322-a19e-44cb-b30b-42ab456cc24b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Okay, I've understood that you would like to speak to a live agent. Please hold as I transfer you."
      },
      "Identifier": "755cca97-8b71-4d3b-96ba-596b31557fd3",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "706b1333-cb68-4d2a-a4eb-67a682bca519",
        "Errors": [
          {
            "NextAction": "706b1333-cb68-4d2a-a4eb-67a682bca519",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "I'm sorry, it seems that I'm having trouble understanding you. Please hold as I transfer you to an agent for proper assistance. Thank you!"
      },
      "Identifier": "1ff8b532-701a-4a25-b24e-47b05fff8bf3",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "706b1333-cb68-4d2a-a4eb-67a682bca519",
        "Errors": [
          {
            "NextAction": "706b1333-cb68-4d2a-a4eb-67a682bca519",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/queue/ec834f00-ee3e-47a0-bd9b-2a6ad942ad84"
      },
      "Identifier": "706b1333-cb68-4d2a-a4eb-67a682bca519",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "51ac748d-e7ab-48e9-87ad-ae910dfb4e4f",
        "Errors": [
          {
            "NextAction": "51ac748d-e7ab-48e9-87ad-ae910dfb4e4f",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "$.Attributes.AssessmentEntryPrompt",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/TGQI2N0JIF/BEDP2NVVCO"
        }
      },
      "Identifier": "5a0f53db-5140-4a47-ab6d-ef7510a2875c",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "4131d0b7-6ae4-4526-b096-cbccd1e3b7a7",
        "Conditions": [
          {
            "NextAction": "8a526ca3-92bd-406d-924b-22922e5f8a7c",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "UpdateAddress"
              ]
            }
          },
          {
            "NextAction": "84cfdb18-8f84-4e0d-a6b4-dba7a7c8bd06",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "MakeCreditPayment"
              ]
            }
          },
          {
            "NextAction": "1f1cfdcd-fbfd-4718-a3a8-891f7d0325f5",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "GetOutstandingBalance"
              ]
            }
          },
          {
            "NextAction": "eaea756f-39f8-4f2c-b357-daa5d102e822",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ReportFraudulentCharge"
              ]
            }
          },
          {
            "NextAction": "755cca97-8b71-4d3b-96ba-596b31557fd3",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Agent"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "4131d0b7-6ae4-4526-b096-cbccd1e3b7a7",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "4131d0b7-6ae4-4526-b096-cbccd1e3b7a7",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "Intent": "Report Fraudulent Charge"
        }
      },
      "Identifier": "eaea756f-39f8-4f2c-b357-daa5d102e822",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "0c99df8d-6b88-4bef-a91b-04d7e85470ca",
        "Errors": [
          {
            "NextAction": "0c99df8d-6b88-4bef-a91b-04d7e85470ca",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "a44806bc-51a8-40ab-94fd-7b155cdf5a4f"
      },
      "Identifier": "3619cc9b-6891-4e06-a0eb-d2c5023a9b07",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "573c1457-44bb-4c23-8bfc-2ca9d5dd5924",
        "Errors": [
          {
            "NextAction": "573c1457-44bb-4c23-8bfc-2ca9d5dd5924",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "96b4ea07-82e8-4468-8330-ac0bef9b26e0",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "1d1723b6-5a00-47fe-b74d-4d6be6e46965",
        "Errors": [
          {
            "NextAction": "1d1723b6-5a00-47fe-b74d-4d6be6e46965",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.Authenticated"
      },
      "Identifier": "0c99df8d-6b88-4bef-a91b-04d7e85470ca",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "96b4ea07-82e8-4468-8330-ac0bef9b26e0",
        "Conditions": [
          {
            "NextAction": "3619cc9b-6891-4e06-a0eb-d2c5023a9b07",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "True"
              ]
            }
          },
          {
            "NextAction": "96b4ea07-82e8-4468-8330-ac0bef9b26e0",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "False"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "96b4ea07-82e8-4468-8330-ac0bef9b26e0",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.Transfer"
      },
      "Identifier": "1d1723b6-5a00-47fe-b74d-4d6be6e46965",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "0c99df8d-6b88-4bef-a91b-04d7e85470ca",
        "Conditions": [
          {
            "NextAction": "86ff5858-9923-4124-b13f-82b239400198",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "2c348a2d-f6f9-4403-b28a-014e2a876935",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CallbackModule"
              ]
            }
          },
          {
            "NextAction": "7b7b6a0a-e5a6-4cf5-b847-509ee863f748",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "VoicemailModule"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "0c99df8d-6b88-4bef-a91b-04d7e85470ca",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "ad6b09c4-d505-4fcf-b494-e6be88b7a96c",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Attributes.Transfer"
      },
      "Identifier": "573c1457-44bb-4c23-8bfc-2ca9d5dd5924",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "5d3188c7-8503-4a81-b2de-2287655bcb70",
        "Conditions": [
          {
            "NextAction": "86ff5858-9923-4124-b13f-82b239400198",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Callback"
              ]
            }
          },
          {
            "NextAction": "2c348a2d-f6f9-4403-b28a-014e2a876935",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CallbackModule"
              ]
            }
          },
          {
            "NextAction": "7b7b6a0a-e5a6-4cf5-b847-509ee863f748",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "VoicemailModule"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "5d3188c7-8503-4a81-b2de-2287655bcb70",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ContactFlowId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/contact-flow/580a0d67-e34c-4455-8a9a-2b53de334570"
      },
      "Identifier": "86ff5858-9923-4124-b13f-82b239400198",
      "Type": "TransferToFlow",
      "Transitions": {
        "NextAction": "5d3188c7-8503-4a81-b2de-2287655bcb70",
        "Errors": [
          {
            "NextAction": "5d3188c7-8503-4a81-b2de-2287655bcb70",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "2c348a2d-f6f9-4403-b28a-014e2a876935",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "5d3188c7-8503-4a81-b2de-2287655bcb70",
        "Errors": [
          {
            "NextAction": "5d3188c7-8503-4a81-b2de-2287655bcb70",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowModuleId": "arn:aws:connect:us-west-2:770688834456:instance/9fbc8807-1345-4962-ab2a-83eb1b45fe1e/flow-module/91cd1c4b-eed4-4376-bb90-b87db41cabaa"
      },
      "Identifier": "7b7b6a0a-e5a6-4cf5-b847-509ee863f748",
      "Type": "InvokeFlowModule",
      "Transitions": {
        "NextAction": "5d3188c7-8503-4a81-b2de-2287655bcb70",
        "Errors": [
          {
            "NextAction": "5d3188c7-8503-4a81-b2de-2287655bcb70",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "Thank you for calling Global Technology Solutions, LLC. Goodbye!"
      },
      "Identifier": "5d3188c7-8503-4a81-b2de-2287655bcb70",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "ad6b09c4-d505-4fcf-b494-e6be88b7a96c",
        "Errors": [
          {
            "NextAction": "ad6b09c4-d505-4fcf-b494-e6be88b7a96c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ComparisonValue": "$.Channel"
      },
      "Identifier": "00cc4446-5f6c-4e5f-bb23-9901934ea7a3",
      "Type": "Compare",
      "Transitions": {
        "NextAction": "e482a8fc-8cbe-4145-b77c-65078a86e708",
        "Conditions": [
          {
            "NextAction": "1f304d89-de7f-4e7d-bd63-44b6824da964",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "CHAT"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "e482a8fc-8cbe-4145-b77c-65078a86e708",
            "ErrorType": "NoMatchingCondition"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "FirstName": "$.Customer.FirstName",
          "LastName": "$.Customer.LastName",
          "AddressLine1": "$.Customer.Address1",
          "City": "$.Customer.City",
          "PostalCode": "$.Customer.PostalCode",
          "State": "$.Customer.State",
          "AddressLine2": "$.Customer.Address2",
          "AssessmentEntryPrompt": "Hello $.Attributes.FirstName! How may I help you today?"
        }
      },
      "Identifier": "40c9aae8-8b15-4be0-8d08-15dc8c54562b",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "5a0f53db-5140-4a47-ab6d-ef7510a2875c",
        "Errors": [
          {
            "NextAction": "5a0f53db-5140-4a47-ab6d-ef7510a2875c",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Hello! I'm sorry, it seems I've been unable to find your information. Please hold a moment while I send you to an agent for proper assistance. Thank you!"
      },
      "Identifier": "ea05d812-33f3-46a4-a077-78d827ecf2fd",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "706b1333-cb68-4d2a-a4eb-67a682bca519",
        "Errors": [
          {
            "NextAction": "706b1333-cb68-4d2a-a4eb-67a682bca519",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Please enter the Phone number that you have registered with us, excluding the Country code. For example: 9705552222",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/GTSRPTQUJU/EXZRI8DURD"
        }
      },
      "Identifier": "1f304d89-de7f-4e7d-bd63-44b6824da964",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "fe4a2638-d5b6-4804-8913-f2b6dced0443",
        "Conditions": [
          {
            "NextAction": "a8429dd4-d5f8-4bf1-8c70-bd3da66e377d",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "PhoneNumber"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "fe4a2638-d5b6-4804-8913-f2b6dced0443",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "fe4a2638-d5b6-4804-8913-f2b6dced0443",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "CallerNumber": "$.CustomerEndpoint.Address"
        }
      },
      "Identifier": "e482a8fc-8cbe-4145-b77c-65078a86e708",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "66e70481-fdf9-49b9-93e0-8743fbabdac7",
        "Errors": [
          {
            "NextAction": "66e70481-fdf9-49b9-93e0-8743fbabdac7",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ProfileRequestData": {
          "PhoneNumber": "$.Attributes.CallerNumber"
        },
        "ProfileResponseData": [
          "FirstName",
          "LastName",
          "Address1",
          "Address2",
          "Address3",
          "Address4",
          "City",
          "PostalCode",
          "State"
        ]
      },
      "Identifier": "66e70481-fdf9-49b9-93e0-8743fbabdac7",
      "Type": "GetCustomerProfile",
      "Transitions": {
        "NextAction": "40c9aae8-8b15-4be0-8d08-15dc8c54562b",
        "Errors": [
          {
            "NextAction": "ea05d812-33f3-46a4-a077-78d827ecf2fd",
            "ErrorType": "NoMatchingError"
          },
          {
            "NextAction": "ea05d812-33f3-46a4-a077-78d827ecf2fd",
            "ErrorType": "MultipleFoundError"
          },
          {
            "NextAction": "ea05d812-33f3-46a4-a077-78d827ecf2fd",
            "ErrorType": "NoneFoundError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "PhoneNumSlot": "$.Lex.Slots.PhoneNumberSlot",
          "CallerNumber": "+1$.Attributes.PhoneNumSlot"
        }
      },
      "Identifier": "a8429dd4-d5f8-4bf1-8c70-bd3da66e377d",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "66e70481-fdf9-49b9-93e0-8743fbabdac7",
        "Errors": [
          {
            "NextAction": "66e70481-fdf9-49b9-93e0-8743fbabdac7",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "That was not a valid entry. Please try again."
      },
      "Identifier": "fe4a2638-d5b6-4804-8913-f2b6dced0443",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "1f304d89-de7f-4e7d-bd63-44b6824da964",
        "Errors": [
          {
            "NextAction": "1f304d89-de7f-4e7d-bd63-44b6824da964",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    }
  ]
}
    JSON

  tags = {
    "Name"        = "GTS Example 101 Contact Flow Module",
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}

resource "aws_connect_contact_flow_module" "GTS-Dynamic-General-Inbox-VM-Module" {
  instance_id = "9fbc8807-1345-4962-ab2a-83eb1b45fe1e"
  name        = "GTS-Dynamic-General-Inbox-VM-Module"
  description = "GTS-Dynamic-General-Inbox-VM-Module"

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
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}




resource "aws_connect_quick_connect" "test-1" {
  instance_id = "9fbc8807-1345-4962-ab2a-83eb1b45fe1e"
  name        = "GTS Terraform Quick Connect"
  description = "Phone number Quick Connect created via terraform"

  quick_connect_config {
    quick_connect_type = "PHONE_NUMBER"

    phone_config {
      phone_number = "+12345678901"
    }
  }
}

resource "aws_connect_instance" "unicorn" {
  identity_management_type = "CONNECT_MANAGED"
  inbound_calls_enabled    = true
  instance_alias           = "unicorn-contact-center"
  outbound_calls_enabled   = true
}

resource "aws_connect_hours_of_operation" "general" {
  instance_id = aws_connect_instance.unicorn.id
  name        = "General Hours"
  description = "Monday Only"
  time_zone   = "EST"

  config {
    day = "MONDAY"

    start_time {
      hours   = 9
      minutes = 0
    }
    end_time {
      hours   = 17
      minutes = 0
    }
  }
}

resource "aws_connect_queue" "sales" {
  instance_id           = aws_connect_instance.unicorn.id
  name                  = "Sales"
  description           = "Customers want buy our Unicorns"
  hours_of_operation_id = aws_connect_hours_of_operation.general.hours_of_operation_id
}

resource "aws_connect_queue" "techincal_support" {
  instance_id           = aws_connect_instance.unicorn.id
  name                  = "Techincal Support"
  description           = "Customers having issues with Unicorns"
  hours_of_operation_id = aws_connect_hours_of_operation.general.hours_of_operation_id
}

resource "aws_connect_queue" "customer_service" {
  instance_id           = aws_connect_instance.unicorn.id
  name                  = "Customer Service"
  description           = "Customers asking about Unicorns"
  hours_of_operation_id = aws_connect_hours_of_operation.general.hours_of_operation_id
}

resource "aws_connect_contact_flow" "general" {
  instance_id  = aws_connect_instance.unicorn.id
  name         = "General"
  description  = "General Flow routing customers to queues"
  filename     = "flows/general_contact_flow.json"
  content_hash = filebase64sha256("flows/general_contact_flow.json")
}