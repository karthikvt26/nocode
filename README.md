# nocode

To deploy a particular branch to master of your server

`
make deploy-and-clear -e REMOTEVAL=random -e ZONE_ID=<zone-id-of-your-cloudflare-account> -e AUTH_EMAIL=<cf-account-email> -e AUTH_KEY=<cf-auth-key>
`


The above command will deploy `random` branch to master of your server and will clear the cf cache associated with the above account.
