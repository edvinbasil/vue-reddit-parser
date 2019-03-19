<template>
  <div id="app" class="container mt-2">
    <h1>{{ title }}</h1>
    <main>
      <sPost v-for="post in posts" :post="post" :key="post.data.id"></sPost>
    </main>
  </div>
</template>

<script>
import sPost from './components/sPost.vue';

export default {
  name: 'app',
  components: {
    sPost,
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
