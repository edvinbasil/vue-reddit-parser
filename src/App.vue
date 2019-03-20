<template>
  <div id="app" class="container">
    <NavBar
      v-bind="{fetchReddit, url}"
      v-model="subreddit"
    />
    <main>
      <h1 class="text-center m-3">{{ title }}</h1>
      <SinglePost
        v-for="post in posts"
        :post="post"
        :key="post.data.id"
      />
    </main>
  </div>
</template>

<script>
import SinglePost from './components/SinglePost.vue';
import NavBar from './components/NavBar.vue';

export default {
  name: 'app',
  components: {
    SinglePost,
    NavBar,
  },
  data() {
    return {
      subreddit: 'all',
      title: '',
      posts: [],
      fetchError: '',
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
          this.fetchError = err.message;
        })
        .then((result) => {
          this.posts = result.data.children;
          this.title = `r/${this.subreddit}`;
        });
    },
  },
};
</script>

<style lang="scss">
</style>
