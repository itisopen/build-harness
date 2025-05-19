# Cloudflare Module for Build-Harness

## Overview
This module provides integration with Cloudflare services using the Wrangler CLI. It supports managing Cloudflare Workers, Pages, R2 storage, KV namespaces, D1 databases, and Durable Objects. The module includes Makefiles for common tasks such as authentication, deployment, and resource management.

## Prerequisites
- Node.js and npm installed
- Wrangler CLI installed (`npm install -g wrangler`) or use the provided Makefile target to install
- Cloudflare account with API token and account ID
- Proper environment variables set for authentication (`CLOUDFLARE_API_TOKEN`, `CLOUDFLARE_ACCOUNT_ID`)

## Environment Setup
Source the `cloudflare.bash.rc` script to set environment variables and update your PATH if Wrangler is installed locally:
```bash
source modules/cloudflare/cloudflare.bash.rc
```

## Usage

### Authentication
- `make -f modules/cloudflare/Makefile.auth cloudflare/auth/login`  
  Login interactively to Cloudflare.
- `make -f modules/cloudflare/Makefile.auth cloudflare/auth/logout`  
  Logout from Cloudflare.
- `make -f modules/cloudflare/Makefile.auth cloudflare/auth/whoami`  
  Show current authentication status.
- `make -f modules/cloudflare/Makefile.auth cloudflare/auth/check`  
  Check if authentication token is valid.

### Workers
- Initialize a new Worker project:  
  `make -f modules/cloudflare/Makefile.workers cloudflare/workers/init WORKER_NAME=my-worker`
- Start local development server:  
  `make -f modules/cloudflare/Makefile.workers cloudflare/workers/dev WORKER_DIR=./my-worker`
- Publish Worker:  
  `make -f modules/cloudflare/Makefile.workers cloudflare/workers/publish WORKER_DIR=./my-worker WORKER_ENV=production`
- Delete Worker:  
  `make -f modules/cloudflare/Makefile.workers cloudflare/workers/delete WORKER_NAME=my-worker WORKER_ENV=production`

### Pages
- Create a new Pages project:  
  `make -f modules/cloudflare/Makefile.pages cloudflare/pages/init PAGES_PROJECT=my-project`
- Start local development server:  
  `make -f modules/cloudflare/Makefile.pages cloudflare/pages/dev PAGES_DIR=./my-pages PAGES_BUILD_DIR=dist`
- Deploy Pages project:  
  `make -f modules/cloudflare/Makefile.pages cloudflare/pages/deploy PAGES_PROJECT=my-project PAGES_DIR=./my-pages PAGES_BUILD_DIR=dist PAGES_ENV=production`
- Delete Pages project:  
  `make -f modules/cloudflare/Makefile.pages cloudflare/pages/delete PAGES_PROJECT=my-project`

### R2 Storage
- Create, list, delete buckets and upload/download/delete objects using the targets in `Makefile.r2`.

### KV Namespaces
- Manage KV namespaces and keys with targets in `Makefile.kv`.

### D1 Database
- Create, list, delete databases, execute SQL, and manage migrations with targets in `Makefile.d1`.

### Durable Objects
- List, get info, and delete Durable Objects with targets in `Makefile.do`.

## Environment Variables
- `CLOUDFLARE_API_TOKEN`: Your Cloudflare API token.
- `CLOUDFLARE_ACCOUNT_ID`: Your Cloudflare account ID.
- Other variables as required by specific Makefile targets (e.g., `WORKER_NAME`, `PAGES_PROJECT`, `R2_BUCKET`, etc.)

## Troubleshooting
- Ensure Wrangler CLI is installed and accessible in your PATH.
- Verify your API token and account ID are correctly set in environment variables.
- Use `make -f modules/cloudflare/Makefile.auth cloudflare/auth/check` to verify authentication.
- Check Wrangler documentation for detailed error messages and usage.

## References
- [Wrangler CLI Documentation](https://developers.cloudflare.com/workers/cli-wrangler)
- [Cloudflare Workers](https://developers.cloudflare.com/workers/)
- [Cloudflare Pages](https://developers.cloudflare.com/pages/)
- [Cloudflare R2](https://developers.cloudflare.com/r2/)
- [Cloudflare KV](https://developers.cloudflare.com/workers/runtime-apis/kv/)
- [Cloudflare D1](https://developers.cloudflare.com/d1/)
- [Cloudflare Durable Objects](https://developers.cloudflare.com/workers/runtime-apis/durable-objects/)
