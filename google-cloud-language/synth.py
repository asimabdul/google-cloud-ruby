# Copyright 2018 Google LLC
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

"""This script is used to synthesize generated parts of this library."""

import synthtool as s
import synthtool.gcp as gcp
import logging
import re
from textwrap import dedent

logging.basicConfig(level=logging.DEBUG)

gapic = gcp.GAPICGenerator()

# Temporary until we get Ruby-specific tools into synthtool
def merge_gemspec(src, dest, path):
    regex = re.compile(r'^\s+gem.version\s*=\s*"[\d\.]+"$', flags=re.MULTILINE)
    match = regex.search(dest)
    if match:
        src = regex.sub(match.group(0), src, count=1)
    regex = re.compile(r'^\s+gem.homepage\s*=\s*"[^"]+"$', flags=re.MULTILINE)
    match = regex.search(dest)
    if match:
        src = regex.sub(match.group(0), src, count=1)
    return src

v1_library = gapic.ruby_library(
    'language', 'v1',
    artman_output_name='google-cloud-ruby/google-cloud-language'
)
s.copy(v1_library / 'acceptance')
s.copy(v1_library / 'lib/google/cloud/language/v1')
s.copy(v1_library / 'lib/google/cloud/language/v1.rb')
s.copy(v1_library / 'lib/google/cloud/language/v1')
s.copy(v1_library / 'lib/google/cloud/language.rb')
s.copy(v1_library / 'test/google/cloud/language/v1')
s.copy(v1_library / 'Rakefile')
s.copy(v1_library / 'README.md')
s.copy(v1_library / 'LICENSE')
s.copy(v1_library / '.gitignore')
s.copy(v1_library / '.rubocop.yml')
s.copy(v1_library / '.yardopts')
s.copy(v1_library / 'google-cloud-language.gemspec', merge=merge_gemspec)

v1beta2_library = gapic.ruby_library(
    'language', 'v1beta2',
    artman_output_name='google-cloud-ruby/google-cloud-language'
)
s.copy(v1beta2_library / 'lib/google/cloud/language/v1beta2')
s.copy(v1beta2_library / 'lib/google/cloud/language/v1beta2.rb')
s.copy(v1beta2_library / 'lib/google/cloud/language/v1beta2')
s.copy(v1beta2_library / 'test/google/cloud/language/v1beta2')

# https://github.com/googleapis/gapic-generator/issues/2117
s.replace(
    'test/google/cloud/language/v1/language_service_client_test.rb',
    'CustomTestError([^_])', 'CustomTestError_v1\\1')
s.replace(
    'test/google/cloud/language/v1/language_service_client_test.rb',
    'MockGrpcClientStub([^_])', 'MockGrpcClientStub_v1\\1')
s.replace(
    'test/google/cloud/language/v1/language_service_client_test.rb',
    'MockLanguageServiceCredentials([^_])',
    'MockLanguageServiceCredentials_v1\\1')
s.replace(
    'test/google/cloud/language/v1beta2/language_service_client_test.rb',
    'CustomTestError([^_])', 'CustomTestError_v1beta2\\1')
s.replace(
    'test/google/cloud/language/v1beta2/language_service_client_test.rb',
    'MockGrpcClientStub([^_])', 'MockGrpcClientStub_v1beta2\\1')
s.replace(
    'test/google/cloud/language/v1beta2/language_service_client_test.rb',
    'MockLanguageServiceCredentials([^_])',
    'MockLanguageServiceCredentials_v1beta2\\1')

# https://github.com/googleapis/gapic-generator/issues/2174
s.replace(
    'lib/google/cloud/language.rb',
    'File\.join\(dir, "\.rb"\)',
    'dir + ".rb"')

# https://github.com/googleapis/gapic-generator/issues/2182
s.replace(
    [
      'lib/google/cloud/language/v1/credentials.rb',
      'lib/google/cloud/language/v1beta2/credentials.rb'
    ],
    'LANGUAGE_KEYFILE\\n(\s+)LANGUAGE_CREDENTIALS\n',
    'LANGUAGE_CREDENTIALS\\n\\1LANGUAGE_KEYFILE\n')
s.replace(
    [
      'lib/google/cloud/language/v1/credentials.rb',
      'lib/google/cloud/language/v1beta2/credentials.rb'
    ],
    'LANGUAGE_KEYFILE_JSON\\n(\s+)LANGUAGE_CREDENTIALS_JSON\n',
    'LANGUAGE_CREDENTIALS_JSON\\n\\1LANGUAGE_KEYFILE_JSON\n')

# https://github.com/googleapis/gapic-generator/issues/2185
s.replace(
    'acceptance/google/cloud/language/v1/language_service_smoke_test.rb',
    'describe "LanguageServiceSmokeTest"',
    'describe "LanguageServiceSmokeTest V1"')
s.replace(
    'acceptance/google/cloud/language/v1/language_service_smoke_test.rb',
    'language_service_client = Google::Cloud::Language\\.new\n',
    'language_service_client = Google::Cloud::Language.new version: :v1\n')

# https://github.com/googleapis/gapic-generator/issues/2194
s.replace(
    '.yardopts',
    '\n--markup markdown\n\n',
    '\n--markup markdown\n--markup-provider redcarpet\n\n')

# https://github.com/googleapis/gapic-generator/issues/2194
s.replace(
    'google-cloud-language.gemspec',
    '\n  gem\\.add_development_dependency "minitest", "~> ([\\d\\.]+)"\n  gem\\.add_development_dependency "rubocop"',
    '\n  gem.add_development_dependency "minitest", "~> \\1"\n  gem.add_development_dependency "redcarpet", "~> 3.0"\n  gem.add_development_dependency "rubocop"')
s.replace(
    'google-cloud-language.gemspec',
    '\n  gem\\.add_development_dependency "simplecov", "~> ([\\d\\.]+)"\nend',
    '\n  gem.add_development_dependency "simplecov", "~> \\1"\n  gem.add_development_dependency "yard", "~> 0.9"\nend')

# https://github.com/googleapis/gapic-generator/issues/2195
s.replace(
    [
      'README.md',
      'lib/google/cloud/language.rb',
      'lib/google/cloud/language/v1.rb',
      'lib/google/cloud/language/v1beta2.rb',
      'lib/google/cloud/language/v1/doc/overview.rb',
      'lib/google/cloud/language/v1beta2/doc/overview.rb'
    ],
    '\\(https://console\\.cloud\\.google\\.com/apis/api/language\\)',
    '(https://console.cloud.google.com/apis/library/language.googleapis.com)')

# https://github.com/googleapis/gapic-generator/issues/2196
s.replace(
    [
      'README.md',
      'lib/google/cloud/language.rb',
      'lib/google/cloud/language/v1.rb',
      'lib/google/cloud/language/v1beta2.rb',
      'lib/google/cloud/language/v1/doc/overview.rb',
      'lib/google/cloud/language/v1beta2/doc/overview.rb'
    ],
    '\\[Product Documentation\\]: https://cloud\\.google\\.com/language\n',
    '[Product Documentation]: https://cloud.google.com/natural-language\n')

# https://github.com/googleapis/gapic-generator/issues/2211
s.replace(
    'Rakefile',
    'namespace :ci do\n  desc "Run the CI build, with acceptance tests\\."\n  task :acceptance do',
    dedent("""\
      namespace :ci do
        desc "Run the CI build, with smoke tests."
        task :smoke_test do
          Rake::Task["ci"].invoke
          header "google-cloud-language smoke_test", "*"
          sh "bundle exec rake smoke_test -v"
        end
        desc "Run the CI build, with acceptance tests."
        task :acceptance do"""))
