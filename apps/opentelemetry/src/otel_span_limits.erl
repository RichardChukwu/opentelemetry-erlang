%%%------------------------------------------------------------------------
%% Copyright 2021, OpenTelemetry Authors
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%% http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%
%% @doc Module for setting the global limits for the number of attributes,
%% events and links on a Span.
%% @end
%%%-------------------------------------------------------------------------
-module(otel_span_limits).

-export([get/0,
         set/1]).

-include("otel_span.hrl").

-define(SPAN_LIMITS_KEY, {?MODULE, span_limits}).

-spec get() -> #span_limits{}.
get() ->
    persistent_term:get(?SPAN_LIMITS_KEY).

%% -spec set(#{attribute_count_limit => integer(),
%%             attribute_value_length_limit => integer() | infinity,
%%             event_count_limit => integer(),
%%             link_count_limit => integer(),
%%             attribute_per_event_limit => integer(),
%%             attribute_per_link_limit => integer()}) -> ok.
-spec set(list()) -> ok.
set(Opts) ->
    SpanLimits = lists:foldl(fun({attribute_count_limit, AttributeCountLimit}, Acc) ->
                                     Acc#span_limits{attribute_count_limit=AttributeCountLimit};
                                ({attribute_value_length_limit, AttributeValueLengthLimit}, Acc) ->
                                     Acc#span_limits{attribute_value_length_limit=AttributeValueLengthLimit};
                                ({event_count_limit, EventCountLimit}, Acc) ->
                                     Acc#span_limits{event_count_limit=EventCountLimit};
                                ({link_count_limit, LinkCountLimit}, Acc) ->
                                     Acc#span_limits{link_count_limit=LinkCountLimit};
                                ({attribute_per_event_limit, AttributePerEventLimit}, Acc) ->
                                     Acc#span_limits{attribute_per_event_limit=AttributePerEventLimit};
                                ({attribute_per_link_limit, AttributePerLinkLimit}, Acc) ->
                                     Acc#span_limits{attribute_per_link_limit=AttributePerLinkLimit};
                                (_, Acc) ->
                                   Acc
                           end, #span_limits{}, Opts),
    persistent_term:put(?SPAN_LIMITS_KEY, SpanLimits).
