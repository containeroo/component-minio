local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.minio;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('minio', params.namespace, secrets=true);

{
  minio: app,
}
