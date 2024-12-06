<script lang="ts">
    import dayjs from "dayjs";
    import relativeTime from "dayjs/plugin/relativeTime";

    dayjs.extend(relativeTime);

    const results = [
        {
            name: "LEGO WRO Hungary",
            date: new Date("2023-06-30"),
            team: true,
            place: 7
        },
        {
            name: "Szeresd a Pingvint 2023",
            date: new Date("2023-12-06"),
            team: false,
            place: 1
        },
        {
            name: "JuniorSkills rendszerüzemeltető",
            date: new Date("2024-04-06"),
            team: false,
            place: 3
        },
        {
            name: "Nokia 2024 Tavaszi Hackathon",
            date: new Date("2024-07-01"),
            team: false,
            place: null
        },
        {
            name: "Szeresd a Pingvint 2024",
            date: new Date("2024-12-06"),
            team: false,
            place: 1
        }
    ]

    const jobs = [
        {
            name: "Nokia Solutions and Networks",
            position: "Software Developer Intern",
            date: {
                start: new Date("2023-06-01"),
                end: new Date("2023-08-31")
            },
            description: "I worked on internal tools using Python and the Robot Framework. Read my performance review <a class='text-blue-500 underline' href='#'>here</a>."
        }
    ]
</script>

<div>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 md:p-8">
        <div>
            <h1 class="font-semibold text-2xl mb-4 flex justify-between">
                <span>What I've achieved</span>
                <span class="text-right font-light text-stone-500 text-xl">{results.length} results</span>
            </h1>
            <ul class="list-disc">
                {#each results as result}
                    <li class="flex justify-between mb-4">
                        <div class="">
                            <h2 class="text-xl font-bold">{result.name}</h2>
                            <div class="flex gap-3">
                                <p class="text-stone-400">{result.team ? "Team" : "Individual"}</p>
                                <span class="text-stone-500">|</span>
                                <p class="text-stone-400">{dayjs(result.date).fromNow()}</p>
                            </div>
                        </div>
                        <p class="text-emerald-500 font-bold text-xl">{result.place ? `${result.place}. place` : "Qualified"}</p>
                    </li>
                {/each}
            </ul>
        </div>
        <div>
            <h1 class="font-semibold text-2xl mb-8">Where I worked</h1>
            <ul class="">
                {#each jobs as job}
                    <li class="mb-8">
                        <h2 class="text-xl font-bold text-blue-500">{job.name}</h2>
                        <p class="text-stone-400 font-semibold">{job.position}</p>
                        <div class="flex gap-3">
                            <p class="text-stone-500">{dayjs(job.date.start).format("MMMM YYYY")} - {dayjs(job.date.end).format("MMMM YYYY")}</p>
                        </div>
                        <p>{@html job.description}</p>
                    </li>
                {/each}
            </ul>
        </div>
    </div>
</div>