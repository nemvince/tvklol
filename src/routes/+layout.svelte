<script lang="ts">
	import '../app.css';
	let { children } = $props();
</script>

<div class="min-h-full bg-stone-900 text-stone-300">
	<div class="container ml-auto mr-auto max-w-5xl">
		<header>
			<nav class="flex items-center justify-between md:px-16 p-6">
				<div class="flex gap-2">
					<span class="text-2xl font-bold">Tamás Vince</span>
					<span class="text-2xl font-light text-stone-700">tvk.lol</span>
				</div>
				<ul class="flex gap-3 text-lg">
					<li>Link</li>
					<li>Link</li>
					<li>Link</li>
				</ul>
			</nav>
		</header>
		<main>
			{@render children()}
		</main>
	</div>
</div>
