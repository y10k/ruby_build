#!/bin/sh

ruby_path="${1:-/usr/local/bin/ruby}"

if [ -x "${ruby_path}" ]; then
  exec "${ruby_path}" -r rbconfig -r yaml -e 'puts({ "ruby_exists" => true, "rbconfig" => RbConfig::CONFIG }.to_yaml)'
else
  echo 'ruby_exists: false'
fi
