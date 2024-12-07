import type { PageServerLoad } from './$types';
import { prisma } from "$lib/prisma";

export const load: PageServerLoad = async () => {
  const results = await prisma.result.findMany();
  const jobs = await prisma.job.findMany();

  return {
    results,
    jobs
  };
};