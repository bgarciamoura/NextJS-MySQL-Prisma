import type { NextApiRequest, NextApiResponse } from 'next';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export default async function handle(_req: NextApiRequest, res: NextApiResponse) {
    const posts = await prisma.post.findMany({
        select: {
            id: true,
            post: true,
            author: true,
        },
    });
    res.json(posts);
}
