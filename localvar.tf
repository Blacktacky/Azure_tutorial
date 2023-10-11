sql_server=[for f in fileset("${path.module}/yaml", "[^_]*.yaml") : yamldecode(file("${path.module}/yaml/${f}"))]
  sql_server_list = flatten([
  for app in local.sql_server : [
      for sqlservers in try(app.listoflinuxapp, []) :{
        name=sqlservers.name
        version:sqlserver.version
              }
