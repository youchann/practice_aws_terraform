import type {NextPage} from 'next'
import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import {apiClient, apiServer} from "../utils/apiClient";
import {TestItem, TestItemResponse} from "../types/TestItem";

interface Props {
  data: TestItem
}
export async function getServerSideProps() {
  let data: TestItem = {
    id: 0,
    text: '',
    updated_at: '',
    created_at: ''
  }
  await apiServer.get<TestItemResponse>('test')
      .then((res) => {
        data = {
          id: res.data.id,
          text: res.data.text,
          updated_at: res.data.updated_at,
          created_at: res.data.created_at
        }
      }).catch(err => {
        console.error(err)
      })
  return {
    props: {
      data
    }
  }
}

export async function postData() : Promise<TestItem | null> {
  let data: TestItem = {
    id: 0,
    text: '',
    updated_at: '',
    created_at: ''
  }
  return apiClient.post<TestItemResponse>('test', {text: `sample text_${Math.ceil(Math.random() * 100)}`})
      .then(res => {
        const item: TestItemResponse = res.data
        data = {...item}
        console.log(data)
        return data
      }).catch(e => {
        console.error(e)
        return null
      })
}

const Home: NextPage<Props> = (props) => {
  return (
      <div className={styles.container}>
        <Head>
          <title>Create Next App</title>
          <meta name="description" content="Generated by create next app"/>
          <link rel="icon" href="/favicon.ico"/>
        </Head>

        <main className={styles.main}>
          <h1 className={styles.title} onClick={() => postData()}>
            Welcome to <a href="https://nextjs.org">Next.js!</a>
          </h1>
          <h2>{props.data.text}</h2>

          <p className={styles.description}>
            Get started by editing{' '}
            <code className={styles.code}>pages/index.tsx</code>
          </p>

          <div className={styles.grid}>
            <a href="https://nextjs.org/docs" className={styles.card}>
              <h2>Documentation &rarr;</h2>
              <p>Find in-depth information about Next.js features and API.</p>
            </a>

            <a href="https://nextjs.org/learn" className={styles.card}>
              <h2>Learn &rarr;</h2>
              <p>Learn about Next.js in an interactive course with quizzes!</p>
            </a>

            <a
                href="https://github.com/vercel/next.js/tree/canary/examples"
                className={styles.card}
            >
              <h2>Examples &rarr;</h2>
              <p>Discover and deploy boilerplate example Next.js projects.</p>
            </a>

            <a
                href="https://vercel.com/new?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"
                className={styles.card}
            >
              <h2>Deploy &rarr;</h2>
              <p>
                Instantly deploy your Next.js site to a public URL with Vercel.
              </p>
            </a>
          </div>
        </main>

        <footer className={styles.footer}>
          <a
              href="https://vercel.com?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"
              target="_blank"
              rel="noopener noreferrer"
          >
            Powered by{' '}
            <span className={styles.logo}>
            <Image src="/vercel.svg" alt="Vercel Logo" width={72} height={16}/>
          </span>
          </a>
        </footer>
      </div>
  )
}

export default Home