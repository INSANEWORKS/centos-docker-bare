name             'docker'
maintainer       'INSANEWORKS,LLC'
maintainer_email 'webmaster@insaneworks.co.jp'
license          'All rights reserved'
description      'Installs/Configures default'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{yum}.each do |dp|
  depends dp
end
