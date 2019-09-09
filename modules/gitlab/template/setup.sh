#!/usr/bin/env bash

DNS_NAME="${DNS_NAME}"
WORK_DIR="${WORK_DIR}"

# external_url 'http://ec2-0-0-0-0.compute-1.amazonaws.com'

# git_data_dirs({
#   "default" => { "path" => "/mnt/gitlab-data" }
# })

if [ "${DNS_NAME}" != "" ]; then
    sed -i -e "s@^external_url .*@external_url \"http://${DNS_NAME}\"@g" /etc/gitlab/gitlab.rb

    gitlab-ctl reconfigure
fi
