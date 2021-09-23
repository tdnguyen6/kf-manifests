local k = import 'k8s-libsonnet/1.21/main.libsonnet';
local sc = k.core.v1.secret;
local data = {
  'tls.crt': std.base64(importstr '/home/tidu/PKI/k8s.tt/k8s.tt.crt'),
  'tls.key': std.base64(importstr '/home/tidu/PKI/k8s.tt/k8s.tt.key'),
};

sc.new('k8s-tt-tls', data, 'kubernetes.io/tls')
+
sc.metadata.withAnnotations(
  {
    'kubed.appscode.com/sync': 'host=k8s-tt',
  }
)