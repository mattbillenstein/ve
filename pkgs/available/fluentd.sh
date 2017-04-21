$VENV/bin/gem install fluentd -v 0.14.8
#$VENV/bin/gem install fluent-plugin-secure-forward
$VENV/bin/gem specific_install -l https://github.com/mattbillenstein/fluent-plugin-secure-forward.git
$VENV/bin/fluent-gem install fluent-plugin-s3 -v 0.7.2
