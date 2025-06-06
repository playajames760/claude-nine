# Deployment Guide - Claude Code Slash Commands

## Purpose
Production deployment commands for builds, releases, rollbacks, and infrastructure management. Save these as markdown files in `.claude/commands/deploy/` to use as slash commands.

## Setup
```bash
mkdir -p .claude/commands/deploy
# Save each command below as a .md file
# Example: save pre-deploy-check as .claude/commands/deploy/pre-check.md
# Usage in Claude: /project:deploy:pre-check
```

## Pre-Deployment Commands

### /project:deploy:pre-check
File: `.claude/commands/deploy/pre-check.md`
```markdown
Run comprehensive pre-deployment checklist:
1. Verify all tests are passing
2. Check for console.logs and debug code
3. Review environment variables needed
4. Validate build configuration
5. Check dependencies for security issues
6. Ensure database migrations are ready
7. Verify feature flags are configured
8. Review rollback plan
```

### /project:deploy:build-check
File: `.claude/commands/deploy/build-check.md`
```markdown
Analyze build for deployment readiness:
- Run production build locally
- Check bundle sizes against limits
- Verify all assets are included
- Test build in production mode
- Check for build warnings
- Validate environment-specific configs
- Ensure sourcemaps are properly configured
```

### /project:deploy:dependency-audit
File: `.claude/commands/deploy/dependency-audit.md`
```markdown
Audit dependencies before deployment:
1. Check for security vulnerabilities (npm audit, etc.)
2. Identify outdated production dependencies
3. Verify license compatibility
4. Check for deprecated packages
5. Analyze bundle size impact
6. Suggest fixes for any issues found
```

## Deployment Strategy Commands

### /project:deploy:strategy
File: `.claude/commands/deploy/strategy.md`
```markdown
Recommend deployment strategy for: $ARGUMENTS

Analyze and suggest:
- Blue-green deployment feasibility
- Rolling deployment approach
- Canary release percentage
- Feature flag strategy
- Database migration approach
- Rollback procedures
Consider current infrastructure and risk tolerance.
```

### /project:deploy:blue-green
File: `.claude/commands/deploy/blue-green.md`
```markdown
Guide blue-green deployment:
1. Verify infrastructure supports blue-green
2. Check current blue/green status
3. Deploy to inactive environment
4. Run smoke tests on new deployment
5. Plan traffic switch strategy
6. Prepare rollback commands
7. Document cutover steps
```

### /project:deploy:canary
File: `.claude/commands/deploy/canary.md`
```markdown
Set up canary deployment for: $ARGUMENTS

Steps:
1. Determine canary percentage (start with 5-10%)
2. Configure load balancer rules
3. Set up monitoring for canary
4. Define success metrics
5. Plan gradual rollout increments
6. Create automated rollback triggers
```

## Environment Management

### /project:deploy:env-check
File: `.claude/commands/deploy/env-check.md`
```markdown
Verify environment configuration for: $ARGUMENTS

Check:
- All required environment variables are set
- Secrets are properly stored (not in code)
- Database connection strings are correct
- API endpoints are environment-appropriate
- Feature flags match environment
- Third-party service configs are set
```

### /project:deploy:env-diff
File: `.claude/commands/deploy/env-diff.md`
```markdown
Compare environments to find discrepancies:
1. List all environment variables in each environment
2. Identify missing variables
3. Find value differences
4. Check for production-only settings
5. Verify secrets rotation status
6. Suggest synchronization steps
```

## Release Commands

### /project:deploy:release-notes
File: `.claude/commands/deploy/release-notes.md`
```markdown
Generate release notes for version: $ARGUMENTS

Include:
- New features (from feat: commits)
- Bug fixes (from fix: commits)
- Breaking changes
- Performance improvements
- Security updates
- Migration instructions
- Known issues
Format for both technical and user audiences.
```

### /project:deploy:tag-release
File: `.claude/commands/deploy/tag-release.md`
```markdown
Create release tag for deployment:
1. Determine version number (major.minor.patch)
2. Verify all changes are committed
3. Run final test suite
4. Create annotated tag with changelog
5. Push tag to remote
6. Trigger release workflow if configured
7. Update version in package files
```

### /project:deploy:hotfix
File: `.claude/commands/deploy/hotfix.md`
```markdown
Guide emergency hotfix deployment for: $ARGUMENTS

1. Create hotfix branch from production tag
2. Apply minimal fix
3. Test fix thoroughly
4. Fast-track through environments
5. Deploy with reduced canary period
6. Backport to development branch
7. Document incident and fix
```

## Monitoring Setup

### /project:deploy:monitoring
File: `.claude/commands/deploy/monitoring.md`
```markdown
Set up deployment monitoring:
1. Configure health check endpoints
2. Set up uptime monitoring
3. Create performance baselines
4. Configure error alerting
5. Set up custom metrics
6. Create dashboard for deployment
7. Test alerting channels
```

### /project:deploy:alerts
File: `.claude/commands/deploy/alerts.md`
```markdown
Configure deployment alerts for: $ARGUMENTS

Set up alerts for:
- Error rate thresholds
- Performance degradation
- Failed health checks
- Unusual traffic patterns
- Resource utilization
- Business metric anomalies
Include escalation procedures.
```

## Database Deployment

### /project:deploy:db-migration
File: `.claude/commands/deploy/db-migration.md`
```markdown
Plan database migration for deployment:
1. List pending migrations
2. Analyze migration impact
3. Estimate migration time
4. Check for breaking changes
5. Plan zero-downtime approach
6. Create rollback scripts
7. Test on staging data
```

### /project:deploy:db-backup
File: `.claude/commands/deploy/db-backup.md`
```markdown
Create pre-deployment database backup:
1. Verify backup location has space
2. Run full database backup
3. Test backup restoration
4. Document restore procedure
5. Calculate restore time
6. Store backup location details
7. Set retention policy
```

## Cloud Platform Commands

### /project:deploy:aws
File: `.claude/commands/deploy/aws.md`
```markdown
Deploy to AWS infrastructure:
1. Verify AWS credentials and permissions
2. Check service limits won't be exceeded
3. Update CloudFormation/CDK if needed
4. Deploy to staging environment first
5. Run AWS-specific health checks
6. Update Route53 if needed
7. Invalidate CloudFront cache
```

### /project:deploy:gcp
File: `.claude/commands/deploy/gcp.md`
```markdown
Deploy to Google Cloud Platform:
1. Verify GCP project and credentials
2. Check quotas and limits
3. Update Cloud Build configuration
4. Deploy to staging GKE cluster
5. Run GCP-specific health checks
6. Update Cloud Load Balancer
7. Clear CDN cache if needed
```

### /project:deploy:azure
File: `.claude/commands/deploy/azure.md`
```markdown
Deploy to Azure infrastructure:
1. Verify Azure subscription and permissions
2. Check resource limits
3. Update ARM templates if needed
4. Deploy to staging resource group
5. Run Azure-specific health checks
6. Update Traffic Manager
7. Clear Azure CDN cache
```

## Container Deployment

### /project:deploy:docker
File: `.claude/commands/deploy/docker.md`
```markdown
Build and deploy Docker containers:
1. Build production Docker image
2. Run security scan on image
3. Test container locally
4. Tag with version and latest
5. Push to container registry
6. Update deployment manifests
7. Verify image pulls successfully
```

### /project:deploy:k8s
File: `.claude/commands/deploy/k8s.md`
```markdown
Deploy to Kubernetes cluster:
1. Validate Kubernetes manifests
2. Check cluster resources available
3. Update image tags in deployments
4. Apply manifests with kubectl
5. Monitor pod rollout status
6. Run readiness checks
7. Update ingress if needed
```

## Rollback Commands

### /project:deploy:rollback-plan
File: `.claude/commands/deploy/rollback-plan.md`
```markdown
Create rollback plan for current deployment:
1. Document current version in production
2. List all changes being deployed
3. Identify rollback triggers
4. Calculate rollback time
5. Test rollback procedure
6. Document communication plan
7. Assign rollback responsibilities
```

### /project:deploy:rollback-execute
File: `.claude/commands/deploy/rollback-execute.md`
```markdown
Execute emergency rollback:
1. Confirm rollback decision
2. Switch traffic to previous version
3. Verify service is restored
4. Check for data consistency
5. Communicate status to stakeholders
6. Document incident timeline
7. Plan forward fix approach
```

## Post-Deployment Commands

### /project:deploy:smoke-test
File: `.claude/commands/deploy/smoke-test.md`
```markdown
Run post-deployment smoke tests:
1. Test critical user paths
2. Verify API endpoints respond
3. Check database connectivity
4. Test authentication flows
5. Verify third-party integrations
6. Check performance metrics
7. Monitor error rates
```

### /project:deploy:verify
File: `.claude/commands/deploy/verify.md`
```markdown
Comprehensive deployment verification:
- All services are responding
- No increase in error rates
- Performance within thresholds
- Features working as expected
- Monitoring is active
- Logs are being collected
- Backups are running
```

## CI/CD Pipeline Commands

### /project:deploy:pipeline-check
File: `.claude/commands/deploy/pipeline-check.md`
```markdown
Verify CI/CD pipeline status:
1. Check all pipeline stages passed
2. Review test coverage metrics
3. Verify security scans passed
4. Check artifact creation
5. Validate deployment approvals
6. Ensure notifications work
7. Test pipeline rollback
```

### /project:deploy:pipeline-fix
File: `.claude/commands/deploy/pipeline-fix.md`
```markdown
Debug and fix pipeline failure: $ARGUMENTS

1. Identify failing stage
2. Analyze error logs
3. Check for environment issues
4. Verify dependencies available
5. Test fix locally
6. Update pipeline configuration
7. Re-run pipeline
```

## Security Deployment

### /project:deploy:security-check
File: `.claude/commands/deploy/security-check.md`
```markdown
Pre-deployment security checklist:
1. Scan for vulnerable dependencies
2. Check for exposed secrets
3. Verify HTTPS configuration
4. Test authentication systems
5. Check CORS settings
6. Verify API rate limiting
7. Test security headers
```

### /project:deploy:ssl-cert
File: `.claude/commands/deploy/ssl-cert.md`
```markdown
Manage SSL certificates for deployment:
1. Check certificate expiration dates
2. Verify certificate chain
3. Test SSL configuration
4. Update certificate if needed
5. Configure auto-renewal
6. Test HTTPS redirect
7. Verify HSTS headers
```

## Quick Deployment Commands

### /project:deploy:status
File: `.claude/commands/deploy/status.md`
```markdown
Show current deployment status:
- Environment versions
- Last deployment time
- Active feature flags
- Health check status
- Recent deployment history
- Pending migrations
- Next deployment window
```

### /project:deploy:checklist
File: `.claude/commands/deploy/checklist.md`
```markdown
Interactive deployment checklist:
□ Code review completed
□ Tests passing
□ Documentation updated
□ Database migrations ready
□ Environment variables set
□ Monitoring configured
□ Rollback plan documented
□ Team notified
```

## Usage Tips

1. **Progressive Deployment**: Start with staging, then canary, then full
2. **Always Have Rollback**: Never deploy without a tested rollback plan
3. **Monitor Actively**: Watch metrics during and after deployment
4. **Document Everything**: Keep deployment logs and decisions
5. **Automate Checks**: Use these commands in your CI/CD pipeline

Remember: Deployment commands should prioritize safety and observability. Always verify before proceeding.