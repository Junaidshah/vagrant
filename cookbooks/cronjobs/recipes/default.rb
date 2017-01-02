#
# Cookbook Name:: cronjobs
# Recipe:: default
#
# Copyright 2015, KMKLABS
#
# All rights reserved - Do Not Redistribute
#

if !node['cronjobs'].nil?
  node['cronjobs'].each do | cronjob, cronjob_props |
    Chef::Log.info cronjob
    Chef::Log.info cronjob_props["hour"]
    cron cronjob do
      hour cronjob_props["hour"]
      minute cronjob_props["minute"]
      weekday cronjob_props["weekday"]
      user cronjob_props["user"]
      command cronjob_props["command"]
    end
  end
end
