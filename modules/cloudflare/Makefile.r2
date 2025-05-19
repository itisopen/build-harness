R2_BUCKET ?= my-bucket
R2_FILE ?= 
R2_KEY ?=

.PHONY: cloudflare/r2/bucket/create cloudflare/r2/bucket/list cloudflare/r2/bucket/delete cloudflare/r2/object/upload cloudflare/r2/object/download cloudflare/r2/object/delete

## Create a new R2 bucket
cloudflare/r2/bucket/create:
	$(call assert-set,R2_BUCKET)
	@$(WRANGLER) r2 bucket create $(R2_BUCKET)

## List all R2 buckets
cloudflare/r2/bucket/list:
	@$(WRANGLER) r2 bucket list

## Delete an R2 bucket
cloudflare/r2/bucket/delete:
	$(call assert-set,R2_BUCKET)
	@$(WRANGLER) r2 bucket delete $(R2_BUCKET)

## Upload a file to R2
cloudflare/r2/object/upload:
	$(call assert-set,R2_BUCKET)
	$(call assert-set,R2_FILE)
	$(call assert-set,R2_KEY)
	@$(WRANGLER) r2 object put $(R2_BUCKET)/$(R2_KEY) --file=$(R2_FILE)

## Download a file from R2
cloudflare/r2/object/download:
	$(call assert-set,R2_BUCKET)
	$(call assert-set,R2_KEY)
	$(call assert-set,R2_FILE)
	@$(WRANGLER) r2 object get $(R2_BUCKET)/$(R2_KEY) --file=$(R2_FILE)

## Delete an object from R2
cloudflare/r2/object/delete:
	$(call assert-set,R2_BUCKET)
	$(call assert-set,R2_KEY)
	@$(WRANGLER) r2 object delete $(R2_BUCKET)/$(R2_KEY)
