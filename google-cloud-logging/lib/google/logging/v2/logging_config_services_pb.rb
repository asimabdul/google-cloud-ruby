# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/logging/v2/logging_config.proto for package 'google.logging.v2'
# Original file comments:
# Copyright 2016 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/logging/v2/logging_config_pb'

module Google
  module Logging
    module V2
      module ConfigServiceV2
        # Service for configuring sinks used to export log entries outside of
        # Stackdriver Logging.
        class Service

          include GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'google.logging.v2.ConfigServiceV2'

          # Lists sinks.
          rpc :ListSinks, ListSinksRequest, ListSinksResponse
          # Gets a sink.
          rpc :GetSink, GetSinkRequest, LogSink
          # Creates a sink that exports specified log entries to a destination.  The
          # export of newly-ingested log entries begins immediately, unless the current
          # time is outside the sink's start and end times or the sink's
          # `writer_identity` is not permitted to write to the destination.  A sink can
          # export log entries only from the resource owning the sink.
          rpc :CreateSink, CreateSinkRequest, LogSink
          # Updates a sink. If the named sink doesn't exist, then this method is
          # identical to
          # [sinks.create](/logging/docs/api/reference/rest/v2/projects.sinks/create).
          # If the named sink does exist, then this method replaces the following
          # fields in the existing sink with values from the new sink: `destination`,
          # `filter`, `output_version_format`, `start_time`, and `end_time`.
          # The updated filter might also have a new `writer_identity`; see the
          # `unique_writer_identity` field.
          rpc :UpdateSink, UpdateSinkRequest, LogSink
          # Deletes a sink. If the sink has a unique `writer_identity`, then that
          # service account is also deleted.
          rpc :DeleteSink, DeleteSinkRequest, Google::Protobuf::Empty
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end
