# SOURAJIT VFX CLOUD

Neon, mobile-friendly browser terminal running a real Bash shell inside a Docker container. Includes password login, WebSocket PTY, workspace file APIs, uploads, and Docker build workflow.

## Deploy on Render / Koyeb
1. Connect this GitHub repository.
2. Select **Docker** deployment.
3. Set environment variables:
   - `CLOUD_PASSWORD`: unique password, at least 12 characters
   - `SESSION_SECRET`: random secret of at least 32 characters (e.g. `openssl rand -hex 32`)
   - `COOKIE_SECURE`: `true` on HTTPS hosts
   - `PORT`: supplied by platform, normally automatic
4. Deploy. Health check: `/api/health`.

**Important:** These platforms may not support persistent disks or unrestricted shell workloads on all plans. Shell state/files can be lost on redeploy unless a persistent disk is attached and mounted at `/workspace`. GitHub Actions cron does not keep a web service alive 24/7. Never expose this terminal publicly without a strong password and HTTPS. This is a single-owner admin terminal, not a public multi-tenant sandbox.
