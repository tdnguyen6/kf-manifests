local k = import 'k8s-libsonnet/1.21/main.libsonnet';
local sc = k.core.v1.secret;
local data = {
  'ca.crt': std.base64(importstr '/home/tidu/PKI/ca/ca.crt'),
};

sc.new('tidu-root-ca', data)
+
sc.metadata.withAnnotations(
  {
    'kubed.appscode.com/sync': '',
  }
)