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

resource "aws_connect_contact_flow" "contact_flow" {
  name        = "my-contact-flow"
  type        = "CUSTOM"
  instance_id = "gts-contact-center"

  content = <<JSON
    {
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
          "y": 2717.6000000000003
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
          "x": 2529.6000000000003,
          "y": 2356.8
        }
      },
      "66bd5bda-0bbe-46ee-a131-0800e56a428a": {
        "position": {
          "x": 2833.6000000000003,
          "y": 2107.2000000000003
        }
      },
      "395cb454-a50f-4e79-be37-e4750b56db49": {
        "position": {
          "x": 3357.6000000000003,
          "y": 1876.8000000000001
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
          "y": 1912.8000000000001
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
          "id": "arn:aws:connect:us-west-2:063246734163:instance/d9f339f5-f41f-4238-8463-77ac40e8a60e/contact-flow/53e0e3dd-7ac9-4523-9dee-cf1b45f86d18"
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
          "id": "arn:aws:connect:us-west-2:063246734163:instance/d9f339f5-f41f-4238-8463-77ac40e8a60e/operating-hours/987426ef-2d9d-40cf-a9d3-d30fc54c0223",
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
          "y": 1824.8000000000001
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
          "x": 1564.8000000000001,
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
          "y": 1768.8000000000001
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
          "x": 1628.8000000000001,
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
          "CustomerQueue":
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
        "ContactFlowId":
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
        "ContactFlowId": 
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
        "ContactFlowId": 
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
        "HoursOfOperationId": 
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
    "Name"        = "Test Contact Flow",
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}