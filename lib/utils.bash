#!/usr/bin/env bash

set -euo pipefail

DOWNLOAD_BASE_URL="https://downloads.apache.org/jmeter/binaries"
CACHE_DIR="${TMPDIR:-/tmp}/asdf-jmeter.cache"
trap 'test -d "${CACHE_DIR}" && rm -rf "${CACHE_DIR}"' EXIT
if [ ! -d "${CACHE_DIR}" ]; then
  mkdir -p "${CACHE_DIR}"
fi

fail() {
  echo -e "asdf-jmeter: $*"
  exit 1
}

curl_opts=(-fsSL)

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  curl -s -L https://downloads.apache.org/jmeter/binaries | grep -o "apache-jmeter-.*.zip\"" | cut -d\" -f 1 | cut -d- -f 3 | rev | cut -c5- | rev
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  url="$DOWNLOAD_BASE_URL/$filename"

  echo "* Downloading jmeter release $version... from $url to $filename"
  cd "${CACHE_DIR}" && curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  if ! [ -x "$(command -v unzip)" ]; then
    echo "Install unzip to continue. Aborting." >&2
    exit 1
  fi

  if ! [ -x "$(command -v java)" ]; then
    echo "Install java to continue. Aborting." >&2
    exit 1
  fi

  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-jmeter supports release installs only"
  fi

  local filename="apache-jmeter-$version"
  local filenameWithExtension="${filename}.zip"
  local release_file="$install_path/$filenameWithExtension"
  (
    mkdir -p "$install_path"
    download_release "$version" "$filenameWithExtension"
    cd ${CACHE_DIR} && unzip -q "${CACHE_DIR}/${filenameWithExtension}" || fail "Could not unzip ${CACHE_DIR}/${filenameWithExtension}"
    cd "${CACHE_DIR}/${filename}" && mv ./* "$install_path" || fail "Could not install jmeter, should have been in ${CACHE_DIR}/${filename}"

    local tool_cmd
    tool_cmd="jmeter"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."
    echo "jmeter $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing jmeter $version."
  )
}
