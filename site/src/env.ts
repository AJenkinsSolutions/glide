import { defineEnvVars } from '@sveltejs/kit/env';

export const variables = defineEnvVars({
	VERCEL_PROJECT_PRODUCTION_URL: {
		public: true,
		static: true,
		description:
			"The site's origin for absolute Open Graph URLs: https:// plus the production domain Vercel sets at build time, or the preview server's origin for local builds",
		schema: (domain) => (domain ? `https://${domain}` : 'http://localhost:4173')
	}
});
