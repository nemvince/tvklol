<script lang="ts">
	import { goto } from '$app/navigation';
	import Icon from '@iconify/svelte';
	import '../app.css';
	let { children } = $props();
</script>

<div class="min-h-full bg-stone-900 text-stone-300">
	<div class="container ml-auto mr-auto max-w-5xl">
		<header>
			<nav class="flex items-center justify-between p-6 md:px-16">
				<button class="flex gap-2" onclick={() => goto('/')}>
					<span class="text-2xl font-bold">
						Tamás
						<span class="text-purple-300">Vince</span>
					</span>
					<span class="text-2xl font-light text-stone-700">tvk.lol</span>
				</button>
				<ul class="flex gap-4">
					<li>
						<a href="https://github.com/nemvince">
							<Icon icon="bi:github" class="h-6 w-6" />
						</a>
					</li>
					<li>
						<a href="/">Home</a>
					</li>
					<li>
						<a href="/about">About</a>
					</li>
				</ul>
			</nav>
		</header>
		<main>
			{@render children()}
		</main>
	</div>
</div>

<style lang="postcss" scoped>
	ul li {
		@apply transition-colors hover:text-purple-300;
	}
</style>
