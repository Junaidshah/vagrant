default['yum']['epel-debuginfo']['repositoryid'] = 'epel-debuginfo'
default['yum']['epel-debuginfo']['description'] = 'Extra Packages for $releasever - $basearch - Debug'
case node['platform']
when 'amazon'
  default['yum']['epel-debuginfo']['mirrorlist'] = 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-6&arch=$basearch'
  default['yum']['epel-debuginfo']['gpgkey'] = 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
else
  default['yum']['epel-debuginfo']['mirrorlist'] = 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-$releasever&arch=$basearch'
  default['yum']['epel-debuginfo']['gpgkey'] = 'https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-$releasever'
end
default['yum']['epel-debuginfo']['failovermethod'] = 'priority'
default['yum']['epel-debuginfo']['gpgcheck'] = true
default['yum']['epel-debuginfo']['enabled'] = false
default['yum']['epel-debuginfo']['managed'] = false
default['yum']['epel-debuginfo']['make_cache'] = true
