<script lang="ts">
	import type { PageServerData } from './$types';

	let { data }: { data: PageServerData } = $props();
</script>

<svelte:head>
	<title>Review of {data.review.company} | tvk.lol</title>
</svelte:head>

<div class="prose prose-stone prose-invert ml-auto mr-auto">
	<h2 class="mb-0 text-purple-300">This is a review about me from</h2>
	<h1>{data.review.company}</h1>
	<blockquote>
		<p class="text-lg">{data.review.content}</p>
		<footer class="mt-2 text-sm text-stone-500">
			<cite class="text-purple-300">{data.review.author}</cite>
		</footer>
	</blockquote>
</div>
