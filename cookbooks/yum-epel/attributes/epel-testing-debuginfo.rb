default['yum']['epel-testing-debuginfo']['repositoryid'] = 'epel-testing-debuginfo'
default['yum']['epel-testing-debuginfo']['description'] = 'Extra Packages for $releasever - $basearch - Testing Debug'
case node['platform']
when 'amazon'
  default['yum']['epel-testing-debuginfo']['mirrorlist'] = 'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-debug-epel6&arch=$basearch'
  default['yum']['epel-testing-debuginfo']['gpgkey'] = 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
else
  default['yum']['epel-testing-debuginfo']['mirrorlist'] = 'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-debug-epel$releasever&arch=$basearch'
  default['yum']['epel-testing-debuginfo']['gpgkey'] = 'https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-$releasever'
end
default['yum']['epel-testing-debuginfo']['failovermethod'] = 'priority'
default['yum']['epel-testing-debuginfo']['gpgcheck'] = true
default['yum']['epel-testing-debuginfo']['enabled'] = false
default['yum']['epel-testing-debuginfo']['managed'] = false
default['yum']['epel-testing-debuginfo']['make_cache'] = true
