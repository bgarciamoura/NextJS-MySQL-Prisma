import styled from 'styled-components';
import { GetServerSideProps } from 'next';
import { PrismaClient } from '@prisma/client';
import { useEffect } from 'react';

const prisma = new PrismaClient();

interface Post {
    id: number;
    post: string;
    // date: Date;
}

export const getServerSideProps: GetServerSideProps = async (context) => {
    let posts = null;
    try {
        posts = await prisma.post.findMany({
            select: {
                id: true,
                post: true,
            },
        });
    } catch (error) {
        throw new Error('Erro na Home: ' + error);
    }

    return {
        props: {
            posts,
        },
    };
};

const Home: React.FC<{ posts: Post[] }> = ({ posts }) => {
    useEffect(() => {
        teste();
    }, []);

    async function teste() {
        const mPosts = await fetch('http://localhost:3000/api/teste').then((response) => {
            if (!response) {
                return;
            }

            return response.json();
        });
        console.log(mPosts);
    }

    return (
        <Wrapper>
            <h1>POSTS</h1>
            <ul>
                {posts.map((post) => (
                    <li key={post.id}>
                        {post.id} - {post.post}
                    </li>
                ))}
            </ul>
        </Wrapper>
    );
};

export const Wrapper = styled.div`
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    /* width: 1200px; */

    margin: 0 auto;

    ul {
        text-decoration: none;
        list-style: none;
    }
`;

export default Home;
