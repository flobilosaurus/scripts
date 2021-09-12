# Defined via `source`
function tf:clean --wraps=find\ .\ -type\ d\ -name\ \".terraform\ -prune\ -exec\ rm\ -rf\ \{​​\}\ \\\;\" --description alias\ tf:clean=find\ .\ -type\ d\ -name\ \".terraform\ -prune\ -exec\ rm\ -rf\ \{​​\}\ \\\;\"
  find . -type d -name ".terraform -prune -exec rm -rf {​​} \;" $argv; 
end
