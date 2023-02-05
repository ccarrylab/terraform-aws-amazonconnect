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
  instance_id = local.instance_id
  name        = "test"
  description = "Test Contact Flow Description"
  type        = "CONTACT_FLOW"
  content     = <<JSON
    {
    "AWSTemplateFormatVersion": "2010-09-09",
    "Description": "Connect Contact Flows",
    "Resources": {
        "SampleHoursOfOperationHoursOfOperation": {
            "Type": "AWS:Connect:HoursOfOperation",
            "Properties": {
                "Config": [
                    {
                        "Day": "TUESDAY",
                        "StartTime": {
                            "Hours": 9,
                            "Minutes": 0
                        },
                        "EndTime": {
                            "Hours": 17,
                            "Minutes": 0
                        }
                    },
                    {
                        "Day": "MONDAY",
                        "StartTime": {
                            "Hours": 9,
                            "Minutes": 0
                        },
                        "EndTime": {
                            "Hours": 17,
                            "Minutes": 0
                        }
                    },
                    {
                        "Day": "FRIDAY",
                        "StartTime": {
                            "Hours": 9,
                            "Minutes": 0
                        },
                        "EndTime": {
                            "Hours": 17,
                            "Minutes": 0
                        }
                    },
                    {
                        "Day": "THURSDAY",
                        "StartTime": {
                            "Hours": 9,
                            "Minutes": 0
                        },
                        "EndTime": {
                            "Hours": 17,
                            "Minutes": 0
                        }
                    },
                    {
                        "Day": "WEDNESDAY",
                        "StartTime": {
                            "Hours": 9,
                            "Minutes": 0
                        },
                        "EndTime": {
                            "Hours": 17,
                            "Minutes": 0
                        }
                    },
                    {
                        "Day": "SATURDAY",
                        "StartTime": {
                            "Hours": 9,
                            "Minutes": 0
                        },
                        "EndTime": {
                            "Hours": 17,
                            "Minutes": 0
                        }
                    },
                    {
                        "Day": "SUNDAY",
                        "StartTime": {
                            "Hours": 9,
                            "Minutes": 0
                        },
                        "EndTime": {
                            "Hours": 17,
                            "Minutes": 0
                        }
                    }
                ],
                "TimeZone": "US/Eastern",
                "InstanceArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}"
                },
                "Name": "Sample_Hours_Of_Operation"
            }
        },
        "SampleCallback": {
            "Type": "AWS:Connect:ContactFlow",
            "Properties": {
                "Type": "CUSTOMER_QUEUE",
                "State": "ACTIVE",
                "Content": {
                    "Fn:Sub": [
                        "{\"Version\":\"2019-10-30\",\"StartAction\":\"1b40bdee-1cc2-40ea-ad74-01e00b12e108\",\"Metadata\":{\"entryPointPosition\":{\"x\":69,\"y\":97},\"snapToGrid\":false,\"ActionMetadata\":{\"1b40bdee-1cc2-40ea-ad74-01e00b12e108\":{\"position\":{\"x\":219,\"y\":121},\"audio\":[{\"id\":\"arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}/prompt/d4c2c510-43bc-426c-aa7d-df24f0519399\",\"text\":\"CustomerQueue.wav\",\"type\":\"Prompt\"}],\"timeoutUnit\":{\"display\":\"Seconds\",\"value\":\"sec\"}},\"f6ea029e-aaee-418f-b65d-faf2a5594000\":{\"position\":{\"x\":786,\"y\":519}},\"bb25d7fc-cd15-44b6-8427-0e6e0d0358dc\":{\"position\":{\"x\":956,\"y\":33}},\"96f7b261-2bf0-407e-bd5b-346e244eb9a1\":{\"position\":{\"x\":462,\"y\":67},\"conditionMetadata\":[{\"id\":\"ee50bdd3-b987-4798-a21d-914bd3a71d6c\",\"value\":\"1\"},{\"id\":\"ce21df6a-b29d-46ef-a10c-d343819498c0\",\"value\":\"2\"}],\"useDynamic\":false,\"useDynamicLexBotArn\":false},\"ba9f1975-964d-4113-aa61-329f5227fe21\":{\"position\":{\"x\":1047,\"y\":324},\"useDynamic\":false},\"2ff07095-d5f5-48e8-9162-908eb7f1fb27\":{\"position\":{\"x\":712,\"y\":42},\"useDynamic\":false,\"useDynamicForEncryptionKeys\":true,\"useDynamicForTerminatorDigits\":false,\"countryCodePrefix\":\"+1\"},\"5551df8f-cd35-4160-8ab4-b5d8b4a396c2\":{\"position\":{\"x\":1650,\"y\":130}},\"5a0bb403-5cae-4867-bb3d-f119b9a6c81a\":{\"position\":{\"x\":1316,\"y\":311},\"useDynamic\":false},\"ff2c225e-0f66-4a87-bbd6-61746818db49\":{\"position\":{\"x\":1183,\"y\":55},\"useDynamic\":false},\"d82a6199-9105-4783-bc41-0bb9792b0c99\":{\"position\":{\"x\":1402,\"y\":27},\"useDynamic\":false}}},\"Actions\":[{\"Identifier\":\"1b40bdee-1cc2-40ea-ad74-01e00b12e108\",\"Parameters\":{\"InterruptFrequencySeconds\":\"30\",\"Messages\":[{\"PromptId\":\"arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}/prompt/d4c2c510-43bc-426c-aa7d-df24f0519399\"}]},\"Transitions\":{\"Errors\":[],\"Conditions\":[{\"NextAction\":\"96f7b261-2bf0-407e-bd5b-346e244eb9a1\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"MessagesInterrupted\"]}}]},\"Type\":\"MessageParticipantIteratively\"},{\"Identifier\":\"f6ea029e-aaee-418f-b65d-faf2a5594000\",\"Parameters\":{},\"Transitions\":{},\"Type\":\"EndFlowExecution\"},{\"Identifier\":\"bb25d7fc-cd15-44b6-8427-0e6e0d0358dc\",\"Parameters\":{\"CallbackNumber\":\"$.StoredCustomerInput\"},\"Transitions\":{\"NextAction\":\"ff2c225e-0f66-4a87-bbd6-61746818db49\",\"Errors\":[{\"NextAction\":\"ba9f1975-964d-4113-aa61-329f5227fe21\",\"ErrorType\":\"InvalidCallbackNumber\"},{\"NextAction\":\"ba9f1975-964d-4113-aa61-329f5227fe21\",\"ErrorType\":\"CallbackNumberNotDialable\"}],\"Conditions\":[]},\"Type\":\"UpdateContactCallbackNumber\"},{\"Identifier\":\"96f7b261-2bf0-407e-bd5b-346e244eb9a1\",\"Parameters\":{\"Text\":\"Press 1 if you want to receieve a callback when an agent is available. Press 2 to remain in queue\",\"StoreInput\":\"False\",\"InputTimeLimitSeconds\":\"5\"},\"Transitions\":{\"NextAction\":\"f6ea029e-aaee-418f-b65d-faf2a5594000\",\"Errors\":[{\"NextAction\":\"f6ea029e-aaee-418f-b65d-faf2a5594000\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"f6ea029e-aaee-418f-b65d-faf2a5594000\",\"ErrorType\":\"NoMatchingCondition\"},{\"NextAction\":\"f6ea029e-aaee-418f-b65d-faf2a5594000\",\"ErrorType\":\"InputTimeLimitExceeded\"}],\"Conditions\":[{\"NextAction\":\"2ff07095-d5f5-48e8-9162-908eb7f1fb27\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"1\"]}},{\"NextAction\":\"f6ea029e-aaee-418f-b65d-faf2a5594000\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"2\"]}}]},\"Type\":\"GetParticipantInput\"},{\"Identifier\":\"ba9f1975-964d-4113-aa61-329f5227fe21\",\"Parameters\":{\"Text\":\"The number entered is invalid. Please try again.\"},\"Transitions\":{\"NextAction\":\"2ff07095-d5f5-48e8-9162-908eb7f1fb27\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"2ff07095-d5f5-48e8-9162-908eb7f1fb27\",\"Parameters\":{\"Text\":\"Enter the number you would like to be called back at.\",\"StoreInput\":\"True\",\"InputTimeLimitSeconds\":\"5\",\"InputValidation\":{\"PhoneNumberValidation\":{\"NumberFormat\":\"Local\",\"CountryCode\":\"US\"}}},\"Transitions\":{\"NextAction\":\"bb25d7fc-cd15-44b6-8427-0e6e0d0358dc\",\"Errors\":[{\"NextAction\":\"ba9f1975-964d-4113-aa61-329f5227fe21\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"ba9f1975-964d-4113-aa61-329f5227fe21\",\"ErrorType\":\"InvalidPhoneNumber\"}],\"Conditions\":[]},\"Type\":\"GetParticipantInput\"},{\"Identifier\":\"5551df8f-cd35-4160-8ab4-b5d8b4a396c2\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"5a0bb403-5cae-4867-bb3d-f119b9a6c81a\",\"Parameters\":{\"Text\":\"Something went wrong. Goodbye.\"},\"Transitions\":{\"NextAction\":\"5551df8f-cd35-4160-8ab4-b5d8b4a396c2\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"ff2c225e-0f66-4a87-bbd6-61746818db49\",\"Parameters\":{\"Text\":\"You will be called back when the next agent is available.\"},\"Transitions\":{\"NextAction\":\"d82a6199-9105-4783-bc41-0bb9792b0c99\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"d82a6199-9105-4783-bc41-0bb9792b0c99\",\"Parameters\":{\"InitialCallDelaySeconds\":\"5\",\"MaximumConnectionAttempts\":\"1\",\"RetryDelaySeconds\":\"600\"},\"Transitions\":{\"NextAction\":\"5551df8f-cd35-4160-8ab4-b5d8b4a396c2\",\"Errors\":[{\"NextAction\":\"5a0bb403-5cae-4867-bb3d-f119b9a6c81a\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"CreateCallbackContact\"}]}",
                        {}
                    ]
                },
                "InstanceArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}"
                },
                "Name": "Sample_Callback"
            }
        },
        "SampleMainFlow": {
            "Type": "AWS:Connect:ContactFlow",
            "Properties": {
                "Type": "CONTACT_FLOW",
                "State": "ACTIVE",
                "Content": {
                    "Fn:Sub": [
                        "{\"Version\":\"2019-10-30\",\"StartAction\":\"7ab9adef-6544-42e7-b30c-df864491427a\",\"Metadata\":{\"entryPointPosition\":{\"x\":15,\"y\":15},\"snapToGrid\":false,\"ActionMetadata\":{\"f3dbf4f0-7db4-4420-ac1a-b94409ef4a6c\":{\"position\":{\"x\":1910,\"y\":684}},\"88f853c6-b9ed-4e9a-bf7d-8e68d2684156\":{\"position\":{\"x\":2257,\"y\":208},\"dynamicMetadata\":{\"phoneNumber\":true},\"useDynamic\":false},\"7ab9adef-6544-42e7-b30c-df864491427a\":{\"position\":{\"x\":172,\"y\":16},\"useDynamic\":false,\"contactFlowModuleName\":\"Sample_Initialize\"},\"f716c389-9469-415b-8f42-b8592ea67764\":{\"position\":{\"x\":40,\"y\":235},\"useDynamic\":false,\"contactFlowModuleName\":\"Sample_Error\"},\"12054ac8-b6b5-47cb-b32e-05e652c013ea\":{\"position\":{\"x\":33,\"y\":512}},\"ef8debc7-8b16-4f03-9107-d4115cc744a4\":{\"position\":{\"x\":2235,\"y\":781},\"useDynamic\":false},\"005c15b3-fba4-4fbb-8baa-4487104aaf60\":{\"position\":{\"x\":1882,\"y\":205},\"useDynamic\":false,\"contactFlowModuleName\":\"Sample_GetPhoneNumber\"},\"5e9c1698-e5c4-435e-aaf3-49e454f5925f\":{\"position\":{\"x\":1567,\"y\":279},\"conditionMetadata\":[{\"id\":\"6d3c810a-0887-4068-93e4-547745dd1585\",\"value\":\"Yes\"},{\"id\":\"1a5a7143-d19e-4b39-b663-31d80635571b\",\"value\":\"No\"}],\"useDynamic\":false,\"dynamicMetadata\":{},\"useLexBotDropdown\":true,\"useDynamicLexBotArn\":false,\"lexV2BotName\":\"Sample_YesNoBot\",\"lexV2BotAliasName\":\"prod\"},\"e39cd691-c10c-44d5-b26c-248b90c1517d\":{\"position\":{\"x\":1377,\"y\":501}},\"64d3d31d-1afa-4a60-a5bf-7482d628ee1f\":{\"position\":{\"x\":1985,\"y\":457},\"useDynamic\":false,\"contactFlowModuleName\":\"Sample_TransferToAgent\"},\"9e6684b9-28cc-4015-872f-101f30984ce6\":{\"position\":{\"x\":1473,\"y\":22},\"useDynamic\":true},\"b427faef-0b3f-4137-882c-480f05b1d4f1\":{\"position\":{\"x\":1304,\"y\":940},\"useDynamic\":false,\"contactFlowModuleName\":\"Sample_TransferToAgent\"},\"c9146594-4d82-4c7e-bf61-1f21f618bcf5\":{\"position\":{\"x\":261,\"y\":278},\"conditionMetadata\":[{\"operator\":{\"name\":\"Equals\",\"value\":\"Equals\",\"shortDisplay\":\"=\"},\"value\":\"error\",\"id\":\"10227c72-cbe9-47ef-a445-8dba047c22a4\"}]},\"0ee54b95-a082-4a90-b328-24dce51af068\":{\"position\":{\"x\":1575,\"y\":642},\"useDynamic\":false},\"d614d1c4-9b09-4b76-a4ee-e910952f13f4\":{\"position\":{\"x\":661,\"y\":37},\"useDynamic\":false},\"9f7d0545-1a77-44a3-a87b-0dadfbc6c4e2\":{\"position\":{\"x\":1163,\"y\":29},\"conditionMetadata\":[{\"operator\":{\"name\":\"Equals\",\"value\":\"Equals\",\"shortDisplay\":\"=\"},\"value\":\"error\",\"id\":\"d7ca8e84-6a8d-4bb9-a85b-2d19fb6579af\"},{\"operator\":{\"name\":\"Equals\",\"value\":\"Equals\",\"shortDisplay\":\"=\"},\"value\":\"Representative\",\"id\":\"0f6d0a4e-933a-456f-a2f0-aab2f51e2cba\"}]},\"ddf6abc2-16bf-4ad6-b652-6a45b442d74b\":{\"position\":{\"x\":1173,\"y\":478},\"useDynamic\":false,\"contactFlowModuleName\":\"Sample_Error\"},\"4a540ae6-076e-4f0e-9db7-4caeaee4c701\":{\"position\":{\"x\":654,\"y\":211},\"dynamicParams\":[]},\"57dfebf8-f157-42d1-8b48-dac464335b67\":{\"position\":{\"x\":616,\"y\":430},\"dynamicParams\":[]},\"91078c04-dde8-4617-ad54-7e4ac1e32a75\":{\"position\":{\"x\":918,\"y\":51},\"useDynamic\":false,\"contactFlowModuleName\":\"Sample_GetService\"}}},\"Actions\":[{\"Identifier\":\"f3dbf4f0-7db4-4420-ac1a-b94409ef4a6c\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"88f853c6-b9ed-4e9a-bf7d-8e68d2684156\",\"Parameters\":{\"LambdaFunctionARN\":\"arn:$${AWS:Partition}:lambda:$${AWS:Region}:$${AWS:AccountId}:function:Sample_SendSMS\",\"InvocationTimeLimitSeconds\":\"3\",\"LambdaInvocationAttributes\":{\"phoneNumber\":\"$.Attributes.phoneNumber\"}},\"Transitions\":{\"NextAction\":\"ef8debc7-8b16-4f03-9107-d4115cc744a4\",\"Errors\":[{\"NextAction\":\"0ee54b95-a082-4a90-b328-24dce51af068\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeLambdaFunction\"},{\"Identifier\":\"7ab9adef-6544-42e7-b30c-df864491427a\",\"Parameters\":{\"FlowModuleId\":\"$${SampleInitializeModule}\"},\"Transitions\":{\"NextAction\":\"c9146594-4d82-4c7e-bf61-1f21f618bcf5\",\"Errors\":[{\"NextAction\":\"f716c389-9469-415b-8f42-b8592ea67764\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeFlowModule\"},{\"Identifier\":\"f716c389-9469-415b-8f42-b8592ea67764\",\"Parameters\":{\"FlowModuleId\":\"$${SampleErrorModule}\"},\"Transitions\":{\"NextAction\":\"12054ac8-b6b5-47cb-b32e-05e652c013ea\",\"Errors\":[{\"NextAction\":\"12054ac8-b6b5-47cb-b32e-05e652c013ea\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeFlowModule\"},{\"Identifier\":\"12054ac8-b6b5-47cb-b32e-05e652c013ea\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"ef8debc7-8b16-4f03-9107-d4115cc744a4\",\"Parameters\":{\"Text\":\"You can either ask another question or hang up if you require no further assistance.\"},\"Transitions\":{\"NextAction\":\"57dfebf8-f157-42d1-8b48-dac464335b67\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"005c15b3-fba4-4fbb-8baa-4487104aaf60\",\"Parameters\":{\"FlowModuleId\":\"$${SampleGetPhoneNumberModule}\"},\"Transitions\":{\"NextAction\":\"88f853c6-b9ed-4e9a-bf7d-8e68d2684156\",\"Errors\":[{\"NextAction\":\"0ee54b95-a082-4a90-b328-24dce51af068\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeFlowModule\"},{\"Identifier\":\"5e9c1698-e5c4-435e-aaf3-49e454f5925f\",\"Parameters\":{\"Text\":\"Would you like for me to send you a link with more information via text?\",\"LexV2Bot\":{\"AliasArn\":\"arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/RV05CVNUFP/GR8LWG3KQS\"}},\"Transitions\":{\"NextAction\":\"0ee54b95-a082-4a90-b328-24dce51af068\",\"Errors\":[{\"NextAction\":\"0ee54b95-a082-4a90-b328-24dce51af068\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"64d3d31d-1afa-4a60-a5bf-7482d628ee1f\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"005c15b3-fba4-4fbb-8baa-4487104aaf60\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Yes\"]}},{\"NextAction\":\"64d3d31d-1afa-4a60-a5bf-7482d628ee1f\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"No\"]}}]},\"Type\":\"ConnectParticipantWithLexBot\"},{\"Identifier\":\"e39cd691-c10c-44d5-b26c-248b90c1517d\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"64d3d31d-1afa-4a60-a5bf-7482d628ee1f\",\"Parameters\":{\"FlowModuleId\":\"$${SampleTransferToAgentModule}\"},\"Transitions\":{\"NextAction\":\"f3dbf4f0-7db4-4420-ac1a-b94409ef4a6c\",\"Errors\":[{\"NextAction\":\"f3dbf4f0-7db4-4420-ac1a-b94409ef4a6c\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeFlowModule\"},{\"Identifier\":\"9e6684b9-28cc-4015-872f-101f30984ce6\",\"Parameters\":{\"Text\":\"$.Attributes.promptText\"},\"Transitions\":{\"NextAction\":\"5e9c1698-e5c4-435e-aaf3-49e454f5925f\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"b427faef-0b3f-4137-882c-480f05b1d4f1\",\"Parameters\":{\"FlowModuleId\":\"$${SampleTransferToAgentModule}\"},\"Transitions\":{\"NextAction\":\"ef8debc7-8b16-4f03-9107-d4115cc744a4\",\"Errors\":[{\"NextAction\":\"0ee54b95-a082-4a90-b328-24dce51af068\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeFlowModule\"},{\"Identifier\":\"c9146594-4d82-4c7e-bf61-1f21f618bcf5\",\"Parameters\":{\"ComparisonValue\":\"$.Attributes.status\"},\"Transitions\":{\"NextAction\":\"d614d1c4-9b09-4b76-a4ee-e910952f13f4\",\"Errors\":[{\"NextAction\":\"d614d1c4-9b09-4b76-a4ee-e910952f13f4\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"f716c389-9469-415b-8f42-b8592ea67764\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"error\"]}}]},\"Type\":\"Compare\"},{\"Identifier\":\"0ee54b95-a082-4a90-b328-24dce51af068\",\"Parameters\":{\"Text\":\"We are currently experiencing technical difficulties.  Please try again later.\"},\"Transitions\":{\"NextAction\":\"f3dbf4f0-7db4-4420-ac1a-b94409ef4a6c\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"d614d1c4-9b09-4b76-a4ee-e910952f13f4\",\"Parameters\":{\"Text\":\"$.Attributes.promptWelcome\"},\"Transitions\":{\"NextAction\":\"4a540ae6-076e-4f0e-9db7-4caeaee4c701\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"9f7d0545-1a77-44a3-a87b-0dadfbc6c4e2\",\"Parameters\":{\"ComparisonValue\":\"$.Attributes.status\"},\"Transitions\":{\"NextAction\":\"9e6684b9-28cc-4015-872f-101f30984ce6\",\"Errors\":[{\"NextAction\":\"9e6684b9-28cc-4015-872f-101f30984ce6\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"ddf6abc2-16bf-4ad6-b652-6a45b442d74b\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"error\"]}},{\"NextAction\":\"64d3d31d-1afa-4a60-a5bf-7482d628ee1f\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Representative\"]}}]},\"Type\":\"Compare\"},{\"Identifier\":\"ddf6abc2-16bf-4ad6-b652-6a45b442d74b\",\"Parameters\":{\"FlowModuleId\":\"$${SampleErrorModule}\"},\"Transitions\":{\"NextAction\":\"e39cd691-c10c-44d5-b26c-248b90c1517d\",\"Errors\":[{\"NextAction\":\"e39cd691-c10c-44d5-b26c-248b90c1517d\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeFlowModule\"},{\"Identifier\":\"4a540ae6-076e-4f0e-9db7-4caeaee4c701\",\"Parameters\":{\"Attributes\":{\"initialLexPrompt\":\"$.Attributes.promptServiceChoices1\"}},\"Transitions\":{\"NextAction\":\"91078c04-dde8-4617-ad54-7e4ac1e32a75\",\"Errors\":[{\"NextAction\":\"0ee54b95-a082-4a90-b328-24dce51af068\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"57dfebf8-f157-42d1-8b48-dac464335b67\",\"Parameters\":{\"Attributes\":{\"initialLexPrompt\":\"$.Attributes.promptServiceChoices2\"}},\"Transitions\":{\"NextAction\":\"91078c04-dde8-4617-ad54-7e4ac1e32a75\",\"Errors\":[{\"NextAction\":\"0ee54b95-a082-4a90-b328-24dce51af068\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"91078c04-dde8-4617-ad54-7e4ac1e32a75\",\"Parameters\":{\"FlowModuleId\":\"$${SampleGetServiceModule}\"},\"Transitions\":{\"NextAction\":\"9f7d0545-1a77-44a3-a87b-0dadfbc6c4e2\",\"Errors\":[{\"NextAction\":\"ddf6abc2-16bf-4ad6-b652-6a45b442d74b\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeFlowModule\"}]}",
                        {}
                    ]
                },
                "InstanceArn": {
                    "Fn::Sub": "arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}"
                },
                "Name": "Sample_Main_Flow"
            }
        },
        "SampleSendSMSLambdaPermission": {
            "Type": "Custom:ConnectAssociateLambda",
            "Properties": {
                "InstanceId": {
                    "Ref": "ConnectInstanceID"
                },
                "FunctionArn": {
                    "Fn::Sub": "arn:$${AWS:Partition}:lambda:$${AWS:Region}:$${AWS::AccountId}:function:Sample_SendSMS"
                },
                "ServiceToken": {
                    "Fn:ImportValue": "CFNConnectAssociateLambda"
                }
            }
        },
        "SampleYesNoBotLexPermission": {
            "Type": "Custom:ConnectAssociateLex",
            "Properties": {
                "InstanceId": {
                    "Ref": "ConnectInstanceID"
                },
                "AliasArn": {
                    "Fn::Sub": "arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/RV05CVNUFP/GR8LWG3KQS"
                },
                "ServiceToken": {
                    "Fn:ImportValue": "CFNConnectAssociateLexV2Bot"
                }
            }
        },
        "SampleErrorModule": {
            "Type": "AWS:Connect:ContactFlowModule",
            "Properties": {
                "State": "ACTIVE",
                "Content": {
                    "Fn:Sub": [
                        "{\"Version\":\"2019-10-30\",\"StartAction\":\"5cf6b2df-4c47-4055-811a-3117167f0f87\",\"Metadata\":{\"entryPointPosition\":{\"x\":20,\"y\":20},\"snapToGrid\":false,\"ActionMetadata\":{\"5cf6b2df-4c47-4055-811a-3117167f0f87\":{\"position\":{\"x\":194,\"y\":18},\"useDynamic\":false},\"0c6e41bf-684a-4478-9647-b196ea51e762\":{\"position\":{\"x\":445,\"y\":61}}}},\"Actions\":[{\"Identifier\":\"5cf6b2df-4c47-4055-811a-3117167f0f87\",\"Parameters\":{\"Text\":\"We are currently experiencing technical difficulties.  Please call again later.\"},\"Transitions\":{\"NextAction\":\"0c6e41bf-684a-4478-9647-b196ea51e762\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"0c6e41bf-684a-4478-9647-b196ea51e762\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}}],\"Settings\":{\"InputParameters\":[],\"OutputParameters\":[],\"Transitions\":[{\"DisplayName\":\"Success\",\"ReferenceName\":\"Success\",\"Description\":\"\"},{\"DisplayName\":\"Error\",\"ReferenceName\":\"Error\",\"Description\":\"\"}]}}",
                        {}
                    ]
                },
                "InstanceArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}"
                },
                "Name": "Sample_Error"
            }
        },
        "SampleGetPhoneNumberModule": {
            "Type": "AWS:Connect:ContactFlowModule",
            "Properties": {
                "State": "ACTIVE",
                "Content": {
                    "Fn:Sub": [
                        "{\"Version\":\"2019-10-30\",\"StartAction\":\"fc1c29f3-e585-412a-9527-e488d2f4734b\",\"Metadata\":{\"entryPointPosition\":{\"x\":15,\"y\":17},\"snapToGrid\":false,\"ActionMetadata\":{\"79fd99eb-86aa-4d51-ae98-0e18b00c3b16\":{\"position\":{\"x\":1057,\"y\":569}},\"e9401503-2125-4019-903d-95d341e0f024\":{\"position\":{\"x\":1118,\"y\":137}},\"a64c8bc8-8b8a-4009-b8fd-32914414f704\":{\"position\":{\"x\":510,\"y\":20},\"dynamicParams\":[\"phoneNumber\"]},\"3fca6886-a1fc-4957-9d63-22c96a917818\":{\"position\":{\"x\":811,\"y\":24},\"useDynamic\":false},\"7a28c503-1929-4851-bdd8-c3de9ac0e36b\":{\"position\":{\"x\":778,\"y\":271},\"dynamicParams\":[\"phoneNumber\"]},\"aa757608-1b34-4f01-8a02-84f2c2166d1e\":{\"position\":{\"x\":781,\"y\":641},\"useDynamic\":false},\"fc1c29f3-e585-412a-9527-e488d2f4734b\":{\"position\":{\"x\":233,\"y\":15},\"conditionMetadata\":[{\"id\":\"26417a5b-6f80-46df-9cde-a2364c1a5076\",\"value\":\"Yes\"},{\"id\":\"9e5812b9-5c84-431a-be1a-3f6278c1be03\",\"value\":\"No\"}],\"useDynamic\":false,\"dynamicMetadata\":{},\"useLexBotDropdown\":true,\"useDynamicLexBotArn\":false,\"lexV2BotName\":\"Sample_YesNoBot\",\"lexV2BotAliasName\":\"prod\"},\"1ad512e6-1887-4159-98bc-5673bfb73d60\":{\"position\":{\"x\":202,\"y\":402},\"conditionMetadata\":[{\"id\":\"1a809bd3-2d95-4ad9-96d1-8e1c9defd522\",\"value\":\"Yes\"},{\"id\":\"64a95f73-122e-41fc-9455-4df2d2806e00\",\"value\":\"No\"}],\"useDynamic\":false,\"dynamicMetadata\":{},\"useLexBotDropdown\":true,\"useDynamicLexBotArn\":false,\"lexV2BotName\":\"Sample_YesNoBot\",\"lexV2BotAliasName\":\"prod\"},\"c7b02211-4018-4c4d-acee-9aad8627dffe\":{\"position\":{\"x\":544,\"y\":274},\"conditionMetadata\":[{\"id\":\"a42972fd-6668-4cba-b027-93fa658365df\",\"value\":\"PhoneNumber\"}],\"useDynamic\":false,\"dynamicMetadata\":{\"x-amz-lex:dtmf:max-length\":false},\"useLexBotDropdown\":true,\"useDynamicLexBotArn\":false,\"lexV2BotName\":\"Sample_PhoneNumber\",\"lexV2BotAliasName\":\"prod\"}}},\"Actions\":[{\"Identifier\":\"79fd99eb-86aa-4d51-ae98-0e18b00c3b16\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"e9401503-2125-4019-903d-95d341e0f024\",\"Parameters\":{},\"Transitions\":{},\"Type\":\"EndFlowModuleExecution\"},{\"Identifier\":\"a64c8bc8-8b8a-4009-b8fd-32914414f704\",\"Parameters\":{\"Attributes\":{\"phoneNumber\":\"$.CustomerEndpoint.Address\"}},\"Transitions\":{\"NextAction\":\"3fca6886-a1fc-4957-9d63-22c96a917818\",\"Errors\":[{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"3fca6886-a1fc-4957-9d63-22c96a917818\",\"Parameters\":{\"SSML\":\"<speak>I am sending a message to <say-as interpret-as=\\\"telephone\\\">$.Attributes.phoneNumber </say-as></speak>\"},\"Transitions\":{\"NextAction\":\"e9401503-2125-4019-903d-95d341e0f024\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"7a28c503-1929-4851-bdd8-c3de9ac0e36b\",\"Parameters\":{\"Attributes\":{\"phoneNumber\":\"$.Lex.Slots.phone_number\"}},\"Transitions\":{\"NextAction\":\"1ad512e6-1887-4159-98bc-5673bfb73d60\",\"Errors\":[{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"Parameters\":{\"Text\":\"We are currently having technical difficulties. Please Try again later\"},\"Transitions\":{\"NextAction\":\"79fd99eb-86aa-4d51-ae98-0e18b00c3b16\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"fc1c29f3-e585-412a-9527-e488d2f4734b\",\"Parameters\":{\"Text\":\"Would you like to  send the text to this number?\",\"LexV2Bot\":{\"AliasArn\":\"arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/RV05CVNUFP/GR8LWG3KQS\"}},\"Transitions\":{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"Errors\":[{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"a64c8bc8-8b8a-4009-b8fd-32914414f704\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Yes\"]}},{\"NextAction\":\"c7b02211-4018-4c4d-acee-9aad8627dffe\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"No\"]}}]},\"Type\":\"ConnectParticipantWithLexBot\"},{\"Identifier\":\"1ad512e6-1887-4159-98bc-5673bfb73d60\",\"Parameters\":{\"SSML\":\"<speak>Is <say-as interpret-as=\\\"telephone\\\">$.Attributes.phoneNumber</say-as> correct?</speak>\",\"LexV2Bot\":{\"AliasArn\":\"arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/RV05CVNUFP/GR8LWG3KQS\"}},\"Transitions\":{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"Errors\":[{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"c7b02211-4018-4c4d-acee-9aad8627dffe\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"3fca6886-a1fc-4957-9d63-22c96a917818\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Yes\"]}},{\"NextAction\":\"c7b02211-4018-4c4d-acee-9aad8627dffe\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"No\"]}}]},\"Type\":\"ConnectParticipantWithLexBot\"},{\"Identifier\":\"c7b02211-4018-4c4d-acee-9aad8627dffe\",\"Parameters\":{\"Text\":\"Please tell me your phone number.\",\"LexSessionAttributes\":{\"x-amz-lex:dtmf:max-length\":\"1\"},\"LexV2Bot\":{\"AliasArn\":\"arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/4DNUYZJB6T/Y3T4EINALP\"}},\"Transitions\":{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"Errors\":[{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"aa757608-1b34-4f01-8a02-84f2c2166d1e\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"7a28c503-1929-4851-bdd8-c3de9ac0e36b\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"PhoneNumber\"]}}]},\"Type\":\"ConnectParticipantWithLexBot\"}],\"Settings\":{\"InputParameters\":[],\"OutputParameters\":[],\"Transitions\":[{\"DisplayName\":\"Success\",\"ReferenceName\":\"Success\",\"Description\":\"\"},{\"DisplayName\":\"Error\",\"ReferenceName\":\"Error\",\"Description\":\"\"}]}}",
                        {}
                    ]
                },
                "InstanceArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}"
                },
                "Name": "Sample_GetPhoneNumber"
            }
        },
        "SamplePhoneNumberLexPermission": {
            "Type": "Custom:ConnectAssociateLex",
            "Properties": {
                "InstanceId": {
                    "Ref": "ConnectInstanceID"
                },
                "AliasArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/4DNUYZJB6T/Y3T4EINALP"
                },
                "ServiceToken": {
                    "Fn:ImportValue": "CFNConnectAssociateLexV2Bot"
                }
            }
        },
        "SampleGetServiceModule": {
            "Type": "AWS:Connect:ContactFlowModule",
            "Properties": {
                "State": "ACTIVE",
                "Content": {
                    "Fn:Sub": [
                        "{\"Version\":\"2019-10-30\",\"StartAction\":\"ae9bc4d1-6435-4f17-be66-f1a37503b129\",\"Metadata\":{\"entryPointPosition\":{\"x\":38,\"y\":90},\"snapToGrid\":false,\"ActionMetadata\":{\"0d76931b-a16e-49dd-b4b8-55aa294a2add\":{\"position\":{\"x\":1468,\"y\":367}},\"a45ee680-37d7-437f-aca4-fcc77041e232\":{\"position\":{\"x\":666,\"y\":13},\"dynamicParams\":[\"promptText\"]},\"599a19c0-c915-4f64-b5e7-0dcb9b850dbc\":{\"position\":{\"x\":673,\"y\":207},\"dynamicParams\":[\"promptText\"]},\"9c6fbec8-8c87-400c-9379-79fbb9161de6\":{\"position\":{\"x\":590,\"y\":378},\"dynamicParams\":[\"promptText\"]},\"5024090e-763c-447b-9d4e-882860cf9d63\":{\"position\":{\"x\":294,\"y\":679},\"dynamicParams\":[]},\"da511a5f-c0e5-4124-8938-209684cfebea\":{\"position\":{\"x\":306,\"y\":912},\"dynamicParams\":[]},\"cae5126d-d79c-45b9-90c9-27179bc069f1\":{\"position\":{\"x\":625,\"y\":1098}},\"127880f2-0090-49fb-a3ea-b87a342494c0\":{\"position\":{\"x\":1455,\"y\":201}},\"0b552543-1e26-42ec-9a5b-6008279cd702\":{\"position\":{\"x\":626,\"y\":596},\"dynamicParams\":[\"promptText\"]},\"b8da999d-9aa4-4372-ae22-522cadc3884d\":{\"position\":{\"x\":855,\"y\":878}},\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\":{\"position\":{\"x\":1189,\"y\":383},\"dynamicParams\":[]},\"ae9bc4d1-6435-4f17-be66-f1a37503b129\":{\"position\":{\"x\":144,\"y\":243},\"conditionMetadata\":[{\"id\":\"eab36b20-893d-4a2f-92b7-2c807b5fef60\",\"value\":\"Translate\"},{\"id\":\"4aaa6a92-bc41-46dd-b6e7-3c21b09e4087\",\"value\":\"Kendra\"},{\"id\":\"2a2be7c6-1f4a-4541-91f1-46cda6ffa0e6\",\"value\":\"Lex\"},{\"id\":\"d6d60ade-2944-4cfb-b516-76e3957f08fc\",\"value\":\"Comprehend\"},{\"id\":\"da945204-42e2-4175-bb19-7ba12939201a\",\"value\":\"Representative\"}],\"useDynamic\":true,\"dynamicMetadata\":{\"x-amz-lex:dtmf:max-length:*.*\":false,\"3 x-amz-lex:dtmf:end-timeout-ms:*.*\":false},\"useLexBotDropdown\":true,\"useDynamicLexBotArn\":false,\"lexV2BotName\":\"Sample_AI_Services\",\"lexV2BotAliasName\":\"prod\"},\"6946942c-9592-4917-b4a0-4b4d2a031f1c\":{\"position\":{\"x\":15,\"y\":1030},\"useDynamic\":false},\"bba37193-f668-4d39-b49e-0623ec136e02\":{\"position\":{\"x\":566,\"y\":825},\"dynamicParams\":[]}}},\"Actions\":[{\"Identifier\":\"0d76931b-a16e-49dd-b4b8-55aa294a2add\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"a45ee680-37d7-437f-aca4-fcc77041e232\",\"Parameters\":{\"Attributes\":{\"queueName\":\"c8c7025d-a7f5-4bec-98cb-6cfb220e7cca\",\"promptText\":\"$.Attributes.promptDescriptionTranslate\",\"url\":\"https://$${AWS::Partition}.amazon.com/translate/\"}},\"Transitions\":{\"NextAction\":\"127880f2-0090-49fb-a3ea-b87a342494c0\",\"Errors\":[{\"NextAction\":\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"599a19c0-c915-4f64-b5e7-0dcb9b850dbc\",\"Parameters\":{\"Attributes\":{\"queueName\":\"e01af8d9-2780-486a-8efb-2d6962bdf1fd\",\"promptText\":\"$.Attributes.promptDescriptionKendra\",\"url\":\"https://$${AWS:Partition}.amazon.com/kendra/\"}},\"Transitions\":{\"NextAction\":\"127880f2-0090-49fb-a3ea-b87a342494c0\",\"Errors\":[{\"NextAction\":\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"9c6fbec8-8c87-400c-9379-79fbb9161de6\",\"Parameters\":{\"Attributes\":{\"queueName\":\"16267383-f9ad-4d64-b1d5-19b35c39c596\",\"promptText\":\"$.Attributes.promptDescriptionLex\",\"url\":\"https://$${AWS:Partition}.amazon.com/lex/\"}},\"Transitions\":{\"NextAction\":\"127880f2-0090-49fb-a3ea-b87a342494c0\",\"Errors\":[{\"NextAction\":\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"5024090e-763c-447b-9d4e-882860cf9d63\",\"Parameters\":{\"Attributes\":{\"initialLexPrompt\":\"$.Attributes.promptServiceChoices2\"}},\"Transitions\":{\"NextAction\":\"ae9bc4d1-6435-4f17-be66-f1a37503b129\",\"Errors\":[{\"NextAction\":\"da511a5f-c0e5-4124-8938-209684cfebea\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"da511a5f-c0e5-4124-8938-209684cfebea\",\"Parameters\":{\"Attributes\":{\"status\":\"error\"}},\"Transitions\":{\"NextAction\":\"b8da999d-9aa4-4372-ae22-522cadc3884d\",\"Errors\":[{\"NextAction\":\"cae5126d-d79c-45b9-90c9-27179bc069f1\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"cae5126d-d79c-45b9-90c9-27179bc069f1\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"127880f2-0090-49fb-a3ea-b87a342494c0\",\"Parameters\":{},\"Transitions\":{},\"Type\":\"EndFlowModuleExecution\"},{\"Identifier\":\"0b552543-1e26-42ec-9a5b-6008279cd702\",\"Parameters\":{\"Attributes\":{\"queueName\":\"ffc78c92-53b6-41fe-9412-ad069f4a20d1\",\"promptText\":\"$.Attributes.promptDescriptionComprehend\",\"url\":\"https://$${AWS:Partition}.amazon.com/comprehend/\"}},\"Transitions\":{\"NextAction\":\"127880f2-0090-49fb-a3ea-b87a342494c0\",\"Errors\":[{\"NextAction\":\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"b8da999d-9aa4-4372-ae22-522cadc3884d\",\"Parameters\":{},\"Transitions\":{},\"Type\":\"EndFlowModuleExecution\"},{\"Identifier\":\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\",\"Parameters\":{\"Attributes\":{\"status\":\"error\"}},\"Transitions\":{\"NextAction\":\"127880f2-0090-49fb-a3ea-b87a342494c0\",\"Errors\":[{\"NextAction\":\"0d76931b-a16e-49dd-b4b8-55aa294a2add\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"ae9bc4d1-6435-4f17-be66-f1a37503b129\",\"Parameters\":{\"Text\":\"$.Attributes.initialLexPrompt\",\"LexSessionAttributes\":{\"x-amz-lex:dtmf:max-length:*.*\":\"1\",\"3 x-amz-lex:dtmf:end-timeout-ms:*.*\":\"1\"},\"LexV2Bot\":{\"AliasArn\":\"arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/ET58BHKVXE/KSPQHW9OPV\"}},\"Transitions\":{\"NextAction\":\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\",\"Errors\":[{\"NextAction\":\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"6946942c-9592-4917-b4a0-4b4d2a031f1c\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"a45ee680-37d7-437f-aca4-fcc77041e232\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Translate\"]}},{\"NextAction\":\"599a19c0-c915-4f64-b5e7-0dcb9b850dbc\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Kendra\"]}},{\"NextAction\":\"9c6fbec8-8c87-400c-9379-79fbb9161de6\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Lex\"]}},{\"NextAction\":\"0b552543-1e26-42ec-9a5b-6008279cd702\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Comprehend\"]}},{\"NextAction\":\"bba37193-f668-4d39-b49e-0623ec136e02\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Representative\"]}}]},\"Type\":\"ConnectParticipantWithLexBot\"},{\"Identifier\":\"6946942c-9592-4917-b4a0-4b4d2a031f1c\",\"Parameters\":{\"LoopCount\":\"2\"},\"Transitions\":{\"NextAction\":\"bba37193-f668-4d39-b49e-0623ec136e02\",\"Errors\":[],\"Conditions\":[{\"NextAction\":\"bba37193-f668-4d39-b49e-0623ec136e02\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"DoneLooping\"]}},{\"NextAction\":\"5024090e-763c-447b-9d4e-882860cf9d63\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"ContinueLooping\"]}}]},\"Type\":\"Loop\"},{\"Identifier\":\"bba37193-f668-4d39-b49e-0623ec136e02\",\"Parameters\":{\"Attributes\":{\"queueName\":\"arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}/queue/9ab30a46-baeb-43ce-907c-7674efc0db51\",\"status\":\"Representative\"}},\"Transitions\":{\"NextAction\":\"b8da999d-9aa4-4372-ae22-522cadc3884d\",\"Errors\":[{\"NextAction\":\"557e1f5c-e75c-4b7f-b4a5-c1f2aa8e501d\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"}],\"Settings\":{\"InputParameters\":[],\"OutputParameters\":[],\"Transitions\":[{\"DisplayName\":\"Success\",\"ReferenceName\":\"Success\",\"Description\":\"\"},{\"DisplayName\":\"Error\",\"ReferenceName\":\"Error\",\"Description\":\"\"}]}}",
                        {}
                    ]
                },
                "InstanceArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}"
                },
                "Name": "Sample_GetService"
            }
        },
        "SampleAIServicesLexPermission": {
            "Type": "Custom:ConnectAssociateLex",
            "Properties": {
                "InstanceId": {
                    "Ref": "ConnectInstanceID"
                },
                "AliasArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/ET58BHKVXE/KSPQHW9OPV"
                },
                "ServiceToken": {
                    "Fn:ImportValue": "CFNConnectAssociateLexV2Bot"
                }
            }
        },
        "SampleInitializeModule": {
            "Type": "AWS:Connect:ContactFlowModule",
            "Properties": {
                "State": "ACTIVE",
                "Content": {
                    "Fn:Sub": [
                        "{\"Version\":\"2019-10-30\",\"StartAction\":\"443d46ce-ced1-4092-847e-1a19cd138f2b\",\"Metadata\":{\"entryPointPosition\":{\"x\":15,\"y\":15},\"snapToGrid\":false,\"ActionMetadata\":{\"443d46ce-ced1-4092-847e-1a19cd138f2b\":{\"position\":{\"x\":174,\"y\":17}},\"9d78d6fc-29ab-43d7-abd9-2e1a2575c62b\":{\"position\":{\"x\":441,\"y\":16},\"overrideConsoleVoice\":false,\"defaultVoice\":\"Conversational\"},\"05f322ff-1d5d-44eb-972a-280675e5a855\":{\"position\":{\"x\":476,\"y\":628}},\"3f69bfc4-a78a-49ea-9be4-b162e11ce432\":{\"position\":{\"x\":1231,\"y\":108}},\"5111e249-1d38-4925-935c-ba7c8431b59a\":{\"position\":{\"x\":509,\"y\":361},\"dynamicParams\":[]},\"ee61300a-2118-431f-b086-e95a4cddd967\":{\"position\":{\"x\":710,\"y\":30},\"dynamicMetadata\":{\"contactFlowName\":false},\"useDynamic\":false},\"5f1ca839-30d0-4c4b-946a-2dc4313b83ed\":{\"position\":{\"x\":979,\"y\":36},\"dynamicParams\":[\"promptWelcome\",\"promptDescriptionTranslate\",\"promptDescriptionComprehend\",\"promptDescriptionLex\",\"promptDescriptionKendra\",\"promptServiceChoices1\",\"promptServiceChoices2\"]}}},\"Actions\":[{\"Identifier\":\"443d46ce-ced1-4092-847e-1a19cd138f2b\",\"Parameters\":{\"FlowLoggingBehavior\":\"Enabled\"},\"Transitions\":{\"NextAction\":\"9d78d6fc-29ab-43d7-abd9-2e1a2575c62b\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"UpdateFlowLoggingBehavior\"},{\"Identifier\":\"9d78d6fc-29ab-43d7-abd9-2e1a2575c62b\",\"Parameters\":{\"TextToSpeechVoice\":\"Joanna\"},\"Transitions\":{\"NextAction\":\"ee61300a-2118-431f-b086-e95a4cddd967\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"UpdateContactTextToSpeechVoice\"},{\"Identifier\":\"05f322ff-1d5d-44eb-972a-280675e5a855\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"3f69bfc4-a78a-49ea-9be4-b162e11ce432\",\"Parameters\":{},\"Transitions\":{},\"Type\":\"EndFlowModuleExecution\"},{\"Identifier\":\"5111e249-1d38-4925-935c-ba7c8431b59a\",\"Parameters\":{\"Attributes\":{\"status\":\"error\"}},\"Transitions\":{\"NextAction\":\"3f69bfc4-a78a-49ea-9be4-b162e11ce432\",\"Errors\":[{\"NextAction\":\"05f322ff-1d5d-44eb-972a-280675e5a855\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"},{\"Identifier\":\"ee61300a-2118-431f-b086-e95a4cddd967\",\"Parameters\":{\"LambdaFunctionARN\":\"arn:$${AWS:Partition}:lambda:$${AWS:Region}:$${AWS:AccountId}:function:getPrompt\",\"InvocationTimeLimitSeconds\":\"3\",\"LambdaInvocationAttributes\":{\"contactFlowName\":\"Sample_Main_Flow\"}},\"Transitions\":{\"NextAction\":\"5f1ca839-30d0-4c4b-946a-2dc4313b83ed\",\"Errors\":[{\"NextAction\":\"5111e249-1d38-4925-935c-ba7c8431b59a\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"InvokeLambdaFunction\"},{\"Identifier\":\"5f1ca839-30d0-4c4b-946a-2dc4313b83ed\",\"Parameters\":{\"Attributes\":{\"promptWelcome\":\"$.External.welcome\",\"promptDescriptionTranslate\":\"$.External.descriptionTranslate\",\"promptDescriptionComprehend\":\"$.External.descriptionComprehend\",\"promptDescriptionLex\":\"$.External.descriptionLex\",\"promptDescriptionKendra\":\"$.External.descriptionKendra\",\"promptServiceChoices1\":\"$.External.serviceChoices1\",\"promptServiceChoices2\":\"$.External.serviceChoices2\",\"status\":\"success\"}},\"Transitions\":{\"NextAction\":\"3f69bfc4-a78a-49ea-9be4-b162e11ce432\",\"Errors\":[{\"NextAction\":\"5111e249-1d38-4925-935c-ba7c8431b59a\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactAttributes\"}],\"Settings\":{\"InputParameters\":[],\"OutputParameters\":[],\"Transitions\":[{\"DisplayName\":\"Success\",\"ReferenceName\":\"Success\",\"Description\":\"\"},{\"DisplayName\":\"Error\",\"ReferenceName\":\"Error\",\"Description\":\"\"}]}}",
                        {}
                    ]
                },
                "InstanceArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}"
                },
                "Name": "Sample_Initialize"
            }
        },
        "getPromptLambdaPermission": {
            "Type": "Custom:ConnectAssociateLambda",
            "Properties": {
                "InstanceId": {
                    "Ref": "ConnectInstanceID"
                },
                "FunctionArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:lambda:$${AWS::Region}:$${AWS:AccountId}:function:getPrompt"
                },
                "ServiceToken": {
                    "Fn:ImportValue": "CFNConnectAssociateLambda"
                }
            }
        },
        "SampleTransferToAgentModule": {
            "Type": "AWS:Connect:ContactFlowModule",
            "Properties": {
                "State": "ACTIVE",
                "Content": {
                    "Fn:Sub": [
                        "{\"Version\":\"2019-10-30\",\"StartAction\":\"93c21991-653f-452b-b294-b298702a5fb8\",\"Metadata\":{\"entryPointPosition\":{\"x\":15,\"y\":15},\"snapToGrid\":false,\"ActionMetadata\":{\"5f1ff31e-cafa-4d29-a6c9-3e6b111929c7\":{\"position\":{\"x\":478,\"y\":281},\"useDynamic\":false},\"6530c7ff-71f8-4ddb-9b0b-a8a04f84a674\":{\"position\":{\"x\":773,\"y\":475}},\"93c21991-653f-452b-b294-b298702a5fb8\":{\"position\":{\"x\":197,\"y\":38},\"conditionMetadata\":[{\"id\":\"0b761951-f774-4871-bc4c-1f97beabf59f\",\"value\":\"Yes\"},{\"id\":\"5bc6fcc8-be6c-40b3-a407-c2218457e451\",\"value\":\"No\"}],\"useDynamic\":false,\"dynamicMetadata\":{},\"useLexBotDropdown\":true,\"useDynamicLexBotArn\":false,\"lexV2BotName\":\"Sample_YesNoBot\",\"lexV2BotAliasName\":\"prod\"},\"138a6a01-7e1e-44ec-a9f4-898104bc2a90\":{\"position\":{\"x\":629,\"y\":42},\"useDynamic\":true,\"queue\":\"queueName\"},\"878e56f8-52b1-4838-a537-0c70d1abcc65\":{\"position\":{\"x\":1177,\"y\":537},\"useDynamic\":false},\"e9d11e78-a461-4c7a-a5ca-d1172d9d4fd5\":{\"position\":{\"x\":1240,\"y\":302},\"useDynamic\":false},\"c31d7205-bbe7-4ed7-9d5b-6bd77b8000bb\":{\"position\":{\"x\":1469,\"y\":31},\"useDynamic\":false},\"6708cd03-1010-407c-a4f2-1fab3800283f\":{\"position\":{\"x\":882,\"y\":44}},\"40c6bc94-4869-41ef-aca3-36dbcb760391\":{\"position\":{\"x\":1198,\"y\":33},\"contactFlow\":{\"id\":\"$${SampleCallback.ContactFlowArn}\",\"text\":\"Sample_Callback\"},\"customerOrAgent\":true,\"useDynamic\":false},\"cf28c9f6-6a9a-4860-9c7b-5e90f56164d9\":{\"position\":{\"x\":1773,\"y\":198},\"useDynamic\":false},\"a2895a8f-9fbf-48dd-965a-f56124b9ed99\":{\"position\":{\"x\":1887,\"y\":620},\"useDynamic\":false},\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\":{\"position\":{\"x\":325,\"y\":487},\"useDynamic\":false},\"7d65a09f-bb31-47b5-95ad-0c87be433e48\":{\"position\":{\"x\":1519,\"y\":249},\"useDynamic\":false,\"queue\":{\"id\":\"arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}/queue/ca1df388-4bc0-437b-a97c-5d354c0de573\",\"text\":\"BasicQueue\"}},\"a50c82c4-ae1e-429c-8d18-28bb9c35044e\":{\"position\":{\"x\":1631,\"y\":546},\"useDynamic\":false}}},\"Actions\":[{\"Identifier\":\"5f1ff31e-cafa-4d29-a6c9-3e6b111929c7\",\"Parameters\":{\"Text\":\"Good Bye\"},\"Transitions\":{\"NextAction\":\"6530c7ff-71f8-4ddb-9b0b-a8a04f84a674\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"6530c7ff-71f8-4ddb-9b0b-a8a04f84a674\",\"Type\":\"DisconnectParticipant\",\"Parameters\":{},\"Transitions\":{}},{\"Identifier\":\"93c21991-653f-452b-b294-b298702a5fb8\",\"Parameters\":{\"Text\":\"Would you like to speak to a representative for more information?\",\"LexV2Bot\":{\"AliasArn\":\"arn:$${AWS:Partition}:lex:$${AWS:Region}:$${AWS:AccountId}:bot-alias/RV05CVNUFP/GR8LWG3KQS\"}},\"Transitions\":{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"Errors\":[{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"138a6a01-7e1e-44ec-a9f4-898104bc2a90\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"138a6a01-7e1e-44ec-a9f4-898104bc2a90\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"Yes\"]}},{\"NextAction\":\"5f1ff31e-cafa-4d29-a6c9-3e6b111929c7\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"No\"]}}]},\"Type\":\"ConnectParticipantWithLexBot\"},{\"Identifier\":\"138a6a01-7e1e-44ec-a9f4-898104bc2a90\",\"Parameters\":{\"QueueId\":\"$.Attributes.queueName\"},\"Transitions\":{\"NextAction\":\"6708cd03-1010-407c-a4f2-1fab3800283f\",\"Errors\":[{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactTargetQueue\"},{\"Identifier\":\"878e56f8-52b1-4838-a537-0c70d1abcc65\",\"Parameters\":{\"Text\":\"All agents are currently busy.  Please call again later.\"},\"Transitions\":{\"NextAction\":\"6530c7ff-71f8-4ddb-9b0b-a8a04f84a674\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"e9d11e78-a461-4c7a-a5ca-d1172d9d4fd5\",\"Parameters\":{\"Text\":\"Please call back during normal business hours.\"},\"Transitions\":{\"NextAction\":\"6530c7ff-71f8-4ddb-9b0b-a8a04f84a674\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"c31d7205-bbe7-4ed7-9d5b-6bd77b8000bb\",\"Parameters\":{\"MetricType\":\"NumberOfAgentsAvailable\"},\"Transitions\":{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"Errors\":[{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"7d65a09f-bb31-47b5-95ad-0c87be433e48\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"cf28c9f6-6a9a-4860-9c7b-5e90f56164d9\",\"Condition\":{\"Operator\":\"NumberGreaterThan\",\"Operands\":[\"0\"]}}]},\"Type\":\"CheckMetricData\"},{\"Identifier\":\"6708cd03-1010-407c-a4f2-1fab3800283f\",\"Parameters\":{},\"Transitions\":{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"Errors\":[{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[{\"NextAction\":\"40c6bc94-4869-41ef-aca3-36dbcb760391\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"True\"]}},{\"NextAction\":\"e9d11e78-a461-4c7a-a5ca-d1172d9d4fd5\",\"Condition\":{\"Operator\":\"Equals\",\"Operands\":[\"False\"]}}]},\"Type\":\"CheckHoursOfOperation\"},{\"Identifier\":\"40c6bc94-4869-41ef-aca3-36dbcb760391\",\"Parameters\":{\"EventHooks\":{\"CustomerQueue\":\"$${SampleCallback.ContactFlowArn}\"}},\"Transitions\":{\"NextAction\":\"c31d7205-bbe7-4ed7-9d5b-6bd77b8000bb\",\"Errors\":[{\"NextAction\":\"c31d7205-bbe7-4ed7-9d5b-6bd77b8000bb\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactEventHooks\"},{\"Identifier\":\"cf28c9f6-6a9a-4860-9c7b-5e90f56164d9\",\"Transitions\":{\"NextAction\":\"e9d11e78-a461-4c7a-a5ca-d1172d9d4fd5\",\"Errors\":[{\"NextAction\":\"e9d11e78-a461-4c7a-a5ca-d1172d9d4fd5\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"878e56f8-52b1-4838-a537-0c70d1abcc65\",\"ErrorType\":\"QueueAtCapacity\"}],\"Conditions\":[]},\"Type\":\"TransferContactToQueue\"},{\"Identifier\":\"a2895a8f-9fbf-48dd-965a-f56124b9ed99\",\"Parameters\":{\"Text\":\"We have not hired any agents yet. But I will transfer you anyway\"},\"Transitions\":{\"NextAction\":\"cf28c9f6-6a9a-4860-9c7b-5e90f56164d9\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"Parameters\":{\"Text\":\"We are currently experiencing technical difficulties. Please call again later.\"},\"Transitions\":{\"NextAction\":\"6530c7ff-71f8-4ddb-9b0b-a8a04f84a674\",\"Errors\":[],\"Conditions\":[]},\"Type\":\"MessageParticipant\"},{\"Identifier\":\"7d65a09f-bb31-47b5-95ad-0c87be433e48\",\"Parameters\":{\"QueueId\":\"arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}/queue/ca1df388-4bc0-437b-a97c-5d354c0de573\"},\"Transitions\":{\"NextAction\":\"a50c82c4-ae1e-429c-8d18-28bb9c35044e\",\"Errors\":[{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"ErrorType\":\"NoMatchingError\"}],\"Conditions\":[]},\"Type\":\"UpdateContactTargetQueue\"},{\"Identifier\":\"a50c82c4-ae1e-429c-8d18-28bb9c35044e\",\"Parameters\":{\"MetricType\":\"NumberOfAgentsStaffed\"},\"Transitions\":{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"Errors\":[{\"NextAction\":\"a5c1ca84-6782-4715-b29a-74dedadc5e6a\",\"ErrorType\":\"NoMatchingError\"},{\"NextAction\":\"a2895a8f-9fbf-48dd-965a-f56124b9ed99\",\"ErrorType\":\"NoMatchingCondition\"}],\"Conditions\":[{\"NextAction\":\"cf28c9f6-6a9a-4860-9c7b-5e90f56164d9\",\"Condition\":{\"Operator\":\"NumberGreaterThan\",\"Operands\":[\"0\"]}}]},\"Type\":\"CheckMetricData\"}],\"Settings\":{\"InputParameters\":[],\"OutputParameters\":[],\"Transitions\":[{\"DisplayName\":\"Success\",\"ReferenceName\":\"Success\",\"Description\":\"\"},{\"DisplayName\":\"Error\",\"ReferenceName\":\"Error\",\"Description\":\"\"}]}}",
                        {}
                    ]
                },
                "InstanceArn": {
                    "Fn:Sub": "arn:$${AWS:Partition}:connect:$${AWS:Region}:$${AWS:AccountId}:instance/$${ConnectInstanceID}"
                },
                "Name": "Sample_TransferToAgent"
            }
        }
    },
    "Parameters": {
        "ConnectInstanceID": {
            "Type": "String",
            "AllowedPattern": ".+",
            "ConstraintDescription": "ConnectInstanceID is required"
        }
    }
}
    JSON
  tags = {
    "Name"        = "Test Contact GTSFlow",
    "Application" = "Terraform",
    "Method"      = "Create"
  }
}
