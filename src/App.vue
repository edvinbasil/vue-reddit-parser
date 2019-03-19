<template>
  <div id="app" class="container mt-2">
    <ul class="nav justify-content-end">
      <li class="nav-item">
        <form @submit.prevent="fetchReddit(url)" class=" row justify-content-end">
            <input class="form-control" type="text" v-model="subreddit">
            <button class="btn btn-primary" type="submit">Search</button>
        </form>
      </li>
    </ul>
    <h1>{{ title }}</h1>
    <main>
      <SinglePost v-for="post in posts" :post="post" :key="post.data.id"></SinglePost>
    </main>
  </div>
</template>

<script>
import SinglePost from './components/SinglePost.vue';

export default {
  name: 'app',
  components: {
    SinglePost,
  },
  data() {
    return {
      subreddit: 'PewdiepieSubmissions',
      title: 'Subreddit',
      posts: [],
    };
  },
  computed: {
    url() {
      return `https://www.reddit.com/r/${this.subreddit}/.json`;
    },
  },
  mounted() {
    this.fetchReddit(this.url);
  },

  methods: {
    fetchReddit(url) {
      fetch(url)
        .then(res => res.json())
        .catch((err) => {
          console.log(err.message);
        })
        .then((result) => {
          this.posts = result.data.children;
          this.title = this.posts[0].data.subreddit;
        });
    },
  },
};
</script>

<style lang="scss">
</style>
