DO_SCRIPT ?= 
DO_CLASS ?=

.PHONY: cloudflare/do/list cloudflare/do/get cloudflare/do/delete

## List all Durable Objects
cloudflare/do/list:
	@$(WRANGLER) durableobjects list

## Get information about a specific Durable Object
cloudflare/do/get:
	$(call assert-set,DO_SCRIPT)
	$(call assert-set,DO_CLASS)
	@$(WRANGLER) durableobjects get $(DO_SCRIPT) $(DO_CLASS)

## Delete a Durable Object
cloudflare/do/delete:
	$(call assert-set,DO_SCRIPT)
	$(call assert-set,DO_CLASS)
	@$(WRANGLER) durableobjects delete $(DO_SCRIPT) $(DO_CLASS)
