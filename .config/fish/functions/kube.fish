# Defined in - @ line 1
function kube --wraps=kubectl --description 'alias kube kubectl'
  kubectl  $argv;
end
