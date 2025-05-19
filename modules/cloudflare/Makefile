WRANGLER ?= wrangler
CLOUDFLARE_ACCOUNT_ID ?= $(CF_ACCOUNT_ID)
CLOUDFLARE_API_TOKEN ?= $(CF_API_TOKEN)
CLOUDFLARE_CONFIG_PATH ?= .wrangler

.PHONY: cloudflare/install cloudflare/version cloudflare/help

## Install Wrangler CLI
cloudflare/install:
	@npm install -g wrangler

## Display Wrangler version
cloudflare/version:
	@$(WRANGLER) --version

## Show Wrangler help
cloudflare/help:
	@$(WRANGLER) --help
