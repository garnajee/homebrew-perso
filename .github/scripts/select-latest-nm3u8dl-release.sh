#!/usr/bin/env bash

set -Eeuo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <releases.json>" >&2
  exit 2
fi

releases_file="$1"

jq -e 'type == "array"' "$releases_file" >/dev/null

release="$({
  jq -ce '
    [
      .[]
      | select(.draft == false)
      | select(.published_at | type == "string")
    ]
    | if length == 0 then
        error("No published, non-draft release found")
      else
        sort_by(.published_at) | last
      end
  ' "$releases_file"
})"

tag="$(jq -er '
  if (.tag_name | type) == "string" and (.tag_name | length) > 0 then
    .tag_name
  else
    error("Latest release has no tag_name")
  end
' <<<"$release")"

tag_pattern='^v([0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z]+([.-][0-9A-Za-z]+)*)?(\+[0-9A-Za-z]+([.-][0-9A-Za-z]+)*)?)$'
if [[ ! "$tag" =~ $tag_pattern ]]; then
  echo "Invalid release tag: $tag" >&2
  exit 1
fi

version="${BASH_REMATCH[1]}"
published_at="$(jq -er '.published_at' <<<"$release")"
release_id="$(jq -er '
  if (.id | type) == "number" then
    .id
  else
    error("Latest release has no numeric id")
  end
' <<<"$release")"

jq -cn \
  --arg tag "$tag" \
  --arg version "$version" \
  --arg published_at "$published_at" \
  --argjson release_id "$release_id" \
  '{
    tag: $tag,
    version: $version,
    published_at: $published_at,
    release_id: $release_id
  }'
