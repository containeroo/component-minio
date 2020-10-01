// main template for minio
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.minio;

// Define outputs below
{
  "minio-credentials": kube.Secret(params.helmValues.existingSecret) {
    stringData: {
      accesskey: params.minioCredentialsSecret.accesskey,
      secretkey: params.minioCredentialsSecret.secretkey,
    },
    metadata+: {
      namespace: params.namespace,
    },
  },
  namespace: kube.Namespace(params.namespace),
  "extraYAMLs": std.manifestYamlStream(params.extraYAMLs),
}
