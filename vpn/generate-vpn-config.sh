#!/usr/local/bin/fish
set BEFORE (pwd)
set CURRENT_DIR (dirname (status -f))
cd $CURRENT_DIR
IFS="" eval (gslurp)
printf "remote $CLIENT_VPN_ENDPOINT 443\n\n$OPEN_VPN_BASE_CONFIG\n\n<ca>\n$TF_VAR_vpn_certificate_authority\n</ca>\n<cert>\n$TF_VAR_vpn_certificate_client_body\n</cert>\n<key>\n$TF_VAR_vpn_certificate_client_private_key\n</key>\n" > $BEFORE/dto-aws-client-vpn-config.ovpn
