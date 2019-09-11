#!/usr/bin/env bash
set -e -x

DNS_NAME="${DNS_NAME}"
TOKEN="${TOKEN}"

# external_url 'http://ec2-0-0-0-0.compute-1.amazonaws.com'

# git_data_dirs({
#   "default" => { "path" => "/mnt/gitlab-data" }
# })

if [ "$DNS_NAME" != "" ]; then
    sed -i -e "s@^external_url .*@external_url \"http://$DNS_NAME\"@g" /etc/gitlab/gitlab.rb

    gitlab-ctl reconfigure
fi

# slack
if [ "$TOKEN" != "" ]; then
curl -sL opspresso.com/tools/slack | bash -s -- \
    --token="$TOKEN" --username="gitlab" \
    --footer_icon='https://about.gitlab.com/ico/favicon.ico' \
    --footer="<https://$DNS_NAME|gitlab>" \
    --title="Launched Gitlab"
fi
