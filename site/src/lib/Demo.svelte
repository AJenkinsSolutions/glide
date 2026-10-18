<script lang="ts">
	import { MediaQuery } from 'svelte/reactivity';
	import demo from '#lib/assets/demo.mp4';
	import demoSmall from '#lib/assets/demo-720.mp4';
	import poster from '#lib/assets/demo-poster.webp';

	const reducedMotion = new MediaQuery('(prefers-reduced-motion: reduce)', false);

	let paused = $state(true);
	let pausedByVisitor = false;

	function autoplay(video: HTMLVideoElement) {
		if (reducedMotion.current) return;
		const observer = new IntersectionObserver(([entry]) => {
			if (!entry.isIntersecting) video.pause();
			// Safari refuses autoplay in Low Power Mode; the play button still works then.
			else if (!pausedByVisitor) video.play().catch(() => {});
		});
		observer.observe(video);
		return () => {
			observer.disconnect();
			video.pause();
		};
	}

	function toggle() {
		pausedByVisitor = !paused;
		paused = !paused;
	}
</script>

<figure>
	<div class="frame">
		<video
			bind:paused
			{@attach autoplay}
			muted
			loop
			playsinline
			preload="metadata"
			{poster}
			width="2006"
			height="1350"
			aria-label="A Glide export of a dashboard tour: the view zooms in on clicks, follows the cursor, shows a caption and a ⌘S shortcut, then zooms back out."
		>
			<source src={demoSmall} type="video/mp4" media="(max-width: 640px)" />
			<source src={demo} type="video/mp4" />
		</video>
		<button
			type="button"
			class="playback"
			aria-label={paused ? 'Play the demo' : 'Pause the demo'}
			onclick={toggle}
		>
			<svg viewBox="0 0 24 24" aria-hidden="true">
				{#if paused}
					<path d="M8 5.5v13l10.5-6.5z" />
				{:else}
					<path d="M7 5h3.5v14H7zM13.5 5H17v14h-3.5z" />
				{/if}
			</svg>
		</button>
	</div>
	<figcaption>
		Exported by Glide from its built-in demo recording: 12 seconds at 60 fps, rendered in about 5
		seconds on an M4 Pro.
	</figcaption>
</figure>

<style>
	figure {
		margin: 56px 0 0;
	}

	.frame {
		position: relative;
		overflow: hidden;
		border-radius: 16px;
		background: #2a0d0a;
		box-shadow:
			0 0 0 1px var(--line),
			0 30px 80px -10px var(--shadow);
	}

	video {
		display: block;
		width: 100%;
		height: auto;
	}

	.playback {
		position: absolute;
		right: 14px;
		bottom: 14px;
		display: grid;
		place-items: center;
		width: 36px;
		height: 36px;
		padding: 0;
		border: 0;
		border-radius: 999px;
		background: rgb(0 0 0 / 0.45);
		color: #fff;
		opacity: 0.8;
		cursor: pointer;
		-webkit-backdrop-filter: blur(8px);
		backdrop-filter: blur(8px);
		transition: opacity 0.15s;
	}

	.playback:hover,
	.playback:focus-visible {
		opacity: 1;
	}

	.playback svg {
		width: 16px;
		height: 16px;
		fill: currentColor;
	}

	figcaption {
		margin-top: 16px;
		color: var(--muted);
		font: 12px/1.5 var(--mono);
		text-wrap: balance;
	}
</style>
