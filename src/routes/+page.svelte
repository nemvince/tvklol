<script lang="ts">
	import type { PageServerData } from './$types';
	import dayjs from 'dayjs';
	import relativeTime from 'dayjs/plugin/relativeTime';

	dayjs.extend(relativeTime);

	let { data }: { data: PageServerData } = $props();
</script>

<svelte:head>
	<title>Home | tvk.lol</title>
</svelte:head>

<div class="grid grid-cols-1 gap-8 md:grid-cols-2 md:p-8 mx-8">
	<div>
		<h1 class="mb-4 flex justify-between text-2xl font-semibold">
			<span>What I've achieved</span>
			<span class="text-right text-xl font-light text-stone-500">{data.results.length} results</span
			>
		</h1>
		<ul class="list-disc">
			{#each data.results as result}
				<li class="mb-4 flex justify-between">
					<div class="">
						<h2 class="text-xl font-bold">{result.name}</h2>
						<div class="flex gap-3">
							<p class="text-stone-400">{result.team ? 'Team' : 'Individual'}</p>
							<span class="text-stone-500">|</span>
							<p class="text-stone-400">{dayjs(result.date).fromNow()}</p>
						</div>
					</div>
					<p class="text-xl font-bold text-purple-300">
						{result.place ? `${result.place}. place` : 'Qualified'}
					</p>
				</li>
			{/each}
		</ul>
	</div>
	<div>
		<h1 class="mb-8 text-2xl font-semibold">Where I worked</h1>
		<ul class="">
			{#each data.jobs as job}
				<li class="mb-8">
					<h2 class="text-xl font-bold text-purple-300">{job.name}</h2>
					<p class="font-semibold text-stone-400">{job.position}</p>
					<div class="flex gap-3 text-stone-500">
						<p>{dayjs(job.start).format('MMMM YYYY')} - {dayjs(job.end).format('MMMM YYYY')}</p>
					</div>
					{#if job.slug}
						<a href="/review/{job.slug}" class="hover:text-purple-300 underline">Performance Review</a>
					{/if}
					<p class="mt-2 text-stone-500">{@html job.description}</p>
				</li>
			{/each}
		</ul>
	</div>
</div>
