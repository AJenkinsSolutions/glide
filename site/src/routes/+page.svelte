<script lang="ts">
	import { VERCEL_PROJECT_PRODUCTION_URL as origin } from '$app/env/public';
	import Demo from '#lib/Demo.svelte';
	import ThemeToggle from '#lib/ThemeToggle.svelte';
	import { chips, macos, repo, version } from '#lib/site.js';
	import icon from '#lib/assets/icon.webp';
	import editorDark from '#lib/assets/editor.webp';
	import editorDarkSmall from '#lib/assets/editor-1000.webp';
	import editorLight from '#lib/assets/editor-light.webp';
	import editorLightSmall from '#lib/assets/editor-light-1000.webp';

	const title = 'Glide: an open-source screen recorder for polished product videos';
	const description =
		'An open-source, native screen recorder for the Mac. Glide zooms in on what you click, smooths the cursor and frames your screen for polished product videos.';
	const shotSizes = '(min-width: 1080px) 1032px, calc(100vw - 48px)';
</script>

<svelte:head>
	<title>{title}</title>
	<meta name="description" content={description} />
	<link rel="canonical" href={origin} />
	<meta property="og:type" content="website" />
	<meta property="og:url" content={origin} />
	<meta property="og:title" content={title} />
	<meta property="og:description" content={description} />
	<meta property="og:image" content="{origin}/og.jpg" />
	<meta property="og:image:width" content="1200" />
	<meta property="og:image:height" content="630" />
	<meta
		property="og:image:alt"
		content="The Glide app icon beside a Glide export: a window framed on a red and orange wallpaper."
	/>
	<meta name="twitter:card" content="summary_large_image" />
	<meta name="twitter:title" content={title} />
	<meta name="twitter:description" content={description} />
	<meta name="twitter:image" content="{origin}/og.jpg" />
</svelte:head>

<div class="wrap">
	<ThemeToggle />

	<main>
		<section class="hero">
			<img class="icon" src={icon} width="112" height="112" alt="Glide app icon" />
			<h1>Product videos, in one take.</h1>
			<p class="lede">
				An open-source, native screen recorder for the Mac. Glide zooms in on what you click,
				smooths the cursor and frames your screen on a background, then exports MP4 or GIF, usually
				several times faster than real time.
			</p>
			<div class="actions">
				<a class="btn primary" href="/download" data-sveltekit-reload>
					<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 3v12M6 11l6 6 6-6M5 21h14" /></svg>
					Download for Mac
				</a>
				<a class="btn secondary" href={repo}>
					<svg viewBox="0 0 24 24" aria-hidden="true">
						<path
							class="mark"
							d="M12 1.5a10.5 10.5 0 0 0-3.32 20.46c.53.1.72-.23.72-.5v-1.8c-2.92.63-3.54-1.4-3.54-1.4-.48-1.22-1.17-1.54-1.17-1.54-.95-.65.08-.64.08-.64 1.05.08 1.6 1.08 1.6 1.08.94 1.6 2.46 1.14 3.06.87.1-.68.37-1.14.66-1.4-2.33-.27-4.78-1.17-4.78-5.18 0-1.15.41-2.08 1.08-2.82-.1-.27-.47-1.34.1-2.79 0 0 .88-.28 2.89 1.08a10 10 0 0 1 5.26 0c2-1.36 2.88-1.08 2.88-1.08.58 1.45.21 2.52.1 2.79.68.74 1.08 1.67 1.08 2.82 0 4.02-2.45 4.9-4.79 5.16.38.33.71.97.71 1.96v2.9c0 .28.19.61.73.5A10.5 10.5 0 0 0 12 1.5Z"
						/>
					</svg>
					View on GitHub
				</a>
			</div>
			<p class="meta">
				Version {version} · {macos} · {chips} · Free and <a href={repo}>open source</a>
			</p>
			<Demo />
		</section>

		<section class="features" aria-label="Features">
			<div class="card">
				<svg viewBox="0 0 24 24" aria-hidden="true">
					<circle cx="10.5" cy="10.5" r="6.5" /><path d="m15.5 15.5 5 5M10.5 8v5M8 10.5h5" />
				</svg>
				<h3>Zooms that follow your clicks</h3>
				<p>
					Glide zooms in on what you click with spring physics and motion blur, then glides back
					out. Add manual or follow-the-mouse zooms on the timeline.
				</p>
			</div>
			<div class="card">
				<svg viewBox="0 0 24 24" aria-hidden="true">
					<path d="M6 3.5v15.5l4.3-4.1 2.9 6.1 2.7-1.3-2.9-6h6z" />
				</svg>
				<h3>A cursor worth watching</h3>
				<p>
					Re-rendered at high resolution and smoothed, with tilt, press feedback, click ripples and
					hiding when idle. Click sounds if you want them.
				</p>
			</div>
			<div class="card">
				<svg viewBox="0 0 24 24" aria-hidden="true">
					<rect x="2.5" y="4" width="19" height="16" rx="3" /><rect
						x="6.5"
						y="8"
						width="11"
						height="8"
						rx="1.5"
					/>
				</svg>
				<h3>Framed for you</h3>
				<p>
					Generated wallpapers, gradients or your own image behind padding, rounded corners and a
					shadow. Laptop, phone and tablet frames, and presets for your style.
				</p>
			</div>
			<div class="card">
				<svg viewBox="0 0 24 24" aria-hidden="true">
					<circle cx="12" cy="12" r="8.5" /><circle class="dot" cx="12" cy="12" r="3.5" />
				</svg>
				<h3>Record anything</h3>
				<p>
					A display, a window, an area or a USB iPhone or iPad, with system audio, microphone and
					camera. Start from anywhere with <kbd>⌥⇧⌘R</kbd>.
				</p>
			</div>
			<div class="card">
				<svg viewBox="0 0 24 24" aria-hidden="true">
					<rect x="2.5" y="5" width="19" height="14" rx="3" /><path
						d="M10.5 10.2a2.6 2.6 0 1 0 0 3.6M17 10.2a2.6 2.6 0 1 0 0 3.6"
					/>
				</svg>
				<h3>Edit, caption, export</h3>
				<p>
					Trim, split and speed up typing. Blur private details, caption on device with Whisper, and
					export MP4 or GIF from 720p to 4K.
				</p>
			</div>
			<div class="card">
				<svg viewBox="0 0 24 24" aria-hidden="true">
					<path d="M8.5 7 3.5 12l5 5M15.5 7l5 5-5 5" />
				</svg>
				<h3>Native and open source</h3>
				<p>
					Written in Rust, drawn on the GPU and encoded in hardware: recording a 5K display takes
					about 10% of one CPU core. The code is <a href={repo}>on GitHub</a>.
				</p>
			</div>
		</section>

		<section class="editor">
			<h2>One window, from recording to export.</h2>
			<p>
				Glide opens on recording setup with a live preview of your source. Stop recording and
				you're in the editor: timeline, zooms, masks, captions and styles, all previewed live on the
				GPU.
			</p>
			<div class="shot">
				<img
					class="light"
					src={editorLight}
					srcset="{editorLightSmall} 1000w, {editorLight} 1600w"
					sizes={shotSizes}
					width="1600"
					height="1018"
					loading="lazy"
					decoding="async"
					alt="Glide's editor in light mode: a recording in a laptop frame with a caption, and settings for zoom animation and motion blur."
				/>
				<img
					class="dark"
					src={editorDark}
					srcset="{editorDarkSmall} 1000w, {editorDark} 1600w"
					sizes={shotSizes}
					width="1600"
					height="1018"
					loading="lazy"
					decoding="async"
					alt="Glide's editor in dark mode: a recording on a wallpaper, a timeline with an automatic 2× zoom, and background, frame and shadow settings."
				/>
			</div>
		</section>
	</main>

	<footer>
		<p>
			Requires {macos} on a Mac with {chips}. Free under the MIT or Apache 2.0 license, with the
			source on <a href={repo}>GitHub</a>. Made by <a href="https://rasmic.xyz">Micky</a>.
		</p>
		<p class="note">
			Glide is an open-source alternative to Screen Studio, built in Rust. It is not affiliated with
			or endorsed by Screen Studio or its authors and contains none of its code or assets.
		</p>
	</footer>
</div>

<style>
	.wrap {
		position: relative;
		max-width: 1080px;
		margin: 0 auto;
		padding: 0 24px;
	}

	.hero {
		padding: 96px 0 0;
		text-align: center;
	}

	.icon {
		display: block;
		margin: 0 auto;
	}

	h1 {
		margin: 20px 0 14px;
		font-size: clamp(40px, 7vw, 64px);
		font-weight: 650;
		line-height: 1.04;
		letter-spacing: -0.035em;
	}

	.lede {
		max-width: 680px;
		margin: 0 auto 32px;
		color: var(--muted);
		font-size: 19px;
	}

	.actions {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		gap: 12px;
	}

	.btn {
		display: inline-flex;
		align-items: center;
		gap: 10px;
		padding: 13px 22px;
		border-radius: 12px;
		font-weight: 600;
		text-decoration: none;
		transition:
			transform 0.15s,
			box-shadow 0.15s,
			background-color 0.15s,
			border-color 0.15s;
	}

	.btn:hover {
		transform: translateY(-1px);
	}

	.btn svg {
		width: 18px;
		height: 18px;
		fill: none;
		stroke: currentColor;
		stroke-width: 2.2;
		stroke-linecap: round;
		stroke-linejoin: round;
	}

	.btn .mark {
		fill: currentColor;
		stroke: none;
	}

	.primary {
		background: var(--accent);
		color: #fff;
		box-shadow:
			inset 0 1px 0 rgb(255 255 255 / 0.18),
			0 6px 18px rgb(214 40 31 / 0.28);
	}

	.primary:hover {
		background: var(--accent-hover);
		box-shadow:
			inset 0 1px 0 rgb(255 255 255 / 0.18),
			0 10px 24px rgb(214 40 31 / 0.34);
	}

	.secondary {
		border: 1px solid var(--line);
		background: var(--card);
		color: var(--fg);
	}

	.secondary:hover {
		border-color: var(--muted);
	}

	.meta {
		margin-top: 16px;
		color: var(--muted);
		font-size: 13px;
		text-wrap: balance;
	}

	.features {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
		gap: 16px;
		padding: 88px 0 0;
	}

	.card {
		padding: 22px;
		border: 1px solid var(--line);
		border-radius: 14px;
		background: var(--card);
	}

	.card svg {
		width: 22px;
		height: 22px;
		margin-bottom: 14px;
		fill: none;
		stroke: var(--accent-text);
		stroke-width: 1.8;
		stroke-linecap: round;
		stroke-linejoin: round;
	}

	.card .dot {
		fill: var(--accent-text);
		stroke: none;
	}

	h3 {
		margin-bottom: 6px;
		font-size: 17px;
		font-weight: 600;
		letter-spacing: -0.012em;
	}

	.card p {
		color: var(--muted);
		font-size: 15px;
	}

	.editor {
		padding: 112px 0 0;
		text-align: center;
	}

	h2 {
		font-size: clamp(28px, 4.4vw, 38px);
		font-weight: 650;
		line-height: 1.12;
		letter-spacing: -0.03em;
	}

	.editor > p {
		max-width: 620px;
		margin: 14px auto 0;
		color: var(--muted);
		font-size: 17px;
	}

	.shot {
		margin-top: 40px;
		overflow: hidden;
		border: 1px solid var(--line);
		border-radius: 14px;
		box-shadow: 0 30px 80px -10px var(--shadow);
	}

	.shot img {
		display: block;
		width: 100%;
		height: auto;
	}

	.shot .dark {
		display: none;
	}

	:global(:root[data-theme='dark']) .shot .light {
		display: none;
	}

	:global(:root[data-theme='dark']) .shot .dark {
		display: block;
	}

	@media (prefers-color-scheme: dark) {
		:global(:root:not([data-theme='light'])) .shot .light {
			display: none;
		}

		:global(:root:not([data-theme='light'])) .shot .dark {
			display: block;
		}
	}

	footer {
		padding: 72px 0 64px;
		color: var(--muted);
		font-size: 13px;
		text-align: center;
	}

	footer .note {
		max-width: 560px;
		margin: 10px auto 0;
		font-size: 12px;
	}

	@media (max-width: 600px) {
		.hero {
			padding-top: 80px;
		}

		.icon {
			width: 96px;
			height: 96px;
		}

		.lede {
			font-size: 17px;
		}

		.btn {
			flex: 1 1 100%;
			justify-content: center;
		}

		.features {
			padding-top: 64px;
		}

		.editor {
			padding-top: 80px;
		}
	}
</style>
