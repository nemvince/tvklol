import type { PageServerLoad } from './$types';
import { error } from "@sveltejs/kit";
import prisma from "$lib/prisma";

export const load: PageServerLoad = async ({ params }) => {
  const company = params.company;

  if (!company) {
    return error(404, "Company not found");
  }

  const review = await prisma.review.findUnique({
    where: {
      slug: company,
    },
  });

  if (!review) {
    return error(404, "Review not found");
  }

  return {
    review,
  };
};