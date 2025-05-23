/**
 * This file was auto-generated by Fern from our API Definition.
 */

import * as serializers from "../../../../index";
import * as OpikApi from "../../../../../api/index";
import * as core from "../../../../../core";
import { GuardrailWrite } from "../../../../types/GuardrailWrite";

export const GuardrailBatchWrite: core.serialization.Schema<
    serializers.GuardrailBatchWrite.Raw,
    OpikApi.GuardrailBatchWrite
> = core.serialization.object({
    guardrails: core.serialization.list(GuardrailWrite),
});

export declare namespace GuardrailBatchWrite {
    export interface Raw {
        guardrails: GuardrailWrite.Raw[];
    }
}
