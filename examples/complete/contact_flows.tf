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
  name        = "GTS Example"
  description = "Example Contact Flow Module Description"

  content = <<JSON
    {
  "Version": "2019-10-30",
  "StartAction": "24fed989-23fc-44c4-b5e6-5302597d47fa",
  "Metadata": {
    "entryPointPosition": {
      "x": -664,
      "y": 334.40000000000003
    },
    "ActionMetadata": {
      "39489945-ef88-48ca-b469-f68d2ce7c514": {
        "position": {
          "x": -192,
          "y": 751.2
        },
        "children": [
          "a665bea6-d46a-46da-b158-4f223f83fec9"
        ],
        "dynamicParams": []
      },
      "a665bea6-d46a-46da-b158-4f223f83fec9": {
        "position": {
          "x": -192,
          "y": 751.2
        },
        "voiceAuthenticationUseDynamic": false,
        "voiceAuthenticationResponseTimeUseDynamic": false,
        "fraudDetectionUseDynamic": false,
        "fragments": {
          "SetContactData": "39489945-ef88-48ca-b469-f68d2ce7c514"
        }
      },
      "d4b57538-a93e-4dde-9f67-5ec37d0be082": {
        "position": {
          "x": 502.40000000000003,
          "y": 492.8
        },
        "children": [
          "48a13e22-220c-4e91-968e-9d037e95d9d5"
        ],
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
        ],
        "isSplitModule": true
      },
      "48a13e22-220c-4e91-968e-9d037e95d9d5": {
        "position": {
          "x": 502.40000000000003,
          "y": 492.8
        },
        "parameters": {
          "CustomerId": {
            "useDynamic": true
          }
        },
        "dynamicParams": [
          "customerId"
        ],
        "isSplitModule": true
      },
      "e4bfa2fb-cb8e-42ae-b059-75f1651ddada": {
        "position": {
          "x": 2612.8,
          "y": 1520.8000000000002
        }
      },
      "2b31ebec-d3eb-4ec0-9e74-2115e3666ca5": {
        "position": {
          "x": 2053.6,
          "y": 488
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
            "id": "2f864be1-446b-4ffa-aa3f-289f44e7e448",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "City"
          }
        ]
      },
      "3b68f8a9-ed86-4bc6-8d22-fc44bc158b82": {
        "position": {
          "x": 2072,
          "y": 718.4000000000001
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
            "id": "dc25962a-30cb-4b5c-b25c-da6a2fb80f45",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "State"
          }
        ]
      },
      "cd3577dd-a19a-4497-bd7f-2375f6a73575": {
        "position": {
          "x": 2088,
          "y": 949.6
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
            "id": "116e371f-9310-4f29-b90b-37ca81bd35d2",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "ZipCode"
          }
        ]
      },
      "7e27c25b-0418-4963-996e-ae1df8eafc37": {
        "position": {
          "x": 2366.4,
          "y": 1422.4
        }
      },
      "6d88403a-191e-4df2-afcf-774448a7e6f5": {
        "position": {
          "x": 2008,
          "y": 14.4
        },
        "parameters": {
          "LexV2Bot": {
            "AliasArn": {
              "useDynamic": false,
              "useLexBotDropdown": true,
              "lexV2BotName": "GTS-Gold-Customer-Capture-Name-and-Street"
            }
          }
        },
        "useLexBotDropdown": true,
        "lexV2BotName": "GTS-Gold-Customer-Capture-Name-and-Street",
        "conditionMetadata": [
          {
            "id": "79f9a193-fa59-408c-a91a-f7b0252e4527",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "FullName"
          }
        ]
      },
      "87309d44-c3e2-48b9-a375-e7be904be0fb": {
        "position": {
          "x": 2100.8,
          "y": 1208
        }
      },
      "bcb2395f-a6a2-4bce-8d6b-1e6cdbab1d9e": {
        "position": {
          "x": 2030.4,
          "y": 252.8
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
            "id": "84ea2c26-1415-41a3-ab84-773d0aaf76ac",
            "operator": {
              "name": "Equals",
              "value": "Equals",
              "shortDisplay": "="
            },
            "value": "Address"
          }
        ]
      },
      "f0adba4f-d934-4de4-b921-985d98e35320": {
        "position": {
          "x": 2513.6000000000004,
          "y": 524.8000000000001
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
      "39390da8-3d7e-45ca-9f4c-3c0d56231da0": {
        "position": {
          "x": 2522.4,
          "y": 749.6
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
      "174401ce-f4e7-4072-a58f-83d452a8c8a3": {
        "position": {
          "x": 2514.4,
          "y": 982.4000000000001
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
      "407dee4e-cbf3-41bd-9009-f2af92e814a9": {
        "position": {
          "x": 2493.6000000000004,
          "y": 44
        },
        "parameters": {
          "Attributes": {
            "FirstName": {
              "useDynamic": true
            },
            "LastName": {
              "useDynamic": true
            }
          }
        },
        "dynamicParams": [
          "FirstName",
          "LastName"
        ]
      },
      "9e8d9909-ffe6-4a07-9591-0a846d04f140": {
        "position": {
          "x": 2495.2000000000003,
          "y": 276.8
        },
        "parameters": {
          "Attributes": {
            "Address1": {
              "useDynamic": true
            },
            "StreetNumber": {
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
          "SuiteAptNum"
        ]
      },
      "60a695b8-ab42-4999-8b3a-aa989e5526d2": {
        "position": {
          "x": 1362.4,
          "y": 853.6
        },
        "conditionMetadata": [
          {
            "id": "950a48fd-60ec-4efc-9425-a9d3067a0ad3",
            "value": "1"
          },
          {
            "id": "cf98c4c1-ae1a-41e7-89de-6673b251dc28",
            "value": "2"
          },
          {
            "id": "fdd40252-bf4d-4046-b4b5-0a3652b36da6",
            "value": "3"
          },
          {
            "id": "d31f7667-228d-48ac-ac16-ee07da5e5c4f",
            "value": "4"
          },
          {
            "id": "36ae980a-35a5-47af-9536-5a6177e1401b",
            "value": "5"
          }
        ]
      },
      "1c7634ce-0275-465d-997d-d4229523ec79": {
        "position": {
          "x": 4363.2,
          "y": 177.60000000000002
        }
      },
      "fc03b7f4-8445-4708-90bb-cf08b0776204": {
        "position": {
          "x": 4054.4,
          "y": 231.20000000000002
        }
      },
      "d9ae5b12-7478-465c-9498-771c1f6ca167": {
        "position": {
          "x": 4596.8,
          "y": 196.8
        }
      },
      "24fed989-23fc-44c4-b5e6-5302597d47fa": {
        "position": {
          "x": -506.40000000000003,
          "y": 633.6
        }
      },
      "1c7cb582-a3c4-48db-a54c-b4a02a40d151": {
        "position": {
          "x": -461.6,
          "y": 840.8000000000001
        }
      },
      "3cbe23c2-b783-42fe-884b-c03026285f7c": {
        "position": {
          "x": 944,
          "y": 780.8000000000001
        }
      },
      "c9dab541-cd86-4174-88f0-df8c10fa90e9": {
        "position": {
          "x": 3292.8,
          "y": 420.8
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
      "e9f917f4-b2e0-4fbb-bcf2-d7ce9f13536c": {
        "position": {
          "x": 3803.2000000000003,
          "y": 344.8
        }
      },
      "e3aa20dc-c332-4d41-8615-a029f04e36b7": {
        "position": {
          "x": 3542.4,
          "y": 665.6
        }
      },
      "e393df48-6097-4235-bde3-771493757345": {
        "position": {
          "x": 4370.400000000001,
          "y": 373.6
        }
      },
      "c990d88d-7b39-4ab9-b7f0-406499557782": {
        "position": {
          "x": 4333.6,
          "y": -231.20000000000002
        }
      },
      "ba7f044f-1fd3-427e-bf81-3b00a024f6f9": {
        "position": {
          "x": 4945.6,
          "y": 221.60000000000002
        }
      },
      "f393de6c-4854-48eb-b681-1a2f20df62b8": {
        "position": {
          "x": 4903.2,
          "y": -17.6
        }
      },
      "86052bf3-d0ec-43b5-82e5-ad723f1c99cb": {
        "position": {
          "x": 3848,
          "y": 588.8000000000001
        }
      },
      "1ca4e08f-71fb-4632-91cf-ecb39f07fbf2": {
        "position": {
          "x": 3876.8,
          "y": 788.8000000000001
        }
      },
      "6855cadc-d375-4edc-9853-ec3fff49c3f2": {
        "position": {
          "x": 3887.2000000000003,
          "y": 1013.6
        }
      },
      "54dee653-a15d-409f-a83e-bdf465ddb8a8": {
        "position": {
          "x": 5656,
          "y": 185.60000000000002
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
      "da5bb930-05f3-44d2-9b5b-4dcffb8ec62b": {
        "position": {
          "x": 5885.6,
          "y": 188.8
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
          "id": "arn:aws:connect:us-west-2:770688834456:instance/a7952ceb-7e2a-4b8a-bc36-ae21e64d65e9/contact-flow/6c9d48b8-bc86-4c7b-8639-a964f81f2421"
        },
        "customerOrAgent": true
      },
      "00b6bc0a-5bff-45b3-8041-106c19a2ab8e": {
        "position": {
          "x": 5415.200000000001,
          "y": 263.2
        },
        "conditionMetadata": [
          {
            "id": "df0076a9-68a1-4dd1-807e-01fb6629ebeb",
            "value": "1"
          }
        ]
      },
      "36bb70de-14f0-474e-beca-66e3b1058300": {
        "position": {
          "x": 6955.200000000001,
          "y": 217.60000000000002
        }
      },
      "ee3eea08-f0ea-44a7-925e-baa5b0858185": {
        "position": {
          "x": 6477.6,
          "y": 239.20000000000002
        }
      },
      "a1a44d53-0f38-4c43-9948-deba7a3263fb": {
        "position": {
          "x": 6136.8,
          "y": 195.20000000000002
        }
      },
      "a24d8d41-0647-4307-a66f-4e4a02d4d120": {
        "position": {
          "x": 933.6,
          "y": 464.8
        },
        "conditionMetadata": []
      },
      "f7a627b1-1e6a-4810-8a9b-a462ed693c95": {
        "position": {
          "x": 160,
          "y": 584
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
      }
    },
    "name": "GTS-Get-Customer-Profile-Information",
    "description": "",
    "type": "contactFlow",
    "status": "published",
    "hash": {}
  },
  "Actions": [
    {
      "Parameters": {
        "IsVoiceIdStreamingEnabled": "true",
        "IsFraudDetectionEnabled": "true",
        "IsVoiceAuthenticationEnabled": "true",
        "VoiceAuthenticationThreshold": "90",
        "VoiceAuthenticationResponseTime": "10",
        "FraudDetectionThreshold": "50"
      },
      "Identifier": "39489945-ef88-48ca-b469-f68d2ce7c514",
      "Type": "UpdateContactData",
      "Transitions": {
        "NextAction": "a665bea6-d46a-46da-b158-4f223f83fec9",
        "Errors": [
          {
            "NextAction": "f7a627b1-1e6a-4810-8a9b-a462ed693c95",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "a665bea6-d46a-46da-b158-4f223f83fec9",
      "Type": "StartVoiceIdStream",
      "Transitions": {
        "NextAction": "f7a627b1-1e6a-4810-8a9b-a462ed693c95",
        "Errors": [
          {
            "NextAction": "f7a627b1-1e6a-4810-8a9b-a462ed693c95",
            "ErrorType": "NoMatchingError"
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
          "AddressLine2": "$.Customer.Address2"
        }
      },
      "Identifier": "d4b57538-a93e-4dde-9f67-5ec37d0be082",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "48a13e22-220c-4e91-968e-9d037e95d9d5",
        "Errors": [
          {
            "NextAction": "a24d8d41-0647-4307-a66f-4e4a02d4d120",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "CustomerId": "$.Customer.ProfileId"
      },
      "Identifier": "48a13e22-220c-4e91-968e-9d037e95d9d5",
      "Type": "UpdateContactData",
      "Transitions": {
        "NextAction": "a24d8d41-0647-4307-a66f-4e4a02d4d120",
        "Errors": [
          {
            "NextAction": "a24d8d41-0647-4307-a66f-4e4a02d4d120",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "e4bfa2fb-cb8e-42ae-b059-75f1651ddada",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "Text": "Please speak your city.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/787UO3BDCM/EMYIV2MRF8"
        }
      },
      "Identifier": "2b31ebec-d3eb-4ec0-9e74-2115e3666ca5",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
        "Conditions": [
          {
            "NextAction": "f0adba4f-d934-4de4-b921-985d98e35320",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "City"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Please speak your State.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/787UO3BDCM/EMYIV2MRF8"
        }
      },
      "Identifier": "3b68f8a9-ed86-4bc6-8d22-fc44bc158b82",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
        "Conditions": [
          {
            "NextAction": "39390da8-3d7e-45ca-9f4c-3c0d56231da0",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "State"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Please speak your Zip Code.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/787UO3BDCM/EMYIV2MRF8"
        }
      },
      "Identifier": "cd3577dd-a19a-4497-bd7f-2375f6a73575",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
        "Conditions": [
          {
            "NextAction": "174401ce-f4e7-4072-a58f-83d452a8c8a3",
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
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "LoopCount": "2"
      },
      "Identifier": "7e27c25b-0418-4963-996e-ae1df8eafc37",
      "Type": "Loop",
      "Transitions": {
        "NextAction": "e4bfa2fb-cb8e-42ae-b059-75f1651ddada",
        "Conditions": [
          {
            "NextAction": "60a695b8-ab42-4999-8b3a-aa989e5526d2",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "ContinueLooping"
              ]
            }
          },
          {
            "NextAction": "e4bfa2fb-cb8e-42ae-b059-75f1651ddada",
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
        "Text": "Please speak your first and last name.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/ECKPIVL2QA/XRESIYZTJC"
        }
      },
      "Identifier": "6d88403a-191e-4df2-afcf-774448a7e6f5",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
        "Conditions": [
          {
            "NextAction": "407dee4e-cbf3-41bd-9009-f2af92e814a9",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "FullName"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\nYou have not made a valid entry. Please try again.\n</speak>"
      },
      "Identifier": "87309d44-c3e2-48b9-a375-e7be904be0fb",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "7e27c25b-0418-4963-996e-ae1df8eafc37",
        "Errors": [
          {
            "NextAction": "7e27c25b-0418-4963-996e-ae1df8eafc37",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Please speak your full Address. If this address includes an apartment or suite number, please also include that.",
        "LexV2Bot": {
          "AliasArn": "arn:aws:lex:us-west-2:770688834456:bot-alias/MWQK84JZLW/BIQ11JVBHA"
        }
      },
      "Identifier": "bcb2395f-a6a2-4bce-8d6b-1e6cdbab1d9e",
      "Type": "ConnectParticipantWithLexBot",
      "Transitions": {
        "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
        "Conditions": [
          {
            "NextAction": "9e8d9909-ffe6-4a07-9591-0a846d04f140",
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
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
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
      "Identifier": "f0adba4f-d934-4de4-b921-985d98e35320",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
        "Errors": [
          {
            "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
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
      "Identifier": "39390da8-3d7e-45ca-9f4c-3c0d56231da0",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
        "Errors": [
          {
            "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
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
      "Identifier": "174401ce-f4e7-4072-a58f-83d452a8c8a3",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
        "Errors": [
          {
            "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Attributes": {
          "FirstName": "$.Lex.Slots.FirstName",
          "LastName": "$.Lex.Slots.LastName"
        }
      },
      "Identifier": "407dee4e-cbf3-41bd-9009-f2af92e814a9",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
        "Errors": [
          {
            "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
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
      "Identifier": "9e8d9909-ffe6-4a07-9591-0a846d04f140",
      "Type": "UpdateContactAttributes",
      "Transitions": {
        "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
        "Errors": [
          {
            "NextAction": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "StoreInput": "False",
        "InputTimeLimitSeconds": "5",
        "SSML": "<speak>\nIf you would like to add or change the name we have on file for you, please press 1.\nIf you would like to change the address, please press 2.\nIf you would like to change the city, press 3.\nif you would like to change the state, press 4.\nIf you would like to change the Postal code, press 5.\n</speak>"
      },
      "Identifier": "60a695b8-ab42-4999-8b3a-aa989e5526d2",
      "Type": "GetParticipantInput",
      "Transitions": {
        "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
        "Conditions": [
          {
            "NextAction": "6d88403a-191e-4df2-afcf-774448a7e6f5",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "1"
              ]
            }
          },
          {
            "NextAction": "bcb2395f-a6a2-4bce-8d6b-1e6cdbab1d9e",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "2"
              ]
            }
          },
          {
            "NextAction": "2b31ebec-d3eb-4ec0-9e74-2115e3666ca5",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "3"
              ]
            }
          },
          {
            "NextAction": "3b68f8a9-ed86-4bc6-8d22-fc44bc158b82",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "4"
              ]
            }
          },
          {
            "NextAction": "cd3577dd-a19a-4497-bd7f-2375f6a73575",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "5"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "InputTimeLimitExceeded"
          },
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "87309d44-c3e2-48b9-a375-e7be904be0fb",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID not authenticated"
      },
      "Identifier": "1c7634ce-0275-465d-997d-d4229523ec79",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "d9ae5b12-7478-465c-9498-771c1f6ca167",
        "Errors": [
          {
            "NextAction": "d9ae5b12-7478-465c-9498-771c1f6ca167",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "CheckVoiceIdOption": "voiceAuthentication"
      },
      "Identifier": "fc03b7f4-8445-4708-90bb-cf08b0776204",
      "Type": "CheckVoiceId",
      "Transitions": {
        "NextAction": "6855cadc-d375-4edc-9853-ec3fff49c3f2",
        "Conditions": [
          {
            "NextAction": "c990d88d-7b39-4ab9-b7f0-406499557782",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Authenticated"
              ]
            }
          },
          {
            "NextAction": "1c7634ce-0275-465d-997d-d4229523ec79",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "NotAuthenticated"
              ]
            }
          },
          {
            "NextAction": "e393df48-6097-4235-bde3-771493757345",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Inconclusive"
              ]
            }
          },
          {
            "NextAction": "86052bf3-d0ec-43b5-82e5-ad723f1c99cb",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "NotEnrolled"
              ]
            }
          },
          {
            "NextAction": "1ca4e08f-71fb-4632-91cf-ecb39f07fbf2",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "OptedOut"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "6855cadc-d375-4edc-9853-ec3fff49c3f2",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "CheckVoiceIdOption": "fraudDetection"
      },
      "Identifier": "d9ae5b12-7478-465c-9498-771c1f6ca167",
      "Type": "CheckVoiceId",
      "Transitions": {
        "NextAction": "6855cadc-d375-4edc-9853-ec3fff49c3f2",
        "Conditions": [
          {
            "NextAction": "f393de6c-4854-48eb-b681-1a2f20df62b8",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "HighRisk"
              ]
            }
          },
          {
            "NextAction": "ba7f044f-1fd3-427e-bf81-3b00a024f6f9",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "LowRisk"
              ]
            }
          },
          {
            "NextAction": "e393df48-6097-4235-bde3-771493757345",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Inconclusive"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "6855cadc-d375-4edc-9853-ec3fff49c3f2",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "FlowLoggingBehavior": "Enabled"
      },
      "Identifier": "24fed989-23fc-44c4-b5e6-5302597d47fa",
      "Type": "UpdateFlowLoggingBehavior",
      "Transitions": {
        "NextAction": "1c7cb582-a3c4-48db-a54c-b4a02a40d151"
      }
    },
    {
      "Parameters": {
        "Text": "hello."
      },
      "Identifier": "1c7cb582-a3c4-48db-a54c-b4a02a40d151",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "39489945-ef88-48ca-b469-f68d2ce7c514",
        "Errors": [
          {
            "NextAction": "39489945-ef88-48ca-b469-f68d2ce7c514",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "SSML": "<speak>\nWe found no information on your profile. Please add some information.\n</speak>"
      },
      "Identifier": "3cbe23c2-b783-42fe-884b-c03026285f7c",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "60a695b8-ab42-4999-8b3a-aa989e5526d2",
        "Errors": [
          {
            "NextAction": "60a695b8-ab42-4999-8b3a-aa989e5526d2",
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
      "Identifier": "c9dab541-cd86-4174-88f0-df8c10fa90e9",
      "Type": "UpdateCustomerProfile",
      "Transitions": {
        "NextAction": "e3aa20dc-c332-4d41-8615-a029f04e36b7",
        "Errors": [
          {
            "NextAction": "e3aa20dc-c332-4d41-8615-a029f04e36b7",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID Enrolled"
      },
      "Identifier": "e9f917f4-b2e0-4fbb-bcf2-d7ce9f13536c",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "fc03b7f4-8445-4708-90bb-cf08b0776204",
        "Errors": [
          {
            "NextAction": "fc03b7f4-8445-4708-90bb-cf08b0776204",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "CheckVoiceIdOption": "enrollmentStatus"
      },
      "Identifier": "e3aa20dc-c332-4d41-8615-a029f04e36b7",
      "Type": "CheckVoiceId",
      "Transitions": {
        "NextAction": "6855cadc-d375-4edc-9853-ec3fff49c3f2",
        "Conditions": [
          {
            "NextAction": "e9f917f4-b2e0-4fbb-bcf2-d7ce9f13536c",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "Enrolled"
              ]
            }
          },
          {
            "NextAction": "86052bf3-d0ec-43b5-82e5-ad723f1c99cb",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "NotEnrolled"
              ]
            }
          },
          {
            "NextAction": "1ca4e08f-71fb-4632-91cf-ecb39f07fbf2",
            "Condition": {
              "Operator": "Equals",
              "Operands": [
                "OptedOut"
              ]
            }
          }
        ],
        "Errors": [
          {
            "NextAction": "6855cadc-d375-4edc-9853-ec3fff49c3f2",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID inconclusive"
      },
      "Identifier": "e393df48-6097-4235-bde3-771493757345",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
        "Errors": [
          {
            "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID authenticated"
      },
      "Identifier": "c990d88d-7b39-4ab9-b7f0-406499557782",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
        "Errors": [
          {
            "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID low risk"
      },
      "Identifier": "ba7f044f-1fd3-427e-bf81-3b00a024f6f9",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
        "Errors": [
          {
            "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID high risk"
      },
      "Identifier": "f393de6c-4854-48eb-b681-1a2f20df62b8",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
        "Errors": [
          {
            "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID Not Enrolled"
      },
      "Identifier": "86052bf3-d0ec-43b5-82e5-ad723f1c99cb",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
        "Errors": [
          {
            "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID Opted Out"
      },
      "Identifier": "1ca4e08f-71fb-4632-91cf-ecb39f07fbf2",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
        "Errors": [
          {
            "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "Text": "Voice ID error"
      },
      "Identifier": "6855cadc-d375-4edc-9853-ec3fff49c3f2",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
        "Errors": [
          {
            "NextAction": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "QueueId": "arn:aws:connect:us-west-2:770688834456:instance/a7952ceb-7e2a-4b8a-bc36-ae21e64d65e9/queue/cef7eabd-76d9-445b-84ae-dc24075e15fa"
      },
      "Identifier": "54dee653-a15d-409f-a83e-bdf465ddb8a8",
      "Type": "UpdateContactTargetQueue",
      "Transitions": {
        "NextAction": "da5bb930-05f3-44d2-9b5b-4dcffb8ec62b",
        "Errors": [
          {
            "NextAction": "da5bb930-05f3-44d2-9b5b-4dcffb8ec62b",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "EventHooks": {
          "CustomerQueue": "arn:aws:connect:us-west-2:770688834456:instance/a7952ceb-7e2a-4b8a-bc36-ae21e64d65e9/contact-flow/6c9d48b8-bc86-4c7b-8639-a964f81f2421"
        }
      },
      "Identifier": "da5bb930-05f3-44d2-9b5b-4dcffb8ec62b",
      "Type": "UpdateContactEventHooks",
      "Transitions": {
        "NextAction": "a1a44d53-0f38-4c43-9948-deba7a3263fb",
        "Errors": [
          {
            "NextAction": "a1a44d53-0f38-4c43-9948-deba7a3263fb",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "StoreInput": "False",
        "InputTimeLimitSeconds": "5",
        "SSML": "<speak>\nIf you would like to enroll in voice ID, please press 1.\n</speak>"
      },
      "Identifier": "00b6bc0a-5bff-45b3-8041-106c19a2ab8e",
      "Type": "GetParticipantInput",
      "Transitions": {
        "NextAction": "ee3eea08-f0ea-44a7-925e-baa5b0858185",
        "Conditions": [
          {
            "NextAction": "54dee653-a15d-409f-a83e-bdf465ddb8a8",
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
            "NextAction": "ee3eea08-f0ea-44a7-925e-baa5b0858185",
            "ErrorType": "InputTimeLimitExceeded"
          },
          {
            "NextAction": "ee3eea08-f0ea-44a7-925e-baa5b0858185",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "ee3eea08-f0ea-44a7-925e-baa5b0858185",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "36bb70de-14f0-474e-beca-66e3b1058300",
      "Type": "DisconnectParticipant",
      "Transitions": {}
    },
    {
      "Parameters": {
        "SSML": "<speak>\nThank you for calling. This test is now finished. The final values are as follows.\n\nThe first name we have on file for your profile is $.Attributes.FirstName,\nThe last name is $.Attributes.LastName,\nThe first address line is $.Attributes.AddressLine1,\nThe second address line is $.Attributes.AddressLine2,\nThe city is $.Attributes.City,\nThe state is $.Attributes.State,\nThe Postal code is $.Attributes.PostalCode.\n\nGoodbye!\n</speak>"
      },
      "Identifier": "ee3eea08-f0ea-44a7-925e-baa5b0858185",
      "Type": "MessageParticipant",
      "Transitions": {
        "NextAction": "36bb70de-14f0-474e-beca-66e3b1058300",
        "Errors": [
          {
            "NextAction": "36bb70de-14f0-474e-beca-66e3b1058300",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {},
      "Identifier": "a1a44d53-0f38-4c43-9948-deba7a3263fb",
      "Type": "TransferContactToQueue",
      "Transitions": {
        "NextAction": "ee3eea08-f0ea-44a7-925e-baa5b0858185",
        "Errors": [
          {
            "NextAction": "ee3eea08-f0ea-44a7-925e-baa5b0858185",
            "ErrorType": "QueueAtCapacity"
          },
          {
            "NextAction": "ee3eea08-f0ea-44a7-925e-baa5b0858185",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "StoreInput": "False",
        "InputTimeLimitSeconds": "1",
        "SSML": "<speak>\nHello, thank you for calling. This is a test for customer profiles. I will now read off your information. Please press 1 if you would like to skip this step.\n\nThe first name we have on file for your profile is $.Attributes.FirstName,\nThe last name is $.Attributes.LastName,\nThe address is $.Attributes.AddressLine1, number $.Attributes.AddressLine2\nThe city is $.Attributes.City,\nThe state is $.Attributes.State,\nThe Postal code is <say-as interpret-as=\"digits\">$.Attributes.PostalCode</say-as>.\n</speak>"
      },
      "Identifier": "a24d8d41-0647-4307-a66f-4e4a02d4d120",
      "Type": "GetParticipantInput",
      "Transitions": {
        "NextAction": "60a695b8-ab42-4999-8b3a-aa989e5526d2",
        "Errors": [
          {
            "NextAction": "60a695b8-ab42-4999-8b3a-aa989e5526d2",
            "ErrorType": "InputTimeLimitExceeded"
          },
          {
            "NextAction": "60a695b8-ab42-4999-8b3a-aa989e5526d2",
            "ErrorType": "NoMatchingCondition"
          },
          {
            "NextAction": "60a695b8-ab42-4999-8b3a-aa989e5526d2",
            "ErrorType": "NoMatchingError"
          }
        ]
      }
    },
    {
      "Parameters": {
        "ProfileRequestData": {
          "PhoneNumber": "$.CustomerEndpoint.Address"
        },
        "ProfileResponseData": [
          "FirstName",
          "LastName",
          "EmailAddress",
          "PhoneNumber",
          "AccountNumber",
          "Address1",
          "Address2",
          "City",
          "Country",
          "PostalCode",
          "State"
        ]
      },
      "Identifier": "f7a627b1-1e6a-4810-8a9b-a462ed693c95",
      "Type": "GetCustomerProfile",
      "Transitions": {
        "NextAction": "d4b57538-a93e-4dde-9f67-5ec37d0be082",
        "Errors": [
          {
            "NextAction": "3cbe23c2-b783-42fe-884b-c03026285f7c",
            "ErrorType": "NoMatchingError"
          },
          {
            "NextAction": "d4b57538-a93e-4dde-9f67-5ec37d0be082",
            "ErrorType": "MultipleFoundError"
          },
          {
            "NextAction": "3cbe23c2-b783-42fe-884b-c03026285f7c",
            "ErrorType": "NoneFoundError"
          }
        ]
      }
    }
  ]
}
    JSON

  tags = {
    "Name"        = "Example Contact Flow Module",
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}
