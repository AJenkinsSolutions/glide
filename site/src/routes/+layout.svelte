<script lang="ts">
	import '@fontsource-variable/inter/opsz.css';
	import '../app.css';
	import inter from '@fontsource-variable/inter/files/inter-latin-opsz-normal.woff2?url';
	import type { LayoutProps } from './$types';

	let { children }: LayoutProps = $props();
</script>

<svelte:head>
	<link rel="preload" as="font" type="font/woff2" href={inter} crossorigin="anonymous" />
</svelte:head>

{@render children()}
