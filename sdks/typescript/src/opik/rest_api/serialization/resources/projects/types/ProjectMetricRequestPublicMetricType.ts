/**
 * This file was auto-generated by Fern from our API Definition.
 */

import * as serializers from "../../../index";
import * as OpikApi from "../../../../api/index";
import * as core from "../../../../core";

export const ProjectMetricRequestPublicMetricType: core.serialization.Schema<
    serializers.ProjectMetricRequestPublicMetricType.Raw,
    OpikApi.ProjectMetricRequestPublicMetricType
> = core.serialization.enum_([
    "FEEDBACK_SCORES",
    "TRACE_COUNT",
    "TOKEN_USAGE",
    "DURATION",
    "COST",
    "GUARDRAILS_FAILED_COUNT",
]);

export declare namespace ProjectMetricRequestPublicMetricType {
    export type Raw =
        | "FEEDBACK_SCORES"
        | "TRACE_COUNT"
        | "TOKEN_USAGE"
        | "DURATION"
        | "COST"
        | "GUARDRAILS_FAILED_COUNT";
}
