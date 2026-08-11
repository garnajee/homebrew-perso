#!/usr/bin/env bash

set -Eeuo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
selector="$script_dir/select-latest-nm3u8dl-release.sh"
test_dir="$(mktemp -d "${TMPDIR:-/tmp}/nm3u8dl-release-tests.XXXXXX")"
trap 'rm -rf "$test_dir"' EXIT

expect_failure() {
  local name="$1"
  local fixture="$2"

  if bash "$selector" "$fixture" >"$test_dir/$name.out" 2>"$test_dir/$name.err"; then
    echo "Expected failure for $name" >&2
    exit 1
  fi
}

cat >"$test_dir/valid.json" <<'JSON'
[
  {
    "id": 10,
    "tag_name": "v0.5.1-beta",
    "draft": false,
    "prerelease": false,
    "published_at": "2025-10-29T14:20:38Z"
  },
  {
    "id": 12,
    "tag_name": "v0.7.0-rc.1",
    "draft": false,
    "prerelease": true,
    "published_at": "2026-07-02T10:00:00Z"
  },
  {
    "id": 11,
    "tag_name": "v9.0.0",
    "draft": true,
    "prerelease": false,
    "published_at": "2026-08-01T10:00:00Z"
  }
]
JSON

selection="$(bash "$selector" "$test_dir/valid.json")"
[[ "$(jq -r '.tag' <<<"$selection")" == "v0.7.0-rc.1" ]]
[[ "$(jq -r '.version' <<<"$selection")" == "0.7.0-rc.1" ]]
[[ "$(jq -r '.release_id' <<<"$selection")" == "12" ]]

printf '[]\n' >"$test_dir/empty.json"
printf '{}\n' >"$test_dir/not-an-array.json"
printf 'not-json\n' >"$test_dir/invalid-json.json"

cat >"$test_dir/null-tag.json" <<'JSON'
[
  {
    "id": 1,
    "tag_name": null,
    "draft": false,
    "published_at": "2026-01-01T00:00:00Z"
  }
]
JSON

cat >"$test_dir/malformed-tag.json" <<'JSON'
[
  {
    "id": 1,
    "tag_name": "latest",
    "draft": false,
    "published_at": "2026-01-01T00:00:00Z"
  }
]
JSON

cat >"$test_dir/missing-id.json" <<'JSON'
[
  {
    "tag_name": "v1.2.3",
    "draft": false,
    "published_at": "2026-01-01T00:00:00Z"
  }
]
JSON

expect_failure empty "$test_dir/empty.json"
expect_failure not-an-array "$test_dir/not-an-array.json"
expect_failure invalid-json "$test_dir/invalid-json.json"
expect_failure null-tag "$test_dir/null-tag.json"
expect_failure malformed-tag "$test_dir/malformed-tag.json"
expect_failure missing-id "$test_dir/missing-id.json"

echo "Release selector tests passed"
