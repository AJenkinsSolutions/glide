<script lang="ts">
	import { browser } from '$app/env';
	import { MediaQuery } from 'svelte/reactivity';

	type Theme = 'light' | 'dark';

	const systemDark = new MediaQuery('(prefers-color-scheme: dark)', false);

	// app.html applies a stored choice before first paint; pick it up from there.
	function storedTheme(): Theme | undefined {
		const theme = browser ? document.documentElement.dataset.theme : undefined;
		return theme === 'light' || theme === 'dark' ? theme : undefined;
	}

	let chosen = $state(storedTheme());
	let dark = $derived(chosen ? chosen === 'dark' : systemDark.current);

	function toggle() {
		const next: Theme = dark ? 'light' : 'dark';
		const system: Theme = systemDark.current ? 'dark' : 'light';
		// Choosing what the system already shows goes back to following the system.
		chosen = next === system ? undefined : next;
		const root = document.documentElement;
		try {
			if (chosen) {
				root.dataset.theme = chosen;
				localStorage.setItem('theme', chosen);
			} else {
				delete root.dataset.theme;
				localStorage.removeItem('theme');
			}
		} catch {
			// Storage can be unavailable (private windows, blocked cookies); the theme still applies.
		}
	}
</script>

<button type="button" class="toggle" aria-label="Dark theme" aria-pressed={dark} onclick={toggle}>
	<svg class="sun" viewBox="0 0 24 24" aria-hidden="true">
		<circle cx="12" cy="12" r="4" />
		<path
			d="M12 2.5v2M12 19.5v2M4.6 4.6l1.4 1.4M18 18l1.4 1.4M2.5 12h2M19.5 12h2M4.6 19.4 6 18M18 6l1.4-1.4"
		/>
	</svg>
	<svg class="moon" viewBox="0 0 24 24" aria-hidden="true">
		<path d="M20.5 14.2A8.5 8.5 0 1 1 9.8 3.5a7 7 0 0 0 10.7 10.7Z" />
	</svg>
</button>

<style>
	.toggle {
		position: absolute;
		top: 20px;
		right: 20px;
		display: grid;
		place-items: center;
		width: 40px;
		height: 40px;
		padding: 0;
		border: 1px solid var(--line);
		border-radius: 999px;
		background: var(--card);
		color: var(--muted);
		cursor: pointer;
		transition:
			color 0.15s,
			border-color 0.15s;
	}

	.toggle:hover {
		color: var(--fg);
	}

	svg {
		grid-area: 1 / 1;
		width: 18px;
		height: 18px;
		fill: none;
		stroke: currentColor;
		stroke-width: 1.8;
		stroke-linecap: round;
		stroke-linejoin: round;
	}

	/* The icon shows the theme a click switches to; CSS picks it so it's right before hydration. */
	.sun {
		display: none;
	}

	:global(:root[data-theme='dark']) .sun {
		display: block;
	}

	:global(:root[data-theme='dark']) .moon {
		display: none;
	}

	@media (prefers-color-scheme: dark) {
		:global(:root:not([data-theme='light'])) .sun {
			display: block;
		}

		:global(:root:not([data-theme='light'])) .moon {
			display: none;
		}
	}
</style>
