# General settings
default['sonar']['dir']                    = "/opt/sonar"
default['sonar']['version']                = "4.5"
default['sonar']['checksum']               = "a39a52a29344b422029bd8b04d1cb84d"
default['sonar']['os_kernel']              = "linux-x86-64"
default['sonar']['mirror']                 = "http://dist.sonar.codehaus.org/"
default['sonar']['web_template'] = 'default'
default['sonar']['web_host'] = '127.0.0.1'
default['sonar']['web_domain'] = node['fqdn']


default['sonar']['properties'] = {
  'sonar.jdbc.username' => 'sonar',
  'sonar.jdbc.password' => 'sonar',
  'sonar.jdbc.url' => 'jdbc:derby://localhost:1527/sonar;create=true',
  'sonar.jdbc.maxActive' => 20,
  'sonar.jdbc.maxIdle' => 5,
  'sonar.jdbc.minIdle' => 2,
  'sonar.jdbc.maxWait' => 5000,
  'sonar.jdbc.minEvictableIdleTimeMillis' => 600000,
  'sonar.jdbc.timeBetweenEvictionRunsMillis' => 30000,
  'sonar.web.host' => '0.0.0.0',
  'sonar.web.context' => '/',
  'sonar.web.port' => 9000,
}


default['sonar']['wrapper_properties'] = {
  'wrapper.java.additional.1' => '-Djava.awt.headless=true',
  'wrapper.java.additional.2' => '-XX:MaxPermSize=1024',
  'wrapper.java.initmemory' => 2048,
  'wrapper.java.maxmemory' => 4096,
  'wrapper.java.command' => 'java',
  'wrapper.java.mainclass' => 'org.tanukisoftware.wrapper.WrapperSimpleApp',
  'wrapper.java.classpath.1' => '../../lib/jsw/*.jar',
  'wrapper.java.classpath.2' => '../../lib/*.jar',
  'wrapper.java.classpath.3' => '../../extensions/jdbc-driver/derby/*.jar',
  'wrapper.java.classpath.4' => '../../extensions/jdbc-driver/mysql/*.jar',
  'wrapper.java.classpath.5' => '../../extensions/jdbc-driver/oracle/*.jar',
  'wrapper.java.classpath.6' => '../../extensions/jdbc-driver/postgresql/*.jar',
  'wrapper.java.classpath.7' => '../../extensions/jdbc-driver/mssql/*.jar',
  'wrapper.java.library.path.1' => './lib',
  'wrapper.app.parameter.1' => 'org.sonar.application.App',
  'wrapper.console.format' => 'PM',
  'wrapper.console.loglevel' => 'NONE',
  'wrapper.logfile' => '../../logs/sonar.log',
  'wrapper.logfile.format' => 'LPTM',
  'wrapper.logfile.loglevel' => 'INFO',
  'wrapper.logfile.maxsize' => 0,
  'wrapper.syslog.loglevel' => 'NONE',
  'wrapper.console.title' => 'Sonar',
  'wrapper.ntservice.name' => 'Sonar',
  'wrapper.ntservice.displayname' => 'Sonar',
  'wrapper.ntservice.description' => 'Sonar',
  'wrapper.ntservice.starttype' => 'AUTO_START',
  'wrapper.ntservice.interactive' => 'false',
  'wrapper.ping.timeout' => '240'
}

